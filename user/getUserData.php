<?php
	header('content-type:application:json;charset=utf8');
	header('Access-Control-Allow-Origin:http://localhost:8080');

	$id = $_GET[id];

	$connect = $_GET[connectId];

	$resultArr = array(); // 保存最终数据
	$daily = array();     // 保存对应日记内容数据
	$info = array();      // 保存用户信息数据


	$total_words = 0;     // 保存所有日记的总字数
	$total_img = array(); // 保存所有图片的数量




	$link = mysql_connect('localhost','root','123456');

	mysql_select_db('yourdaily',$link);

	// 获取全部日记
	if($connect) {
		$all_daily_sql = "select daily.id,daily.userid,title,content,image,mood, weather,publictime,user.sex from daily join user on daily.userid = user.id where daily.userid = '$id' or daily.userid = '$connect' order by daily.publictime desc";
	}else {
		$all_daily_sql = "select daily.id,daily.userid,title,content,image,mood, weather,publictime,user.sex from daily join user on daily.userid = user.id where daily.userid = '$id' order by daily.publictime desc";
	}


	// 获取所有日记的数量
	$daily_count_sql = "select count(*) as count from daily where userid = '$id'";

	// 获取用户信息
	$get_user_info_sql = "select username, id, avatar, sex, motto, matchStatus, connect from user where id = '$id'";


	$daily_result = mysql_query($all_daily_sql, $link);
	$daily_count = mysql_query($daily_count_sql, $link);
	$user_info = mysql_query($get_user_info_sql, $link);


	while ($row = mysql_fetch_array($daily_result)) {

		$temp = array('id' => $row[id], 'userId' => $row[userid], 'title' => $row[title], 'content' => $row[content], 'image' => $row[image], 'mood' => $row[mood], 'weather' => $row[weather], 'sex' => $row[sex], 'publicTime' => $row[publictime]);

		$total_words += mb_strlen($row[content], "utf-8");

		if($row[image] != '') {
			$temp_img_list = explode(",", $row[image]);
			for ($i=0; $i < count($temp_img_list); $i++) {
				array_push($total_img, $temp_img_list[$i]);
			}

		}

		$daily[$row[id]] = $temp;
	}

	$info_result = mysql_fetch_array($user_info);
	$daily_count_result = mysql_fetch_array($daily_count);

	$info = array('id' => $info_result[id], 'username' => $info_result[username], 'avatar' => $info_result[avatar], 'sex' => $info_result[sex], 'motto' => $info_result[motto], 'connect' => $info_result[connect], 'matchStatus' => $info_result[matchStatus], 'count' => $daily_count_result[count], 'words' => $total_words, 'images' => $total_img);



	$resultArr = array('daily' => $daily, 'info' => $info);

	echo json_encode($resultArr);



?>
