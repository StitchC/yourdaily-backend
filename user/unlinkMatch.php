<?php
  header('content-type:application:json;charset=utf8');
  header('Access-Control-Allow-Origin:http://localhost:8080');

  $id = $_POST[id];

  $link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

  $do_unlink_sql = "update user set connect = '', matchStatus = 0 where id = '$id'";

  $result = mysql_query($do_unlink_sql, $link);

  if ($result) {
    $msg = array('status' => 200, 'info' => '');
  }else {
    $msg = array('status' => 400, 'info' => '');
  }

  echo json_encode($msg);
 ?>
