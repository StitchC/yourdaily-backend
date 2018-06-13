const db = require('./lib/mysql')

// 修改数据库用户的性别
// @params userInfo {Object} - 用户的id 以及 用户修改性别的内容
let updateUserSex = function(userInfo) {
    console.log(userInfo.sex, userInfo.id)
    
    let sql = `update user set sex = '${userInfo.sex}' where id = '${userInfo.id}'`
    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            if(err) {
                reject(err)
            }

            resolve(true)
        })
    })
    
}


// 模块出口
async function modifySex(userInfo) {
    let result = await updateUserSex(userInfo)

    return result
}

exports.modifySex = modifySex