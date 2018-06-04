const db = require('./lib/mysql')


// 获取用户的信息
// @param userId {String} - 用户的id
let getUserInfo = function(userId) {
    let sql = `select username, id, avatar,sex,motto,connect, matchStatus from user where id = '${userId}'`

    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            if(err) {
                reject(err)
            }
            
            resolve(result)
        })
    })
}



// 获取用户的日记的各项数据统计包括：篇数，总字数，所有图片的路径
// @param userId {String} - 用户id
let queryUserDailyInfo = function(userId) {
    let sql = `select content, image from daily where userid = '${userId}'`

    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            if(err) {
                reject(err)
            }
            
            resolve(result)
        })
    })
}



// 提取日记的数据
// @param dailys {Array} - 对应用户的所有日记数据
// @return dailyDetail {Object} - 所有日记的提取后的数据
let fetchDailyDetailData = function(dailys) {
    let dailyWords = 0                  // 计算日记的总字数
    let dailysAmount = dailys.length    // 计算日记的总篇数
    let dailyImgs = []                  // 保存所有的日记的图片路径

    dailys.forEach(daily => {
        dailyWords += daily.content.length
        if(daily.image !== '') {
            dailyImgs = dailyImgs.concat(daily.image.split(','))
        }
    })

    return {
        count: dailysAmount,
        words: dailyWords,
        images: dailyImgs
    }

} 




// 模块出口
async function outputUserInfo(userId) {
    
    let dailyInfo = await queryUserDailyInfo(userId)
    let userData = await getUserInfo(userId)

    userData = userData[0]

    let dailyDetail = fetchDailyDetailData(dailyInfo)
    
    console.log(Object.assign(userData, dailyDetail))
    

    return Object.assign(userData, dailyDetail)
}

exports.outputUserInfo = outputUserInfo