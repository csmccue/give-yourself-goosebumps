const { Router } = require('express');
const Page = require('../models/Page');
const User = require('../models/User');
const authenticate = require('../middleware/authenticate');

module.exports = Router().get(
  '/:id',
  [authenticate],
  async (req, res, next) => {
    try {
      const page = await Page.getById(req.params.id);
      await page.addOptions();
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
  }
);
