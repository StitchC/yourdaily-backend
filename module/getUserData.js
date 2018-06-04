const db = require('./lib/mysql')


// 获取关联用户数据的方法
// @param queryString {String} - 查询关联用户的sql 语句
let getRelateUserDaily = function(queryString) {
    return new Promise((resolve, reject) => {
        db.query(queryString, (err, result) => {
            if(err) {
                reject(err)
            }

            resolve(result)
        })
    })
}



// 获取用户自己的日记数据
// @param queryString {String} - 查询用户自己的sql 语句
let getSelfDaily = function(queryString) {
    return new Promise((resolve, reject) => {
        db.query(queryString, (err, result) => {
            if(err) {
                reject(err)
            }

            resolve(result)
        })
    })
}


// 统计用户的日记字数
// @param dailys {Array} - 用户自己的日记数据
// @return words {Number} - 日记总字数
let countDailyWords = function(dailys) {
    let totalWords = 0

    dailys.forEach(daily => {
        totalWords += daily.content.length
    })

    return totalWords
}


// 获取用户全部的日记图片
// @param dailys {Array} - 用户自己的日记数据
// @return imgs {Array} - 所有图片路径的数组
let totalDailyImages = function(dailys) {
    let images = []

    dailys.forEach(daily => {
        if(daily.images !== '') {
            images = images.concat(daily.image.split(','))
        }
    })

    return images
}


// 获取用户资料
// @param userId {String} - 用户id
let getUserInfo = function(userId) {
    let sql = `select username, id, avatar, sex, motto, matchStatus, connect from user where id = '${userId}'`
    
    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            if(err) {
                reject(err)
            }
 
            resolve(result)
        })
    })
    
}



// 整理用户数据
// @param userInfo {Object} - 用户信息 
let arrangeUserData = async function(userInfo) {
    let dailys = []
    if(userInfo.connectId) {
        let getRelateUserDailySql = `select daily.id,daily.userid,title,content,image,mood, weather,publictime,user.sex from daily, user where daily.userid = user.id and daily.userid = '${userInfo.connectId}' order by daily.publictime desc limit 0,3`

        // 获取用户关联用户的日记数据
        let relateUserDaily = await getRelateUserDaily(getRelateUserDailySql)
        dailys = dailys.concat(relateUserDaily)
    }

    let getSelfDailySql = `select daily.id,daily.userid,title,content,image,mood, weather,publictime,user.sex from daily, user where daily.userid = user.id and daily.userid = '${userInfo.id}' order by daily.publictime desc`
    
    // 获取用户自己的日记数据
    let selfDaily = await getSelfDaily(getSelfDailySql)
    dailys = dailys.concat(selfDaily)

    let totalWords = countDailyWords(selfDaily)     // 获取总字数
    let totalImages = totalDailyImages(selfDaily)   // 获取所有的日记图片
    let dailysAmount = selfDaily.length             // 获取日记的总篇数
    
    let userInfoData = await getUserInfo(userInfo.id)   // 获取用户的信息
    userInfoData = userInfoData[0]

    
    // 组装数据
    let result = {}
    result.daily = {}
    result.info = {}

    dailys.forEach((daily) => {
        result.daily[daily.id] = daily
    })

    for(let key in userInfoData) {
        result.info[key] = userInfoData[key]
    }
    // 全部日记的图片
    result.info.images = totalImages
    // 全部日记字数
    result.info.words = totalWords
    // 全部日记的数量
    result.info.count = dailysAmount
    
    return result
    
    
}



// 模块出口
// @return result {Array} - 返回匹配的用户数据
async function getUserData(userInfo) {
    let result = await arrangeUserData(userInfo)

    return result
}


exports.outputData = getUserData