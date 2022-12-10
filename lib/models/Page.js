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
    return new Page(rows[0]);
  }

  async addOptions() {
    const { rows } = await pool.query(
      'SELECT * FROM options WHERE page_id = $1',
      [this.id]
    );
    this.options = rows;
  }
};
