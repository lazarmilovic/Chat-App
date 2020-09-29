<?php session_start(); 
	include 'model.php';

$name= $_POST['name'];
$pass= $_POST['pass'];

$obj= new Model();

$data= $obj->thisUser($name, $pass);

if($data ==[]){
	echo json_encode('Please enter a valid info');
} else {
	//changing the status of logged user in the database and setting SESSION variable
	echo json_encode($data);
	$obj->logIn($name, $pass);
	$_SESSION['user_id']= $data[0]['user_id'];
	
}  


?>