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

  static async getAllPathsToTarget(userId, targetId) {
    const { rows } = await pool.query(
      `
    SELECT *
    FROM paths
    WHERE user_id = $1
    AND target_id = $2
    `,
      [userId, targetId]
    );
    console.log('all paths to target ', rows);
    return rows.map((row) => new Path(row));
  }

  static async addNewPath({ userId, sourceId, targetId }) {
    console.log('can you see me');
    const oldPaths = await Path.getAllPathsToTarget(userId, targetId);
    console.log('old paths ', oldPaths);
    for (const path of oldPaths) {
      console.log('oisgoigij ', path, sourceId);
      if (path.sourceId === sourceId) {
        const deleted = await pool.query(
          'DELETE FROM paths WHERE id = $1 RETURNING *',
          [path.id]
        );
        console.log('deleted ', deleted);
      } else {
        const updated = await pool.query(
          'UPDATE paths SET recent = false WHERE id = $1 RETURNING *',
          [path.id]
        );
        console.log('updated ', updated);
      }
    }
    const { rows } = await pool.query(
      `
    INSERT INTO paths (user_id, source_id, target_id)
    VALUES ($1, $2, $3)
    RETURNING *
        `,
      [userId, sourceId, targetId]
    );
    return new Path(rows[0]);
  }
};
