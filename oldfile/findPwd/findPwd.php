<?php

  header('content-type:application:json;charset=utf8');
  header('Access-Control-Allow-Origin:http://localhost:8080');

  $mail = $_POST['mail'];

  $link = mysql_connect('localhost','root','123456');

  mysql_select_db('yourdaily',$link);

  $check_mail_isTrue = "select account, password from user where account = '$mail'";

  $mail_isTrue = mysql_query($check_mail_isTrue, $link);

  if (mysql_num_rows($mail_isTrue) != 0) {
    // 如果这个邮箱地址存在
    $pwd = '';
    while ($row = mysql_fetch_row($mail_isTrue)) {
      $pwd = $row['password'];
    }
    // 发送邮件
    $msg = "你好，你的登录密码为：" . $pwd . "\n\n\n\n\n\n\n\n ---------- 你的日记团队";
    $result = mail($mail, '你的日记密码', $msg);

    if ($result) {
      $info = array('status' => 200, 'info' => '');
      echo json_encode($info);
    }else {
      $info = array('status' => 400, 'info' => '');
      echo json_encode($info);
    }
  }else {
    // 如果邮箱地址不存在
    $info = array('status' => 400, 'info' => '邮箱地址不存在');
    echo json_encode($info);
  }

 ?>
