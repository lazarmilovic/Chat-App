<?php 
include 'model.php';

$obj= new Model();
//$obj->getChats();

print_r($obj->getChats(1, 2));


?>