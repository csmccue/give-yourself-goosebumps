const pool = require('../utils/pool');

module.exports = class Page {
  id;
  pageText;
  isFirst;

  constructor(row) {
    this.id = row.id;
    this.pageText = row.page_text;
    this.isFirst = row.is_first;
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
    const { rows } = await pool.query(
      `
    SELECT book_id FROM pages WHERE id=$1`,
      [pageId]
    );
    if (rows[0].book_id) return rows[0].book_id;
  }

  static async getCurrentPage(userId, bookId) {
    const { rows } = await pool.query(
      `
      SELECT *
      FROM current_pages
      LEFT JOIN pages
      ON pages.id = current_pages.page_id
      WHERE current_pages.user_id = $1
      AND pages.book_id = $2
    `,
      [userId, bookId]
    );
    if (rows.length > 0) return new Page(rows[0]);
    else {
      await Page.addCurrentFirstPage(userId, bookId);
      const firstPage = await Page.getFirstPage(bookId);
      const page = await Page.getById(firstPage);
      return page;
    }
  }

  static async addCurrentFirstPage(userId, bookId) {
    const firstPage = await Page.getFirstPage(bookId);
    const { rows } = await pool.query(
      `
    INSERT INTO current_pages (
      user_id,
      page_id
    )
    VALUES
    ($1, $2)
    RETURNING *
    `,
      [userId, firstPage]
    );
    return rows[0];
  }

  static async updateCurrentPage(userId, pageId) {
    const bookId = await Page.getBookOfPage(pageId);
    const { rows } = await pool.query(
      `
      SELECT page_id
      FROM current_pages
      LEFT JOIN pages
      ON pages.id = current_pages.page_id
      WHERE pages.book_id = $1
      AND current_pages.user_id = $2
    `,
      [bookId, userId]
    );
    const resp = await pool.query(
      `
    UPDATE current_pages
    SET page_id = $1
    WHERE page_id = $2
    RETURNING *
    `,
      [pageId, rows[0].page_id]
    );
    return resp.rows;
  }

  static async getFirstPage(bookId) {
    const { rows } = await pool.query(
      `
      SELECT id
      FROM pages
      WHERE book_id = $1
      AND is_first = TRUE
      `,
      [bookId]
    );
    if (rows[0].id) return rows[0].id;
  }

  static async getAllPrevPages(userId, pageId) {
    const story = [];
    let currentPageId = pageId;
    let currentPage = await Page.getById(pageId);
    let counter = 0;
    while (!currentPage.isFirst && counter < 30) {
      const { rows } = await pool.query(
        `
      SELECT * 
      FROM pages
      LEFT JOIN paths
      ON paths.source_id = pages.id
      WHERE paths.user_id = $1
      AND paths.target_id = $2
      AND paths.recent = TRUE
      `,
        [userId, currentPageId]
      );
      const prevPage = rows[0];
      // story.push(new Page(prevPage));
      currentPageId = prevPage.source_id;
      currentPage = Page.getById(currentPageId);
      counter++;
    }
    return story;
  }
};
