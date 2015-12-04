<?php
error_reporting(0);
$db = new mysqli('localhost', 'spoloju', 'spoloju2015', 'spoloju');
if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}
// Gets 1000 users from the randomuser api, and loads it into a variable called $json
$json = file_get_contents("http://api.randomuser.me/?results=20");
// This turns the variable into a PHP object
$json_array = json_decode($json);
for($i=0;$i<sizeof($json_array->results);$i++){
   
   
	$first = $json_array->results[$i]->user->name->first;
	$last = $json_array->results[$i]->user->name->last;
	$street = $json_array->results[$i]->user->location->street;
	$city = $json_array->results[$i]->user->location->city;
	$state = $json_array->results[$i]->user->location->state;
	$zip = $json_array->results[$i]->user->location->zip;
	$email = $json_array->results[$i]->user->email;
	$password = $json_array->results[$i]->user->password;
	$phone = $json_array->results[$i]->user->phone;
	$picture = $json_array->results[$i]->user->picture->medium;
	
	echo "'$first','$last','$street','$city','$state','$zip','$email','$password','$phone','$picture'";
	$sql1 = "select * from user where email='{$email}'";
	if(!$result1 = $db->query($sql1)){
		die('There was an error running the query [' . $db->error . ']');
	}
	//$rows = $value->num_rows;
	//$num = $value->num_rows;
	//echo "'$value->num_rows'";
	//echo "$rows";
	
if(!$result1->num_rows>0){
	$sql2 = <<<SQL
    INSERT into user
    VALUES('$first','$last','$street','$city','$state','$zip','$email','$password','$phone','$picture'); 
SQL;
	if(!$result = $db->query($sql2)){
		die('There was an error running the query [' . $db->error . ']');	
	}
}
}