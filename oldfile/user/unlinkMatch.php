<?php
  header('content-type:application:json;charset=utf8');
  header('Access-Control-Allow-Origin:http://localhost:8080');

  $id = $_POST[id];
  $connectId = $_POST[connectId];

  $link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

  $unlink_self_sql = "update user set connect = '', matchStatus = 0 where id = '$id'";
  $unlink_connecter_sql = "update user set connect = '', matchStatus = 0 where id = '$connectId'";

  $result_1 = mysql_query($unlink_self_sql, $link);
  $result_2 = mysql_query($unlink_connecter_sql, $link);

  if ($result_1 && $result_2) {
    $msg = array('status' => 200, 'info' => '');
  }else {
    $msg = array('status' => 400, 'info' => '');
  }

  echo json_encode($msg);
 ?>
