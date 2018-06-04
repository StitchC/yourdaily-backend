const express = require('express')
const router = express.Router()


const doRegister = require('../module/register')
const doLogin = require('../module/login')
const STATUSCODE = require('../module/base/statusCode')

/* 用户注册. */
router.post('/register', (req, res) => {
  console.log(req.body.account);
  let result = doRegister.register(req.body).then((result) => {
    if(result) {
      res.send({
          status: STATUSCODE.SUCCESS,
          info: ''
      })
    }else {
        res.send({
            status: STATUSCODE.FAIL,
            info: ''
        })
    }
  })
})



/* 用户登录 */
router.get('/login', (req, res) => {
  doLogin.login(req.query).then((data) => {
    if(data.status) {
      res.send({
        status: STATUSCODE.SUCCESS,
        info: {
          id: data.info.id,
          connect: data.info.connect,
          sex: data.info.sex
        }
      })
    }else {
      res.send({
        status: STATUSCODE.FAIL,
        info: ''
      })
    }
  })
  
}) 




module.exports = router
