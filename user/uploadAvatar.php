<?php 
	header('content-type:application:json;charset=utf8');  
	header('Access-Control-Allow-Origin:http://localhost:8080');
	date_default_timezone_set("PRC");
	date_default_timezone_set("Asia/Shanghai");


	$id = $_POST[id];
	$curAvatar = $_POST[curAvatar];
	$file = $_FILES[avatar];

	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);
	$sql = "select avatar from user where id = '$id'";
	$result = mysql_query($sql, $link);
	$avatarUrl = "";

	while ($row = mysql_fetch_array($result)) {
		$avatarUrl = $row[avatar];
	}

	if($_FILES[avatar]["error"] > 0) {
		$msg = array('status' => 400, 'info' => '');
		echo json_encode($msg);
	}else {
		// 删除原来的文件
		if($avatarUrl != "") {
			$tempFileName = explode("/", $avatarUrl);
			unlink('D:/AppServ/www/yourdaily/useravatar/'. $tempFileName[3]);
		}
		// 将文件的格式后缀删除
		$fileSavePath = "D:/AppServ/www/yourdaily/useravatar/" . $id . time() . "-avatar.jpg";
		// 写入文件
		move_uploaded_file($_FILES[avatar]['tmp_name'], $fileSavePath);

		// 整理要保存在数据库的图片路径
		$savedFileName = explode("/", $fileSavePath);
		$path = "/yourdaily/useravatar/" . $savedFileName[5];
		$sql = "update user set avatar = '$path' where id = '$id'";
		$result = mysql_query($sql, $link);
		

		if($result) {
			$msg = array('status' => 200, 'info' => '');
			echo json_encode($msg);
		}else {
			$msg = array('status' => 400, 'info' => '', 'curFile' => $curAvatar);
			echo json_encode($msg);
		};
		
	}
?>