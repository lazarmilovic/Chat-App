<?php 
include 'model.php';

$id1= $_POST['user1'];
$id2= $_POST['user2'];

$obj= new Model();
$result= $obj->getChats($id1,$id2);

//print_r($obj->getChats(1, 2));
echo json_encode($result);
?>