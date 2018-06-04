<?php 
	header('content-type:application:json;charset=utf8');
	header('Access-Control-Allow-Origin:http://localhost:8080');

	$id = $_POST[id];
	$msg = array();

	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	$sql = "delete from daily where id = '$id'";
	$findImgPathSql = "select image from daily where id = '$id'";

	$imgPath = mysql_query($findImgPathSql, $link);

	while($allPath = mysql_fetch_array($imgPath)) {
		if($allPath[image]) {
			$pathList = explode(",", $allPath[image]);
			for ($i=0; $i < count($pathList); $i++) {
				$tempFileName = explode("/", $pathList[$i]);
				$actualFilePath = "../../dailyPhoto/" . $tempFileName[3];
				unlink($actualFilePath);
			}
		};

	};

	$result = mysql_query($sql, $link);
	if($result) {
		$msg = array('status' => 200, 'info' => '');

	}else {
		$msg = array('status' => 400, 'info' => '');
	}
	echo json_encode($msg);


?>
