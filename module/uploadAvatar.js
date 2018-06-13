
const fs = require('fs')
const path = require('path')
const fsextra = require('fs-extra')
const db = require('./lib/mysql')

const saveFileUrl = path.join(__dirname, '../', 'public/userAvatar/')  // 图片实际保存的位置
const saveFileUrlInDb = '/yourdaily/user/userAvatar/'  // 写入数据库的图片路径




// 删除旧头像
const dropOldAvatar = async function(filePath) {
    return await new Promise((resolve, reject) => {
        fs.unlink(filePath, err => {
            if(err) {
                reject(err)
            }

            resolve()
        })
    })
}



// 判断是否有旧头像
// @param userId {String} - 用户的id
const hasOldAvatar = async function(userId) {
    return await new Promise((resolve, reject) => {
        let sql = `select avatar from user where id = '${userId}'`
        db.query(sql, (err, data) => {
            if(err) {
                reject(err)
            }
            
            console.log(data)
            if(data[0].avatar !== '') {
                resolve(data[0].avatar)
            }else {
                resolve(false)
            }
        })
    })
}



// 生成新的头像
// @param avatarFile {Object} - 一个临时保存的图片对象
// @return dbPath {String} - 存到数据库的路径
const createNewAvatar = async function(avatarFile, userId) {
    return await new Promise((resolve, reject) => {
        let unique = new Date().getTime().toString()
        unique = unique.slice(unique.length - 3)    // 生成头像文件的唯一标识

        let tempFilePath = avatarFile.path        // 临时保存文件的路径
        let ext = avatarFile.type.split('/')[1]   // 提取图片的扩展名
        let dbPath = `${saveFileUrlInDb}${userId}avatar${unique}.${ext}` // 存储到数据库的头像图片路径
        let realFilePath = `${saveFileUrl}${userId}avatar${unique}.${ext}` // 存储到硬盘上的路径
        fsextra.copy(tempFilePath, realFilePath, err => {
            if(err) {
                reject(err)
            }
            // 删除临时文件
            fs.unlink(tempFilePath, err => {
                if(err) {
                    reject('临时文件删除失败')
                }
                // 生成完图片之后就可以 resolve 了
                resolve(dbPath)
            })

        })
    })
}


// 提取用户id
// @param idJsonBlob {Blob} - 一个二进制文件 由客户端通过formdata 传递过来包含着用户id
// @return id {String} - 返回当前用户的的id
let extractUserId = async function(idJsonBlob) {
    return await new Promise((resolve, reject) => {
        fs.readFile(idJsonBlob.path, 'utf8', (err, data) => {
            if(err) {
                reject(err)
            }

            resolve(JSON.parse(data).id)
        })
    })
}


// 将新头像路径插入到数据库
let insertAvatarUrlInDb = async function(avatarPath, userId) {
    let sql = `update user set avatar = '${avatarPath}' where id = '${userId}'`

    await new Promise((resolve, reject) => {
        db.query(sql, err => {
            if(err) {
                reject(err)
            }

            resolve()
        })
    })
}



// 保存用户头像
let saveUserAvatar = async function(avatarFile, userId) {
    // 获取到保存到数据库的用户头像url
    let avatarDbPath = await createNewAvatar(avatarFile, userId)

    let _hasOldAvatar = await hasOldAvatar(userId)

    // 如果有旧头像 删除旧头像
    if(_hasOldAvatar) {
        // 提取真实的文件存储路径
        let realPath = `${saveFileUrl}${_hasOldAvatar.slice(_hasOldAvatar.lastIndexOf('/') + 1)}`

        // 删除文件
        await dropOldAvatar(realPath)
    }

    // 将新的头像路径插入到数据库
    console.log(avatarDbPath)
    await insertAvatarUrlInDb(avatarDbPath, userId)
}



// 模块出口
// @param userDataBlob {Array} - 客户端传递过来的二进制数据
async function uploadAvatar(userDataBlob) {
    // 提取userId
    let userId =  await extractUserId(userDataBlob.id)

    await saveUserAvatar(userDataBlob.avatar, userId)
    
}


exports.doUploadAvatar = uploadAvatar