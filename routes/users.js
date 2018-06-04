const express = require('express');
const router = express.Router();

const STATUSCODE = require('../module/base/statusCode')
const getUserData = require('../module/getUserData')
const getUserInfo = require('../module/getUserInfo')
const modifyUserSex = require('../module/modifySex')

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
    }).catch(() => {
        res.send({
            status: STATUSCODE.FAIL,
            info: ''
        })
    })
})



/* 修改用户性别 */
router.post('/modifySex', (req, res) => {
    console.log(req.query)
    modifyUserSex.modifySex(req.query).then((result) => {
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



module.exports = router;
