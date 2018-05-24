<?php
/**
* 取消匹配
*/
  header('content-type:application:json;charset=utf8');
	header('Access-Control-Allow-Origin:http://localhost:8080');


  $id = $_POST[id];
  $status = $_POST[status];


  $link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);


  // 修改用户的匹配状态以及匹配表中的记录
  $modify_status_sql = "update user set matchStatus = '$status' where id = '$id'";
  $delete_sql = "delete from match_user where id = '$id'";



	$modify_result = mysql_query($modify_status_sql, $link);
  $delete_result = mysql_query($delete_sql, $link);

  if($modify_result && $delete_result) {
		$msg = array('status' => 200, 'info' => '');
		echo json_encode($msg);
	}else {
		$msg = array('status' => 400, 'info' => '');
		echo json_encode($msg);
	}

 ?>
