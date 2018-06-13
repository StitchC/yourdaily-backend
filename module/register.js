const uuid = require('uuid/v4')
const db = require('./lib/mysql')


// @param registerInfo {Object} - 注册用户的信息参数
// @return Boolean false -
let userExist = registerInfo => {
    
    let sql = `select * from user where account = '${registerInfo.account}'`
    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            if(err) {
                return reject(err)
            }
    
            if(result.length > 0) {
                return resolve(true)
            }else {
                return resolve(false)
            }
        })
    })
   
}

// 插入注册用户的信息
// @param registerInfo {Object} - 注册用户的信息
// @return Boolean false 插入数据表失败 true 插入数据表成功
let insertUser = registerInfo => {
    
     // 生成hash id
     let id = uuid()

     let sql = `insert into user (id,account,password)values ('${id}','${registerInfo.account}','${registerInfo.pwd}')`
    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            
            if(err) {
                return reject(err)
            }else {
                return resolve(true)
            }
         })
    })
    
}


// 模块的出口
// @param registerInfo {Object} - 注册用户的信息
// @return Boolean false - 表示用户存在 插入数据表失败   true - 表示插入数据表成功
async function registerInfo(registerInfo) {
    let isExist = await userExist(registerInfo)
    if(!isExist) {
        let insertUserReuslt = await insertUser(registerInfo)
        
        if(insertUserReuslt) {
            return true
        }
    }

    return false
}


exports.register = registerInfo