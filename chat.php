<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Chat</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<?php 
	$id= $_SESSION['user_id'];
?>
<div class="container">
	<div class="user_id"><?php echo $id; ?></div>
	<div class="users">
		<div class="available">Available users for chat</div>
	</div>
	<div class="chat">
		<div class="chat_history">
			<div class="chat_history_user">
				<div class="chat_history_user_pic"></div>
				<div class="chat_history_user_info">Please pick the user from you would like to chat with</div>
				<div class="chat_history_user_id">0</div>
				<div class="sign_out"><a href="php/sign_out.php?id=<?php echo $id ?>">Sign out</a></div>
			</div>
			<div class="chat_history_chat">
				<div class="chat_history_chat_sent">
					<p>time</p>
					<h4>message</h4>
				</div>
				<div class="chat_history_chat_received">
					<p>time</p>
					<h4>message</h4>
				</div>
			</div>
		</div>
		<div class="chat_box">
			<form id="form">
				<textarea class="message" id="new_message" disabled=true></textarea>
				<button type="submit" id="btn-send" disabled=true>Send</button>
			</form>
		</div>
	</div>
</div>
<script src="chat_script.js"></script>
</body>
</html>