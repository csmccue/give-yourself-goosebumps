const pool = require('../utils/pool');

module.exports = class Path {
  id;
  userId;
  sourceId;
  targetId;
  constructor(row) {
    this.id = row.id;
    this.userId = row.user_id;
    this.sourceId = row.source_id;
    this.targetId = row.target_id;
  }

  static async getAllPaths(user) {
    const { rows } = await pool.query(
      `
  SELECT * FROM paths where user_id = $1
    `,
      [user]
    );
    if (!rows[0]) return null;

    return rows.map((row) => new Path(row));
  }

  static async addNewPath({ userId, sourceId, targetId }) {
    const { rows } = await pool.query(
      `
    INSERT INTO paths (user_id, source_id, target_id)
    values ($1, $2, $3)
    returning *
        `,
      [userId, sourceId, targetId]
    );
    return new Path(rows[0]);
  }
};
