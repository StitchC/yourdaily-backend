<?php
  header('content-type:application:json;charset=utf8');
  header('Access-Control-Allow-Origin:http://localhost:8080');

  $id = $_GET[id];
  $connect = $_GET[id];


  $total_words = 0;

  $total_img = array();

  $link = mysql_connect('localhost','root','123456');

  mysql_select_db('yourdaily', $link);

  // 获取所有日记的数量
	$daily_count_sql = "select count(*) as count from daily where userid = '$id'";

	// 获取用户信息
	$get_user_info_sql = "select username, id, avatar,sex,motto,connect, matchStatus from user where id = '$id'";

  // 查询日记结果sql 语句
  // 获取全部日记

  // 获取全部日记
	if($connect) {
		$all_daily_sql = "select daily.id,daily.userid,title,content,image,mood, weather,publictime,user.sex from daily join user on daily.userid = user.id where daily.userid = '$id' or daily.userid = '$connect' order by daily.publictime desc";
	}else {
		$all_daily_sql = "select daily.id,daily.userid,title,content,image,mood, weather,publictime,user.sex from daily join user on daily.userid = user.id where daily.userid = '$id' order by daily.publictime desc";
	}





  // 执行查询
  $daily_count = mysql_query($daily_count_sql, $link);
  $user_info = mysql_query($get_user_info_sql, $link);
  $daily_result = mysql_query($all_daily_sql, $link);


	$daily_count_result = mysql_fetch_array($daily_count);
  $info_result = mysql_fetch_array($user_info);

  // 开始遍历日记结果 提取用户数据
  while ($row = mysql_fetch_array($daily_result)) {

		$total_words += mb_strlen($row[content], "utf-8");

		if($row[image] != '') {
			$temp_img_list = explode(",", $row[image]);
			for ($i=0; $i < count($temp_img_list); $i++) {
				array_push($total_img, $temp_img_list[$i]);
			}

		}
	}

  $info = array('id' => $info_result[id], 'username' => $info_result[username], 'avatar' => $info_result[avatar], 'sex' => $info_result[sex], 'motto' => $info_result[motto], 'connect' => $info_result[connect], 'matchStatus' => $info_result[matchStatus], 'count' => $daily_count_result[count], 'words' => $total_words, 'images' => $total_img);







	$resultArr = array('status' => 200, 'info' => $info);

	echo json_encode($resultArr);

 ?>
