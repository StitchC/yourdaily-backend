<?php
	header('content-type:application:json;charset=utf8');
	header('Access-Control-Allow-Origin:http://localhost:8080');

	$account = $_GET[account];
	$pwd = $_GET[pwd];

	// 请求发送的结果
	$result_str = array();
	// 如果查询内容不为空 info 键值数组才会有值
	$info = array();


	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	$sql = "select * from user where account = '$account' and password = '$pwd'";


	$result = mysql_query($sql,$link);

	/*
		自定义返回状态码：
		200： 请求数据正确
		400： 请求数据有误 数据库查询结果为非
	*/


	if(mysql_num_rows($result) === 0) {
		$result_str = array('status'=>400, 'info'=>'');
		echo json_encode($result_str);

	}else {
		// 如果帐号匹配 找到用户的链接用户 进行数据的查询
		while ($arr = mysql_fetch_array($result)) {
			$result_arr = array('id' => $arr[id], 'connect' => $arr[connect], 'sex' => $arr[sex]);
		}
		$result_str = array('status'=>200, 'info'=>$result_arr);
		echo json_encode($result_str);
	}

?>
