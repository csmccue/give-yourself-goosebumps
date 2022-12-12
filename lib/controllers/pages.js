const { Router } = require('express');
const Page = require('../models/Page');

module.exports = Router().get('/:id', async (req, res, next) => {
  try {
    const page = await Page.getById(req.params.id);
    await page.addOptions();
    if (!page) {
      next();
    } else {
      res.json(page);
    }
  } catch (e) {
    next(e);
  }
});
