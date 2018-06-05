const express = require('express');
const router = express.Router();

const STATUSCODE = require('../module/base/statusCode')
const getUserData = require('../module/getUserData')
const getUserInfo = require('../module/getUserInfo')
const modifyUserSex = require('../module/modifySex')
const modifyUserMotto = require('../module/modifyMotto')
const modifyUserName = require('../module/modifyUserName')

/* 获取用户全部数据 */
router.get('/getUserData', (req, res) => {
    getUserData.outputData(req.query).then((data) => {
        res.send(data)
    })
})


/* 获取用户的个人信息数据 */
router.get('/getUserInfo', (req, res) =>{

    getUserInfo.outputUserInfo(req.query.id).then((result) => {
        res.send({
            status: STATUSCODE.SUCCESS,
            info: result
        })
    }).catch((err) => {
        res.send({
            status: STATUSCODE.FAIL,
            info: err
        })
    })
})



/* 修改用户性别 */
router.post('/modifySex', (req, res) => {
    modifyUserSex.modifySex(req.query).then((result) => {
        res.send({
            status: STATUSCODE.SUCCESS,
            info: ''
        })
    }).catch((err) => {
        res.send({
            status: STATUSCODE.FAIL,
            info: err
        })
    })
})



/* 修改用户格言 */
router.post('/modifyMotto', (req, res) => {
    modifyUserMotto.doModifyUserMotto(req.query).then((result) => {
        res.send({
            status: STATUSCODE.SUCCESS,
            info: ''
        })
    }).catch((err) => {
        res.send({
            status: STATUSCODE.FAIL,
            info: err
        })
    })
})



/* 修改用户昵称 */
router.post('/modifyUserName', (req, res) => {
    modifyUserName.doModifyUserName(req.query).then((result) => {
        res.send({
            status: STATUSCODE.SUCCESS,
            info: ''
        })
    }).catch((err) => {
        res.send({
            status: STATUSCODE.FAIL,
            info: err
        })
    })
})




module.exports = router;
