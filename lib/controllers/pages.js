const { Router } = require('express');
const Page = require('../models/Page');
const User = require('../models/User');
const authenticate = require('../middleware/authenticate');
const Path = require('../models/Path');

module.exports = Router()
  .get('/:id', [authenticate], async (req, res, next) => {
    try {
      // const page = await Page.getById(req.params.id);
      const book = await Page.getBookOfPage(req.params.id);
      const page = await Page.getCurrentPage(req.user.id, book.id);
      await page.addOptions();
      await page.addPreviousPage(req.params.id);
      const user = new User({
        id: req.user.id,
        first_name: req.user.firstName,
        last_name: req.user.lastName,
        email: req.user.email,
        current_page: req.user.currentPage,
      });
      await user.updateCurrentPage(req.params.id);
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
      }
      const page = await Page.getById(req.params.id);
      await page.addOptions();
      await page.addPreviousPage(req.params.id);
      const user = new User({
        id: req.user.id,
        first_name: req.user.firstName,
        last_name: req.user.lastName,
        email: req.user.email,
        current_page: req.user.currentPage,
      });
      await user.updateCurrentPage(req.params.id);
      res.json(page);
    } catch (e) {
      next(e);
    }
  });
