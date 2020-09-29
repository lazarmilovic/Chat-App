<?php session_start();
include 'model.php';

if($_POST){
	$text= $_POST['new_message'];
	$user1_id= $_POST['user_id'];
	$user2_id= $_POST['user_2'];
	$time= date('Y-m-d H:i:s');
} 

//creating a new temoporary object with time and message took from POST data. It will be returned as a result at the bottom of this page and the result will be used to append it at chat_history div. I tried using lastInsertId() but the result was always 0.  
$new_obj= new stdClass();
$new_obj->time= $time;
$new_obj->message= $text;

$obj= new Model();


$obj->insertChat($user1_id, $user2_id, $text, $time); 

echo json_encode($new_obj);


?>