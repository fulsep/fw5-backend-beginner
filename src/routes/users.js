const users = require('express').Router();

const { createUser } = require('../controllers/users');

users.post('/', createUser);

module.exports = users;