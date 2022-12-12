const { Router } = require('express');
const Page = require('../models/Page');
const authenticate = require('../middleware/authenticate');

module.exports = Router().get(
  '/:id',
  [authenticate],
  async (req, res, next) => {
    try {
      const page = await Page.getById(req.params.id);
      await page.addOptions();
      res.json(page);
    } catch (e) {
      next(e);
    }
  }
);
