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

	// echo mysql_num_rows($result);
	/*
		自定义返回状态码：
		200： 请求数据正确
		400： 请求数据有误 数据库查询结果为非
	*/

	
	if(mysql_num_rows($result) === 0) {
		$result_str = array('status'=>400, 'info'=>'');
		echo json_encode($result_str);

	}else {
		while($arr = mysql_fetch_array($result)) {
			$info = array('id'=>$arr[id], 'sex'=>$arr[sex]);
		}
		$result_str = array('status'=>200, 'info'=>$info);
		echo json_encode($result_str);
	}

?>