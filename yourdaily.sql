-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 年 01 月 23 日 16:04
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `yourdaily`
--

-- --------------------------------------------------------

--
-- 表的结构 `daily`
--

CREATE TABLE IF NOT EXISTS `daily` (
  `id` varchar(32) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `title` varchar(30) DEFAULT '未命名',
  `content` varchar(800) NOT NULL,
  `image` varchar(225) NOT NULL,
  `mood` int(1) DEFAULT NULL,
  `weather` int(1) DEFAULT NULL,
  `publictime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `daily`
--

INSERT INTO `daily` (`id`, `userid`, `title`, `content`, `image`, `mood`, `weather`, `publictime`) VALUES
('01c91f7fd5f1354fab9831e470e7db63', 'cabd4a61af180785d9e85ff1e46b8d68', '手机图片上传测试', '啦啦啦啦', '/yourdaily/dailyPhoto/01c91f7fd5f1354fab9831e470e7db630.jpg', -1, -1, '2017-10-10 15:31:08'),
('077ad65087196bcb15b301a792daa41c', 'cabd4a61af180785d9e85ff1e46b8d68', '手机上的测试', '啦啦啦啦啦啦啦', '', 0, 0, '2017-09-17 14:43:03'),
('1517ca45cd0b9c25d85c5c191e6ce361', '5b6b922f6eee8c39616f28e3cee4b965', '女性风格测试1', '飞机ask飞机ask了放假啊看来是放假咯洛杉矶发士大夫啊说法是否阿三', '', -1, -1, '2017-09-20 17:26:04'),
('19b8867d8606c3e93ad09838cfd5c2fb', '5b6b922f6eee8c39616f28e3cee4b965', 'female test5', 'fasfasfasfasfasf', '', -1, 0, '2017-09-13 19:55:14'),
('2080ab486d879639be395da6a4d3862e', 'cabd4a61af180785d9e85ff1e46b8d68', 'test1', 'tsakjfsakljasklfjasliwrjf', '', -1, -1, '2017-09-13 19:53:18'),
('2223c578bf852a32b66ccbaaec8d07ae', '5e618edd12d5757e019f801010413969', 'fasfasfasf fsadfsaf', 'fasdfasdfsa fasdfasd fsdaf ', '', -1, -1, '2018-01-23 23:25:45'),
('2b21ecd66d2f34dda68dbbcf249a1a0c', 'cabd4a61af180785d9e85ff1e46b8d68', '手机上的测试日历组件内部修改日记', 'fsadfasfa发射点发顺丰哟哟哟哟哟法撒旦jfk拉萨jfk啦jfk啦时间分厘卡时间分厘卡上看见分厘卡时间分厘卡圣诞节法律考试的jfk拉萨jfk了ask了放假撒罗斯福啊时时刻刻耍的好的计算日历组件内部修改日记测试', '', 1, 1, '2017-09-18 15:12:58'),
('2e051eeffbc27496fecba17d0bd3f5b1', 'cabd4a61af180785d9e85ff1e46b8d68', 'fsadfsadfasfasfasdfasfasfasfas', 'fasdfffffffffffffffffffffffffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '', -1, -1, '2018-01-16 19:06:38'),
('31949cb4c9f8d715ae6f38a8c4fbf9c7', '4f3ab91de73faaee35f38c803d35d1f5', '乐乐乐乐jfk老师jfk立即离开', '哈哈哈哈我哦我我我2屁哦似佛菩萨就撒了副科级', '', 1, 1, '2017-09-25 16:41:15'),
('41c3f9c76385d987a409a95ddaace88b', 'cabd4a61af180785d9e85ff1e46b8d68', '修改心情还有修改了天气', 'flajfksjflak修改了心情还有修改了天气', '', 0, 0, '2017-09-16 17:43:17'),
('4246933abeb63147b36fb7ef392ae804', '17305b6f8e45b68bb410adcc3fc364ca', 'fasfasfasfasf', 'fsafsdaf fasdf asfsa ffsa', '', -1, -1, '2018-01-23 23:17:24'),
('42bd0c0ebb25b57d3be613fc697e2f8a', 'cabd4a61af180785d9e85ff1e46b8d68', 'fjklsajfsalkfjaslk;fjaslkfj', 'fasfasdfasfasfasdfadsfas', '', -1, -1, '2018-01-16 19:06:12'),
('4568755ae29b5dd399b5d37ad7beef5e', 'cabd4a61af180785d9e85ff1e46b8d68', '修改后的上传日记', '啦啦啦啦啊啦啦啦', '/yourdaily/dailyPhoto/4568755ae29b5dd399b5d37ad7beef5e0.jpg', 0, 0, '2018-01-13 21:58:49'),
('45c8919eb9ff869819426d59ba979d4e', 'f8353ef02639fe0f5e4edf07f1eb5f20', 'first commit', 'fjskalfj', '/yourdaily/dailyPhoto/45c8919eb9ff869819426d59ba979d4e0.jpg', 0, 0, '2017-10-20 10:04:40'),
('47cc60e4886492881792c9989f9466a7', 'cabd4a61af180785d9e85ff1e46b8d68', '1', '1021231231231231231231321', '', 0, -1, '2018-01-16 11:50:09'),
('4d5c92dd497b502f0a1a5564c10f7e78', 'cabd4a61af180785d9e85ff1e46b8d68', 'test2', 'gdafasfasfasfasf', '', 0, -1, '2017-09-13 19:53:34'),
('4e485929e60d19e505a388ce9320ea0a', 'cabd4a61af180785d9e85ff1e46b8d68', '3', 'fsfasdfasdfasfasfasfasasfass', '', -1, 0, '2018-01-16 11:51:42'),
('563fe35abec093e5035aa41765f6314e', 'cabd4a61af180785d9e85ff1e46b8d68', '1231', 'gdffsadfsadfasdf', '/yourdaily/dailyPhoto/563fe35abec093e5035aa41765f6314e0.jpg,/yourdaily/dailyPhoto/563fe35abec093e5035aa41765f6314e1.jpg,/yourdaily/dailyPhoto/563fe35abec093e5035aa41765f6314e2.jpg', -1, -1, '2018-01-16 12:17:10'),
('597a04fb14773d2d78db8daf9ac7d07c', 'cabd4a61af180785d9e85ff1e46b8d68', '2nd ', 'fasfasfsadfdas', '/yourdaily/dailyPhoto/597a04fb14773d2d78db8daf9ac7d07c0.jpg', 0, -1, '2017-10-08 22:29:53'),
('5e93fbbdb1e3ca509c13c8bdb0d88600', '5cbad82e48296468093a501055411653', 'another account test1', 'fasfasfasfasdfasfa', '', 1, -1, '2017-09-13 20:12:20'),
('6808f1cf726ab977d12be0487a83d048', 'cabd4a61af180785d9e85ff1e46b8d68', '12月', '啊啦啦啦啦啦啦', '/yourdaily/dailyPhoto/6808f1cf726ab977d12be0487a83d0480.jpg', 0, 1, '2017-12-17 17:39:43'),
('72687bd689aa203da77f22eb4acd66c1', '28832a1d1ba56d7768e5419b6c134193', 'fsafasfasfasf', 'fdsfaasfasfasftt ffsafasf', '', -1, -1, '2018-01-23 23:22:33'),
('7be5eb057823286ab633aadd8ef2e522', 'cabd4a61af180785d9e85ff1e46b8d68', '2', '12313213213213213213213', '', 0, 0, '2018-01-16 11:51:28'),
('83d6adc0198e27b35a6b0438e18748df', '', '未命名', '', '', 0, 0, '2018-01-16 10:37:36'),
('8ccdd39789ec9c14a22e977a718136d0', '5b6b922f6eee8c39616f28e3cee4b965', 'female test1', 'fsfasfasfasfasfgadfg', '', -1, -1, '2017-09-13 19:54:30'),
('9038a6b48efb9411e836689e365f627a', '671d45695163118e4c845a0e1dc379db', 'rwqrqwrwqrqwrwqr', 'fsdafasfasfasfsaf', '', -1, -1, '2018-01-23 23:26:26'),
('97dba8a7faa601e8a9d18819b86b0df8', 'b4f82700912c1952aedf1e851bd5fe30', 'hahahaha', 'lalalalala', '', -1, -1, '2018-01-23 23:04:00'),
('a9f8638697e3fc4d1999d0585f6dcef1', '5b6b922f6eee8c39616f28e3cee4b965', 'female test4', 'fasdfasfasfsafasdf', '', 0, 1, '2017-09-13 19:55:03'),
('b73a5e4d8a43bdaaa22d4e9df6f33212', 'cabd4a61af180785d9e85ff1e46b8d68', '4', 'fsafsadfsadfsadfasdfsdafasdasfs', '', 0, 1, '2018-01-16 11:51:56'),
('ba13907b0a66fb39f1003dac8d35eb56', 'cabd4a61af180785d9e85ff1e46b8d68', '新手机的发布', '啦啦啦啦啦啦啦', '/yourdaily/dailyPhoto/ba13907b0a66fb39f1003dac8d35eb560.jpg,/yourdaily/dailyPhoto/ba13907b0a66fb39f1003dac8d35eb561.jpg', -1, -1, '2017-10-26 21:52:03'),
('c3a48fb57f68438cf6efeda92b7a5d00', '5b6b922f6eee8c39616f28e3cee4b965', 'female test3', 'fasfasfasfsafsadf', '', -1, -1, '2017-09-13 19:54:50'),
('c4359c101550da875bd4bf1bb0326d99', 'cabd4a61af180785d9e85ff1e46b8d68', '笔记本上传图片测试', '放假啊看上了飞机ask了放假撒了点看', '/yourdaily/dailyPhoto/c4359c101550da875bd4bf1bb0326d990.jpg', -1, -1, '2017-10-08 22:10:42'),
('d2124c380b293bb6e7c57f7a69fbaf60', 'cabd4a61af180785d9e85ff1e46b8d68', '弗萨阿德萨瑟夫撒旦发射', '夫撒旦法撒旦法撒旦发射三大阿是否撒', '', -1, -1, '2018-01-17 10:34:40'),
('e284e888ad91ee360debc84758ca0fcd', 'cabd4a61af180785d9e85ff1e46b8d68', 'testtesttest', 'fjsaklfjasfkljaslfkja;sdlkfjlkasf', '', -1, -1, '2018-01-16 19:02:07'),
('e801e6130ea6d3f808e865688b99401d', 'cabd4a61af180785d9e85ff1e46b8d68', '手机发布2018', '阿拉啦啦啦啦啦啦啦啦啦啦阿拉', '/yourdaily/dailyPhoto/e801e6130ea6d3f808e865688b99401d0.jpg', 0, 0, '2018-01-17 11:04:30'),
('ef556847d7d294fa9e327b9074643227', 'cabd4a61af180785d9e85ff1e46b8d68', '4', 'fsafsadfsadfsadfasdfsdafasdasfs', '', 0, 1, '2018-01-16 11:51:56'),
('f1c56e113f9a7f9e65639a291391941d', 'cabd4a61af180785d9e85ff1e46b8d68', 'come on', 'baby', '/yourdaily/dailyPhoto/f1c56e113f9a7f9e65639a291391941d0.jpg', -1, -1, '2017-10-09 14:59:42'),
('f6817de818fa24e1d524dbaf787d8c4f', '5b6b922f6eee8c39616f28e3cee4b965', '再发一篇', '添加上了天气和心情', '', 1, 0, '2017-09-20 17:28:41'),
('f93e912057d1590c6ce293f04f8ec1b3', 'cabd4a61af180785d9e85ff1e46b8d68', '修改路径后的发图', '发觉看风景阿斯利康', '/yourdaily/dailyPhoto/f93e912057d1590c6ce293f04f8ec1b30.jpg', -1, -1, '2017-10-09 15:01:41'),
('fbb98a366a29fafdd029fc7f24abda1e', 'cabd4a61af180785d9e85ff1e46b8d68', '第五篇日记', '发生发顺丰', '', 0, 0, '2017-09-17 14:09:19'),
('fd8554a9a12b30a4909260e4f0bf533d', '5b6b922f6eee8c39616f28e3cee4b965', 'female test2', 'fasfsafsafsafasf', '', -1, -1, '2017-09-13 19:54:41');

-- --------------------------------------------------------

--
-- 表的结构 `match_user`
--

CREATE TABLE IF NOT EXISTS `match_user` (
  `id` varchar(32) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(32) NOT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(16) NOT NULL,
  `username` varchar(15) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `sex` int(1) DEFAULT '2',
  `motto` varchar(30) NOT NULL,
  `matchStatus` int(2) NOT NULL DEFAULT '0' COMMENT '0: 还没有匹配，1: 已经匹配，2: 正在匹配',
  `connect` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `account`, `password`, `username`, `avatar`, `sex`, `motto`, `matchStatus`, `connect`) VALUES
('17305b6f8e45b68bb410adcc3fc364ca', '12345677@qq.com', '1234567', '', '', 0, '', 1, 'b4f82700912c1952aedf1e851bd5fe30'),
('28832a1d1ba56d7768e5419b6c134193', 'fasfsdfsa@qq.com', 'fsafsafsafsafa', '', '', 0, '', 1, 'cabd4a61af180785d9e85ff1e46b8d68'),
('4f3ab91de73faaee35f38c803d35d1f5', '123123@qq.com', '123456', '三叶', '', 0, 'follow my heart', 1, '5e618edd12d5757e019f801010413969'),
('5b6b922f6eee8c39616f28e3cee4b965', '2359804324@qq.com', '123456', '三叶', '/yourdaily/useravatar/5b6b922f6eee8c39616f28e3cee4b9651509032208-avatar.jpg', 0, 'follow my heart.', 1, '5cbad82e48296468093a501055411653'),
('5cbad82e48296468093a501055411653', '11169260@qq.com', '123456', '', '', 1, '', 1, '5b6b922f6eee8c39616f28e3cee4b965'),
('5e618edd12d5757e019f801010413969', '958888888@qq.com', '12345678', '', '', 1, '', 1, '4f3ab91de73faaee35f38c803d35d1f5'),
('671d45695163118e4c845a0e1dc379db', '123123666@qq.com', '123123', '', '', 0, '', 2, ''),
('96c3261185b91ec324a181ca9d9fcd4c', '123456@qq.com', '123456', '', '', 1, '', 0, ''),
('9ec3df4f43a2e3debe19845f31ebc890', '256256256@qq.com', '123456', '', '', 2, '', 0, ''),
('b4f82700912c1952aedf1e851bd5fe30', '410043354@qq.com', 'zangfu', '', '', 1, '', 1, '17305b6f8e45b68bb410adcc3fc364ca'),
('cabd4a61af180785d9e85ff1e46b8d68', '979987824@qq.com', '9707528', 'stitch', '/yourdaily/useravatar/cabd4a61af180785d9e85ff1e46b8d681516154997-avatar.jpg', 1, 'heart', 1, '28832a1d1ba56d7768e5419b6c134193'),
('cbb4b0a0a720757f1e264db512694411', '456456@qq.com', '123456', '', '', 0, '', 0, ''),
('e74f3c949cb39269a4655ba703fd664f', '12345678@qq.com', '12345678', '', '', 2, '', 0, ''),
('f8353ef02639fe0f5e4edf07f1eb5f20', '123123123@qq.com', '123456', '', '', 0, '', 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
