<?php
	header('content-type:application:json;charset=utf8');
	header('Access-Control-Allow-Origin:http://localhost:8080');
	date_default_timezone_set("PRC");
	date_default_timezone_set("Asia/Shanghai");

	$id = $_POST[id];
	$dailyId = md5(uniqid());
	$title = $_POST[title];
	$content = $_POST[content];
	$mood = $_POST[mood];
	$weather = $_POST[weather];
	$time = date("Y-m-d H:i:s");
	$file = $_FILES[file];


	$status = array();
	$filePathArr = array();
	// 获取服务器根目录
	$rootpath = str_replace('\\', '/', $_SERVER['DOCUMENT_ROOT']);

	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	// 先判断有没有文件
	if($file) {
		for ($i=0; $i < count($file); $i++) {
			if($file['name'][$i]) {
				$arr[] = $file['name'][$i];
				move_uploaded_file($file['tmp_name'][$i], $rootpath . "/yourdaily/dailyPhoto/" . $dailyId . $i . ".jpg");
				array_push($filePathArr, "/yourdaily/dailyPhoto/" . $dailyId . $i . ".jpg");
			}
		};

		if($title == '') {
			$imgPath_str = implode(",", $filePathArr);
			$sql = "insert into daily(id,userId,content,image,mood,weather,publicTime)values ('$dailyId','$id','$content','$imgPath_str','$mood','$weather','$time')";
		}else {
			$imgPath_str = implode(",", $filePathArr);
			$sql = "insert into daily(id,userId,title,content,image,mood,weather,publicTime)values ('$dailyId','$id','$title','$content','$imgPath_str','$mood','$weather','$time')";
		}
	}else {
		// 如果没有文件照样依次判断是否有标题
		if($title == '') {
			$imgPath_str = implode(",", $filePathArr);
			$sql = "insert into daily(id,userId,content,mood,weather,publicTime)values ('$dailyId','$id','$content','$mood','$weather','$time')";
		}else {
			$imgPath_str = implode(",", $filePathArr);
			$sql = "insert into daily(id,userId,title,content,mood,weather,publicTime)values ('$dailyId','$id','$title','$content','$mood','$weather','$time')";
		}
	}


	$result = mysql_query($sql,$link);

	if($result) {
		$status = array('status' => 200, 'info' => '');
	}else {
		$status = array('status' => 400, 'info' => '');
	}


	echo json_encode($status);



?>
