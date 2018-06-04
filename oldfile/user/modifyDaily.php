<?php 
	header('content-type:application:json;charset=utf8');  
	header('Access-Control-Allow-Origin:http://localhost:8080');
	date_default_timezone_set("PRC");
	date_default_timezone_set("Asia/Shanghai"); 

	$dailyId = $_POST[dailyId];
	$title = $_POST[title];
	$content = $_POST[content];
	$mood = $_POST[mood];
	$weather = $_POST[weather];
	$time = date("Y-m-d H:i:s");

	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);
	
	$sql = "update daily set title = '$title',content = '$content',mood = '$mood',weather = '$weather',publictime = '$time' where id = '$dailyId'";
	
	$result = mysql_query($sql, $link);

	if($result) {
		$msg = array('status' => 200, 'info' => '');
	}else {
		$msg = array('status' => 400, 'info' => '');
	}

	echo json_encode($msg);

?>