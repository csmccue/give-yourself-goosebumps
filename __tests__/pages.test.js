const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('user routes', () => {
  beforeEach(() => {
    return setup(pool);
  });
  afterAll(() => {
    pool.end();
  });
  it('gets the right page', async () => {
    const res = await request(app).get('/api/v1/pages/1');
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
});
