<?php include 'model.php';

$id= $_GET['id'];

$obj= new Model();
$obj->logOut($id);
session_destroy();
header('Location:../index.php');
?>