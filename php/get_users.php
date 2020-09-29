<?php include 'model.php';

$id= $_POST['id'];

$object = new Model();


$data= $object->getUsers($id);


echo json_encode($data);