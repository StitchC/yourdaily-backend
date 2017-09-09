<?php 
	header('content-type:application:json;charset=utf8');  
	header('Access-Control-Allow-Origin:http://localhost:8080');

	$id = $_GET[id];

	$connect = $_GET[connectId];

	$resultArr = array();

	$total_words = 0; // 保存所有日记的总字数




	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	// 获取全部日记
	$research_daily_sql = "select daily.id, daily.title, daily.content, daily.mood, daily.weather,daily.publicTime, user.id, user.sex from user, daily where daily.userId = '$id' or daily.userId = '$connect'";

	// 获取所有日记的数量
	$daily_count_sql = "select count(*) from daily where userId = '$id'";

	// 获取用户信息
	$get_user_info = "select avatar, motto, username from user where id = '$id'";

	$daily_result = mysql_query($research_daily_sql);
	$daily_count = mysql_query($daily_count_sql);
	$user_info = mysql_query($get_user_info);

	while ($rows = mysql_fetch_array($daily_result)) {
		
	}
?>