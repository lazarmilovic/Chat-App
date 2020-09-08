<?php include 'model.php'; 
	
if($_POST){
	$id= $_POST['id'];
}

$obj= new Model();
$result= $obj->getUsers($id);

echo json_encode($result);
?>