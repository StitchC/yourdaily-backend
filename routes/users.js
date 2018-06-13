const express = require('express')
const router = express.Router()
const multipart = require('connect-multiparty')

const STATUSCODE = require('../module/base/statusCode')
const getUserData = require('../module/getUserData')
const getUserInfo = require('../module/getUserInfo')
const modifyUserSex = require('../module/modifySex')
const modifyUserMotto = require('../module/modifyMotto')
const modifyUserName = require('../module/modifyUserName')
const uploadDaily = require('../module/uploadDaily')
const deleteDaily = require('../module/deleteDaily')
const uploadAvatar = require('../module/uploadAvatar')

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
    modifyUserSex.modifySex(req.body).then((result) => {
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
    modifyUserMotto.doModifyUserMotto(req.body).then((result) => {
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
    modifyUserName.doModifyUserName(req.body).then((result) => {
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


/* 上传日记接口 */
router.post('/uploadDaily',multipart(), (req, res) => {
    uploadDaily.doUploadDaily(req.files).then(() => {
        res.send({
            status: STATUSCODE.SUCCESS,
            info: ''
        })
    }).catch((err) => {
        console.log(err)
        res.send({
            status: STATUSCODE.FAIL,
            info: ''
        })
    })

})

/* 删除日记接口 */
router.post('/deleteDaily', (req, res) => {
    deleteDaily.doDeleteDaily(req.body.id).then(() => {
        res.send({
            status: STATUSCODE.SUCCESS,
            info: ''
        })
    }).catch((err) => {
        console.log(err)
        res.send({
            status: STATUSCODE.FAIL,
            info: ''
        })
    })
})




/* 上传头像接口 */
router.post('/uploadAvatar',multipart(), (req, res) => {
    uploadAvatar.doUploadAvatar(req.files).then(() => {
        res.send({
            status: STATUSCODE.SUCCESS,
            info: ''
        })
    }).catch(err => {
        console.log(err)
        res.send({
            status: STATUSCODE.FAIL,
            info: ''
        })
    })
})


module.exports = router;
