<?php 
	header('content-type:application:json;charset=utf8');  
	header('Access-Control-Allow-Origin:http://localhost:8080');  


	$account = $_POST[account];
	$pwd = $_POST[pwd];

	
	// 请求发送的结果
	$result_str = array();

	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	$checkAccountExist = "select * from user where account = '$account'";

	$result = mysql_query($checkAccountExist,$link);
	

	/*
		自定义返回状态码：
		200： 注册成功 数据表没有相同的账号
		400： 注册失败 数据表有相同的账号
	*/

	
	if(mysql_num_rows($result) > 0) {

		$result_str = array('status' => 400, 'info' => '');
		echo json_encode($result_str);

	}else {

		$userid = md5(uniqid());

		$insert = "insert into user (id,account,password)values ('$userid','$account','$pwd')";

		$insertResult = mysql_query($insert, $link);

		if($insertResult) {

			$result_str = array('status' => 200, 'info' => '');

			echo json_encode($result_str);
		}
	}
	

?>