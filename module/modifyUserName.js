const db = require('./lib/mysql')

let updateUserName = function(userInfo) {
    let sql = `update user set username='${userInfo.username}' where id='${userInfo.id}'`

    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            if(err) {
                console.log(err)
                reject(err)
            }

            resolve(true)
        })
    })
}


/* 模块出口 */
async function doModifyUserName(userInfo) {
    return await updateUserName(userInfo)
}



exports.doModifyUserName = doModifyUserName