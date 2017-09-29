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


	if($_FILES[avatar]["error"] > 0) {
		$msg = array('status' => 400, 'info' => '');
		echo json_encode($msg);
	}else {
		// 将文件的格式后缀删除
		$actualFileName = explode('.', $_FILES[avatar]['name'])[0];
		// 写入文件
		move_uploaded_file($_FILES[avatar]['tmp_name'], "../../userAvatar/" . $id . $actualFileName . "-avatar.jpg");

		// 整理要保存在数据库的图片路径
		$path = "/yourdaily/userAvatar/" . $id . $actualFileName . "-avatar.jpg";
		$sql = "update user set avatar = '$path' where id = '$id'";
		$result = mysql_query($sql, $link);

		// 删除原来的文件
		$isDelete = unlink('../../userAvatar/'. $curAvatar);


		if($result && $isDelete) {
			$msg = array('status' => 200, 'info' => '');
			echo json_encode($msg);
		}else {
			$msg = array('status' => 400, 'info' => '');
			echo json_encode($msg);
		};
		
	}
?>