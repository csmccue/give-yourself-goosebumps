const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');
const UserService = require('../lib/services/UserService');
const User = require('../lib/models/User');
const Page = require('../lib/models/Page');
User;

const mockUser = {
  firstName: 'Test',
  lastName: 'User',
  email: 'test@example.com',
  password: '12345',
};

const registerAndLogin = async (userProps = {}) => {
  const password = userProps.password ?? mockUser.password;
  const agent = request.agent(app);
  const user = await UserService.create({ ...mockUser, ...userProps });
  const { email } = user;
  await agent.post('/api/v1/users/sessions').send({ email, password });
  return [agent, user];
};

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });
  it('current_page in users table is updated when authenticated user navigates to new page', async () => {
    const [agent, user] = await registerAndLogin();
    expect(user.currentPage).toBe('1');
    await agent.get('/api/v1/pages/2');
    const updatedUser = await User.getByEmail(mockUser.email);
    expect(updatedUser.currentPage).toBe('2');
  });
  it('authenticated user can view pages', async () => {
    const [agent] = await registerAndLogin();

    const res = await agent.get('/api/v1/pages/1');
    expect(res.body).toMatchInlineSnapshot(`
      Object {
        "id": "1",
        "options": Array [
          Object {
            "id": "1",
            "option_text": "Go to PAGE 2",
            "page_id": "1",
            "target_page": "2",
          },
        ],
        "pageText": "\\"What do you want to do?”
      “I don’t know, Patty. What do you want to do?”
      “Not fair, Brad. I asked you first.”
      Patty and Brad. Your two best friends. Arguing. As usual.
      It’s the last week of August. And Patty and Brad haven’t stopped fighting since your summer vacation started.
      Patty likes being bossy. You don’t mind, though. It’s no big deal.
      It’s hard to win a fight with her anyway. You don’t know why Brad even tries. You guess it’s because he doesn’t want to look like a wimp in front of a girl.
      “There’s nothing to do. I guess I’ll just go home,” Brad says. He shoves his hands in his pockets. Then his shoulders slump and he sort of shrivels up. You guess Brad is kind of a wimp — even if he is your best friend.
      “You’re so boring, Brad,” Patty complains. Whenever Patty complains, her freckles really pop out. Now there are about a million of them spread across her face.
      “Hey! I know what we should do!” Patty suddenly bursts out.",
      }
    `);
  });

  test('POST /pages/2 adds new path to user paths and redirects to GET /pages/2', async () => {
    const password = mockUser.password;
    const agent = request.agent(app);
    const user = await UserService.create({ ...mockUser });
    const { email } = user;
    await agent.post('/api/v1/users/sessions').send({ email, password });
    const res = await agent.post('/api/v1/pages/2').send({ sourceId: 1 });
    const page = new Page({ id: res.body.id, page_text: res.body.pageText });
    await page.addPreviousPage(res.body.id);

    expect(res.status).toBe(200);
  });
});
