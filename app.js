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

app.use('/static', express.static(path.join(__dirname, 'public/static')))

app.use('/yourdaily/user/userAvatar', express.static(path.join(__dirname, '/public/userAvatar')))

app.use('/yourdaily/user/userDailyImg', express.static(path.join(__dirname, '/public/userDailyImg')))


app.use('/yourdaily', indexRouter)

app.use('/yourdaily/users', usersRouter)


module.exports = app
