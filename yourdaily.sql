-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-01-12 21:42:25
-- 服务器版本： 5.7.10-log
-- PHP Version: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yourdaily`
--

-- --------------------------------------------------------

--
-- 表的结构 `daily`
--

CREATE TABLE `daily` (
  `id` varchar(32) NOT NULL,
  `userid` varchar(32) NOT NULL,
  `title` varchar(30) DEFAULT '未命名',
  `content` varchar(800) NOT NULL,
  `image` varchar(225) NOT NULL,
  `mood` int(1) DEFAULT NULL,
  `weather` int(1) DEFAULT NULL,
  `publictime` datetime NOT NULL
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
('2b21ecd66d2f34dda68dbbcf249a1a0c', 'cabd4a61af180785d9e85ff1e46b8d68', '手机上的测试日历组件内部修改日记', 'fsadfasfa发射点发顺丰哟哟哟哟哟法撒旦jfk拉萨jfk啦jfk啦时间分厘卡时间分厘卡上看见分厘卡时间分厘卡圣诞节法律考试的jfk拉萨jfk了ask了放假撒罗斯福啊时时刻刻耍的好的计算日历组件内部修改日记测试', '', 1, 1, '2017-09-18 15:12:58'),
('31949cb4c9f8d715ae6f38a8c4fbf9c7', '4f3ab91de73faaee35f38c803d35d1f5', '乐乐乐乐jfk老师jfk立即离开', '哈哈哈哈我哦我我我2屁哦似佛菩萨就撒了副科级', '', 1, 1, '2017-09-25 16:41:15'),
('41c3f9c76385d987a409a95ddaace88b', 'cabd4a61af180785d9e85ff1e46b8d68', '修改心情还有修改了天气', 'flajfksjflak修改了心情还有修改了天气', '', 0, 0, '2017-09-16 17:43:17'),
('45c8919eb9ff869819426d59ba979d4e', 'f8353ef02639fe0f5e4edf07f1eb5f20', 'first commit', 'fjskalfj', '/yourdaily/dailyPhoto/45c8919eb9ff869819426d59ba979d4e0.jpg', 0, 0, '2017-10-20 10:04:40'),
('4d5c92dd497b502f0a1a5564c10f7e78', 'cabd4a61af180785d9e85ff1e46b8d68', 'test2', 'gdafasfasfasfasf', '', 0, -1, '2017-09-13 19:53:34'),
('597a04fb14773d2d78db8daf9ac7d07c', 'cabd4a61af180785d9e85ff1e46b8d68', '2nd ', 'fasfasfsadfdas', '/yourdaily/dailyPhoto/597a04fb14773d2d78db8daf9ac7d07c0.jpg', 0, -1, '2017-10-08 22:29:53'),
('5e93fbbdb1e3ca509c13c8bdb0d88600', '5cbad82e48296468093a501055411653', 'another account test1', 'fasfasfasfasdfasfa', '', 1, -1, '2017-09-13 20:12:20'),
('6808f1cf726ab977d12be0487a83d048', 'cabd4a61af180785d9e85ff1e46b8d68', '12月', '啊啦啦啦啦啦啦', '/yourdaily/dailyPhoto/6808f1cf726ab977d12be0487a83d0480.jpg', 0, 1, '2017-12-17 17:39:43'),
('8ccdd39789ec9c14a22e977a718136d0', '5b6b922f6eee8c39616f28e3cee4b965', 'female test1', 'fsfasfasfasfasfgadfg', '', -1, -1, '2017-09-13 19:54:30'),
('a9f8638697e3fc4d1999d0585f6dcef1', '5b6b922f6eee8c39616f28e3cee4b965', 'female test4', 'fasdfasfasfsafasdf', '', 0, 1, '2017-09-13 19:55:03'),
('ba13907b0a66fb39f1003dac8d35eb56', 'cabd4a61af180785d9e85ff1e46b8d68', '新手机的发布', '啦啦啦啦啦啦啦', '/yourdaily/dailyPhoto/ba13907b0a66fb39f1003dac8d35eb560.jpg,/yourdaily/dailyPhoto/ba13907b0a66fb39f1003dac8d35eb561.jpg', -1, -1, '2017-10-26 21:52:03'),
('c3a48fb57f68438cf6efeda92b7a5d00', '5b6b922f6eee8c39616f28e3cee4b965', 'female test3', 'fasfasfasfsafsadf', '', -1, -1, '2017-09-13 19:54:50'),
('c4359c101550da875bd4bf1bb0326d99', 'cabd4a61af180785d9e85ff1e46b8d68', '笔记本上传图片测试', '放假啊看上了飞机ask了放假撒了点看', '/yourdaily/dailyPhoto/c4359c101550da875bd4bf1bb0326d990.jpg', -1, -1, '2017-10-08 22:10:42'),
('f0441a9230068a869515816e5bd66c2d', 'cabd4a61af180785d9e85ff1e46b8d68', '长图', '发射点法士大夫', '/yourdaily/dailyPhoto/f0441a9230068a869515816e5bd66c2d0.jpg', 0, 0, '2017-10-09 15:57:34'),
('f1c56e113f9a7f9e65639a291391941d', 'cabd4a61af180785d9e85ff1e46b8d68', 'come on', 'baby', '/yourdaily/dailyPhoto/f1c56e113f9a7f9e65639a291391941d0.jpg', -1, -1, '2017-10-09 14:59:42'),
('f6817de818fa24e1d524dbaf787d8c4f', '5b6b922f6eee8c39616f28e3cee4b965', '再发一篇', '添加上了天气和心情', '', 1, 0, '2017-09-20 17:28:41'),
('f93e912057d1590c6ce293f04f8ec1b3', 'cabd4a61af180785d9e85ff1e46b8d68', '修改路径后的发图', '发觉看风景阿斯利康', '/yourdaily/dailyPhoto/f93e912057d1590c6ce293f04f8ec1b30.jpg', -1, -1, '2017-10-09 15:01:41'),
('fbb98a366a29fafdd029fc7f24abda1e', 'cabd4a61af180785d9e85ff1e46b8d68', '第五篇日记', '发生发顺丰', '', 0, 0, '2017-09-17 14:09:19'),
('fd8554a9a12b30a4909260e4f0bf533d', '5b6b922f6eee8c39616f28e3cee4b965', 'female test2', 'fasfsafsafsafasf', '', -1, -1, '2017-09-13 19:54:41'),
('fdc1fb77ed07c28dfd4ffdbfe528a256', 'cabd4a61af180785d9e85ff1e46b8d68', '多张图片', '啦啦啦啦啦啦', '/yourdaily/dailyPhoto/fdc1fb77ed07c28dfd4ffdbfe528a2560.jpg,/yourdaily/dailyPhoto/fdc1fb77ed07c28dfd4ffdbfe528a2561.jpg,/yourdaily/dailyPhoto/fdc1fb77ed07c28dfd4ffdbfe528a2562.jpg', 0, 0, '2017-10-11 09:37:24');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(16) NOT NULL,
  `username` varchar(15) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `sex` int(1) DEFAULT '2',
  `motto` varchar(30) NOT NULL,
  `connect` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `account`, `password`, `username`, `avatar`, `sex`, `motto`, `connect`) VALUES
('4f3ab91de73faaee35f38c803d35d1f5', '123123@qq.com', '123456', '三叶', '', 0, 'follow my heart', ''),
('5b6b922f6eee8c39616f28e3cee4b965', '2359804324@qq.com', '123456', '三叶', '/yourdaily/useravatar/5b6b922f6eee8c39616f28e3cee4b9651509032208-avatar.jpg', 0, 'follow my heart.', ''),
('5cbad82e48296468093a501055411653', '11169260@qq.com', '123456', '', '', 1, '', ''),
('5e618edd12d5757e019f801010413969', '958888888@qq.com', '12345678', '', '', 2, '', ''),
('96c3261185b91ec324a181ca9d9fcd4c', '123456@qq.com', '123456', '', '', 1, '', ''),
('9ec3df4f43a2e3debe19845f31ebc890', '256256256@qq.com', '123456', '', '', 2, '', ''),
('b4f82700912c1952aedf1e851bd5fe30', '410043354@qq.com', 'zangfu', '', '', 2, '', ''),
('cabd4a61af180785d9e85ff1e46b8d68', '979987824@qq.com', '9707528', 'stitch', '/yourdaily/useravatar/cabd4a61af180785d9e85ff1e46b8d681513503687-avatar.jpg', 1, 'heart.', '5b6b922f6eee8c39616f28e3cee4b965'),
('cbb4b0a0a720757f1e264db512694411', '456456@qq.com', '123456', '', '', 0, '', ''),
('f8353ef02639fe0f5e4edf07f1eb5f20', '123123123@qq.com', '123456', '', '', 0, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daily`
--
ALTER TABLE `daily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
