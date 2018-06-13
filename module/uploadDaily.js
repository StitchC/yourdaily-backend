const fs = require('fs')
const fsextra = require('fs-extra')
const path = require('path')
const uuid = require('uuid/v4')
const db = require('./lib/mysql')


const saveFileUrl = path.join(__dirname, '../', 'public/userDailyImg/')  // 图片实际保存的位置
const saveFileUrlInDb = '/yourdaily/user/userDailyImg/'  // 写入数据库的图片路径



// 提取日记的json 数据
// @param json {Object} - 一个带有express 临时路径path 的对象
// 前端发送过来的数据是一个二进制数据的 json
// @return result {jsonObject} - 一个包含所有日记数据（除图片以外）
let parseJson = function(dailyInfo) {
    return new Promise((resolve, reject) => {
        let path = dailyInfo.path

        fs.readFile(path, 'utf8', (err, data) => {
            if(err) {
                reject(err)
            }
            let result = JSON.parse(data)

            resolve(result)
        })
    })
}



// 提取图片
// @param imgs {Array:[Object]} - 传入一个image 二进制对象的数组
// @param dailyIndex {String} - 当前保存日记的hash 字符串
// @return imgsData {Array<string>} - 返回所有保存图片的虚拟路径
let extractImg = function(imgs, dailyIndex) {
    // 如果只有单张图片
    // 将它变成一个数组
    if(!Array.isArray(imgs)) {
        imgs = [imgs]
    }
    let count = 0
    let imgLen = imgs.length
    let result = []


    return new Promise((resolve, reject) => {

        imgs.forEach((img, index) => {

            let extName = '.' + img.type.slice(img.type.indexOf('/') + 1)
            
            let newFileName = saveFileUrl +  dailyIndex + index + extName// 生成新的图片文件名

            fsextra.copy(img.path, newFileName, (err) => {
                if(!err) {
                    count++
                    fs.unlink(img.path, (err) => {
                        if(!err) {
                            console.log('移除临时文件成功')
                        }
                    }) 
                    // 移除暂存文件
                    result.push(saveFileUrlInDb + dailyIndex + index + extName)
                }

                if(count >= imgLen) {
                    resolve(result)
                }

                if(err) {
                    reject(err)
                }
                
            })
        })
    })
    
}



// 插入数据库表
// @param dailyInfo {Object} - 日记的内容数据
// @param dailyImgs {Array<string>} - 日记图片保存的路径
// @param dailyIndex {String} - 日记的id 
let insertData = function(dailyInfo, dailyImgs, dailyIndex) {
    let {id, title, content, mood, weather} = dailyInfo

    title === '' ? '未命名': title

    let imgsPath = dailyImgs.join(',')


    let sql = `insert into daily(id,userid,title,content,image,mood,weather)values ('${dailyIndex}','${id}', '${title}','${content}','${imgsPath}','${mood}','${weather}')`


    return new Promise((resolve, reject) => {
        db.query(sql, err => {
            if(err) {
                console.log(err)
                reject(err)
            }

            resolve(true)
        })
    })


}




async function uploadDaily(dailyData) {
    // 生成本次保存日记的uuid
    let dailyId = uuid()

    let dailyInfo = await parseJson(dailyData.dailyInfo)

    let imgData = []

    // 判断用户是否有上传图片
    if(dailyData.files) {
        imgData = await extractImg(dailyData.files, dailyId)
    }else {
        imgData = []
    }

    // 插入数据库表
    let insertDatabase = await insertData(dailyInfo, imgData, dailyId)

    console.log(dailyInfo, imgData)
    return true
}


exports.doUploadDaily = uploadDaily