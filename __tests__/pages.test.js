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
    expect(res.body).toMatchInlineSnapshot();
  });
});
