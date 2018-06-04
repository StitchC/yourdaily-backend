const express = require('express')
const path = require('path')
const cookieParser = require('cookie-parser')
const logger = require('morgan')
const bodyParser = require('body-parser')

const indexRouter = require('./routes/index')
const usersRouter = require('./routes/users')


const app = express()

app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(bodyParser({
    keepExtensions: true
}))
app.use(express.static(path.join(__dirname, 'public')))


app.use('/yourdaily', indexRouter)

app.use('/yourdaily/users', usersRouter)


module.exports = app
