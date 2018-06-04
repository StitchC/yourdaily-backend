const db = require('./lib/mysql')


// 检查用户的登录账号和密码是否正确
// @param loginInfo {Object} - 用户登录的账号和密码
let userCorrect = (loginInfo) => {
    let sql = `select * from user where account = '${loginInfo.account}' and password = '${loginInfo.pwd}'`

    let data = {}

    return new Promise((resolve, reject) => {
        db.query(sql, (err, result) => {
            if(err) {
                return reject(err)
            }

            if(result.length > 0) {
                // 账号正确
                data.status = true
                data.info = result[0]
                return resolve(data)
            }else {
                data.status = false
                return resolve(data)
            }
        })
    })
    
}




async function login(loginInfo) {
    let result = await userCorrect(loginInfo)

    return result;
}

exports.login = login