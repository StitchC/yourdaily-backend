<?php 
	header('content-type:application:json;charset=utf8');  
	header('Access-Control-Allow-Origin:http://localhost:8080');
	date_default_timezone_set("PRC");
	date_default_timezone_set("Asia/Shanghai"); 

	$id = $_POST[id];
	$dailyId = md5(uniqid());
	$title = $_POST[title];
	$content = $_POST[content];
	$mood = $_POST[mood];
	$weather = $_POST[weather];
	$time = date("Y-m-d H:i:s");

	$status = array();

	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	if($title == '') {
		$sql = "insert into daily(id,userId,content,mood,weather,publicTime)values ('$dailyId','$id','$content','$mood','$weather','$time')";
	}else {
		$sql = "insert into daily(id,userId,title,content,mood,weather,publicTime)values ('$dailyId','$id','$title','$content','$mood','$weather','$time')";
	}

	$result = mysql_query($sql,$link);

	if($result) {
		$status = array('status' => 200, 'info' => '', 'time' => $time);
	}else {
		$status = array('status' => 400, 'info' => '', 'time' => $time);
	}

	echo json_encode($status);

?>