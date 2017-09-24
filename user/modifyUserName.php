<?php 
	header('content-type:application:json;charset=utf8');  
	header('Access-Control-Allow-Origin:http://localhost:8080');

	$id = $_POST[id];
	$username = $_POST[username];

	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	$sql = "update user set username='$username' where id='$id'";

	$result = mysql_query($sql);

	if($result) {
		$msg = array('status' => 200, 'info' => '');
		echo json_encode($msg);
	}else {
		$msg = array('status' => 400, 'info' => '');
		echo json_encode($msg);
	}

?>