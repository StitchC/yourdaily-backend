const fs = require('fs')
const path = require('path')
const db = require('./lib/mysql')

// 实际存储图片的路径
const realFilePath = path.join(__dirname, '..', '/public/userDailyImg/')



// 提取实际的存储文件路径
// @param filePath {Array<string>} - 数据库查询出来的文件路径
// @return realFiles {Array<string>} - 返回实际存储的文件路径
let findRealFilePath = function(filePath) {
    let realFilesPath = []

    filePath.forEach(img => {
        if(img.image) {
            let file = img.image
            let fileName = realFilePath + file.slice(file.lastIndexOf('/') + 1)
            realFilesPath.push(fileName)
        }
    })

    return realFilesPath
}



// 查询数据库的图片路径
let findImgInDb = function(dailyId) {
    let sql = `select image from daily where id = '${dailyId}'`

    return new Promise((resolve, reject) => {
        db.query(sql, (err, imgs) => {
            if(err) {
                console.log(err)
                reject(err)
            }
            resolve(imgs)
        })
    })
}



// 删除图片方法
// @param realFilesPath {Array<string>} - 图片在服务器保存的位置
let doDeleteImg = async function(realFilesPath) {
    await new Promise((resolve, reject) => {
        let count = 0
        realFilesPath.forEach(file => {
            fs.unlink(file, err => {
                if(err) {
                    console.log('删除图片失败', err)
                    reject(err)
                }
                count++
                if(count >= realFilesPath.length) {
                    resolve()
                }
            })
        })
    })
}



// 定义删除图片方法
let dropImg = async function(dailyId) {
    // 找到数据库保存的图片路径
    let filesInDb = await findImgInDb(dailyId)
    // 根据数据库保存的路径变成真是的图片存储位置
    let realFilePath = findRealFilePath(filesInDb)
    // 如果有图片
    if(realFilePath.length > 0) {
        await doDeleteImg(realFilePath)
    }
}


// 删除数据库日记记录
let doDeleteDaily = async function(dailyId) {
    let sql = `delete from daily where id = '${dailyId}'`

    return new Promise((resolve, reject) => {
        db.query(sql, err => {
            if(err) {
                console.log('数据库删除数据失败', err)
                reject(err)
            }
            resolve()
        })
    })
}



// 出口函数
async function deleteDaily(dailyId) {
    // 首先删图片
    await dropImg(dailyId)
    // 再删除数据库数据
    await doDeleteDaily(dailyId)
}

exports.doDeleteDaily = deleteDaily