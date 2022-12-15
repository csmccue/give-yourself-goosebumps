const pool = require('../utils/pool');

module.exports = class Page {
  id;
  pageText;

  constructor(row) {
    this.id = row.id;
    this.pageText = row.page_text;
  }

  static async getById(id) {
    const { rows } = await pool.query('SELECT * FROM pages WHERE id=$1', [id]);
    if (!rows[0]) return null;
    return new Page(rows[0]);
  }

  async addOptions() {
    const { rows } = await pool.query(
      'SELECT * FROM options WHERE page_id = $1',
      [this.id]
    );
    this.options = rows;
  }

  async addPreviousPage(page_id) {
    const { rows } = await pool.query(
      `
    SELECT * FROM paths
    WHERE target_id = $1
    `,
      [page_id]
    );
    if (rows.length > 0) {
      this.prevPage = rows[0].source_id;
    }
  }

  static async getBookOfPage(pageId) {
    const { rows } = await pool.query(`
    SELECT book_id FROM pages WHERE  `);
  }
};
