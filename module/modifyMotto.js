const db = require('./lib/mysql')

let updateUserMotto = function(userInfo) {
    let sql = `update user set motto = '${userInfo.motto}' where id = '${userInfo.id}'`
    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            if(err) {
                reject(err)
            }

            resolve(true)
        })
    })
}


/* 模块出口 */
async function modifyUserMotto(userInfo) {
    return await updateUserMotto(userInfo)
}



exports.doModifyUserMotto = modifyUserMotto