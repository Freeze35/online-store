
// Importing the module
const express = require("express")
// Creating express Router
const router = express.Router()
const userController = require('../controllers/userController')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/registration', userController.registration)
router.post('/login', userController.login)
router.get('/auth',authMiddleware, userController.check)
router.get('/users', userController.takeUsers)

module.exports = router