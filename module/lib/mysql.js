const mysql = require('mysql');
const mysqlConfig = require('../../config/mysql.config');

// 创建数据库链接
const connection = mysql.createPool(mysqlConfig.config);

module.exports = connection;