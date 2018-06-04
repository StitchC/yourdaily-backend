<?php 
	header('content-type:application:json;charset=utf8');  
	header('Access-Control-Allow-Origin:http://localhost:8080');

	$sex = $_POST[sex];
	$id = $_POST[id];
	
	$resultStr = array();

	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	$sql = "update user set sex = '$sex' where id = '$id'";

	$result = mysql_query($sql,$link);

	
	if($result) {
		$resultStr = array('status' => 200, 'info' => '');
		echo json_encode($resultStr);

	}else {
		$resultStr = array('status' => 400, 'info' => '');
		echo json_encode($resultStr);
	}
	
	
?>