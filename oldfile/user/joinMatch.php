<?php
/**
*   加入匹配
*/
header('content-type:application:json;charset=utf8');
header('Access-Control-Allow-Origin:http://localhost:8080');
date_default_timezone_set("PRC");
date_default_timezone_set("Asia/Shanghai");


$id = $_POST[id];
$sex = $_POST[sex];
$status = $_POST[status];
$time = date("Y-m-d H:i:s");


$link = mysql_connect('localhost','root','123456');

mysql_select_db('yourdaily',$link);


$modify_status_sql = "update user set matchStatus = '$status' where id = '$id'";
$insert_sql = "insert into match_user values('$id', '$sex', '$time')";

$modify_status_result = mysql_query($modify_status_sql, $link);
$insert_result = mysql_query($insert_sql, $link);



if ($modify_status_result && $insert_result) {
  $info = array('status' => 200, 'info' => '');
  echo json_encode($info);
}else {
  $info = array('status' => 400, 'info' => '');
  echo json_encode($info);
}



 ?>
