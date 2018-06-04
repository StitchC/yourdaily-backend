<?php
$link = mysql_connect('localhost','root','123456');

mysql_select_db('yourdaily',$link);

// 获取男性匹配用户
$get_male_matcher = "select id from match_user where sex = 1";

// 获取女性匹配用户
$get_female_matcher = "select id from match_user where sex = 0";

// 执行查询
$male_result = mysql_query($get_male_matcher, $link);

$female_result = mysql_query($get_female_matcher, $link);

if ($male_result && $female_result) {
  // 先创建两个用来保存最终数据的数组
  $male_arr = array();
  $female_arr = array();
  // 没有被匹配到的用户数组
  $left_matcher = array();

  // 提取数据库查询内容
  while ($male_row = mysql_fetch_array($male_result)) {
    array_push($male_arr, $male_row[id]);
  }
  while ($female_row = mysql_fetch_array($female_result)) {
    array_push($female_arr, $female_row[id]);
  }


  // 计算结果的差值
  $diff = count($male_arr) - count($female_arr);

  if ($diff > 0) {
    // 如果男性匹配者数量大于女性匹配者数量
    // 将男性匹配者的数量减去 使其数量与女性匹配者一样
    // 并且将被减去的用户推进移除数组中
    for ($i = $diff; $i > 0; $i--) {
        array_push($left_matcher, array_pop($male_arr));
    }
  }else {
    // 同理 女性匹配者多于男性匹配者和上面进行同样操作
    for ($i = abs($diff); $i > 0; $i--) {
        array_push($left_matcher, array_pop($female_arr));
    }
  }

  // 打乱数组
  shuffle($male_arr);
  shuffle($female_arr);

  // 开始匹配
  for ($i= 0; $i < count($male_arr); $i++) {
    $set_male_connect = "update user set connect = '$female_arr[$i]', matchStatus = 1 where id = '$male_arr[$i]'";
    $set_female_connect = "update user set connect = '$male_arr[$i]', matchStatus = 1 where id = '$female_arr[$i]'";
    mysql_query($set_male_connect, $link);
    mysql_query($set_female_connect, $link);
  }

  // 遍历被移除用户的数组 将他们的匹配状态设置为0
  for ($i= 0; $i < count($left_matcher); $i++) {
    $reset_matchStatus = "update user set matchStatus = 0 where id = '$left_matcher[$i]'";
    mysql_query($reset_matchStatus, $link);
  }


  // 做完之后把匹配用户的表清空
  $clear_match_user_sql = "delete from match_user";

  mysql_query($clear_match_user_sql, $link);


}


 ?>
