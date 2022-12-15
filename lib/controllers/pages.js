const { Router } = require('express');
const Page = require('../models/Page');
const User = require('../models/User');
const authenticate = require('../middleware/authenticate');
const Path = require('../models/Path');

module.exports = Router()
  .get('/:id', authenticate, async (req, res, next) => {
    try {
      const bookId = await Page.getBookOfPage(req.params.id);
      const page = await Page.getCurrentPage(req.user.id, bookId);
      console.log('page ', page);
      await page.addOptions();
      await page.addPreviousPage(req.params.id);
      res.json(page);
    } catch (e) {
      next(e);
    }
  })
  .post('/:id', authenticate, async (req, res, next) => {
    try {
      if (req.body.sourceId !== null) {
        await Path.addNewPath({
          userId: req.user.id,
          sourceId: req.body.sourceId,
          targetId: req.params.id,
        });
        await Page.updateCurrentPage(req.user.id, req.params.id);
      }
      const page = await Page.getById(req.params.id);
      await page.addOptions();
      await page.addPreviousPage(req.params.id);
      res.json(page);
    } catch (e) {
      next(e);
    }
  });
