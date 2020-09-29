<?php include 'connection.php';

class Model extends Connection {

	public function getUsers($id){
		$sql="SELECT * FROM users WHERE user_id != ?";
		$stmt=$this->connect()->prepare($sql);
		$stmt->execute([$id]);
		$result=$stmt->fetchAll();
		return $result;
	}

	public function insertChat($id,$user2_id, $message, $time){
		$sql="INSERT INTO chats (chat_user_id, chat_user2_id, chat_message, chat_sent_by, chat_date) VALUES(?,?,?,?,?)";
		$stmt=$this->connect()->prepare($sql);
		$stmt->execute([$id,$user2_id, $message, $id, $time]);
		$result= $stmt->fetchAll();
		return $result;
	}

	public function thisUser($user_name, $pass){
		$sql="SELECT * From users WHERE user_name =? AND users_pass= ?";
		$stmt= $this->connect()->prepare($sql);
		$stmt->execute([$user_name, $pass]);
		$result=$stmt->fetchAll();
		return $result;
	}
	public function getChats($id1, $id2){
		$sql="SELECT * FROM chats WHERE chat_user_id = ? and chat_user2_id=? OR chat_user_id=? and chat_user2_id=?";
		$stmt=$this->connect()->prepare($sql);
		$stmt->execute([$id1, $id2, $id2, $id1]);
		$result=$stmt->fetchAll();
		return $result;
	}

	public function logIn($user, $pass){
		$sql='UPDATE users SET user_status = 1 WHERE user_name= ? AND users_pass= ?';
		$stmt= $this->connect()->prepare($sql);
		$stmt->execute([$user, $pass]);
	}

	public function logOut($id){
		$sql='UPDATE users SET user_status = 0 WHERE user_id= ?';
		$stmt= $this->connect()->prepare($sql);
		$stmt->execute([$id]);
	}

}


?>