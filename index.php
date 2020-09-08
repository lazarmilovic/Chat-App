<!DOCTYPE html>
<html lang="en">
<head>
	<title>Chat</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
	<div class="login_container">
		<h4>Please enter the data</h4>
		<form method="POST" action="php/get_this_user.php">
			<input type="text" name="name" placeholder="Your user name" id="user_name">
			<input type="password" name="pass" placeholder="Your password" id="pass">
			<button type="submit" id="btn-login">Submit</button>
		</form>
		<h4 id="login_message"></h4>
	</div>
<script src="script.js"></script>
</body>
</html>