$(document).ready( function(){

	let username_login= $('#user_name');
	let pass_login= $('#pass');
	let login= $('#btn-login');
	let login_message= $('#login_message');

	let users_id_checked;

	login.click(function(e){
		e.preventDefault();
			$.ajax({ url:"php/get_this_user.php",
				dataType: 'json',
				data: {
					name: username_login.val(),
					pass: pass_login.val()
				},
				method: 'POST',
				success: function(result){

					if(result =='Please enter a valid info') {
						login_message.html(result);
						login_message.css({'color': 'red', 'border': '1px solid', 'border-color': 'black', 'background-color': 'black'});
					} 
				 else {
				 	
					window.location.href= 'chat.php';
				}
			}, 

				error: function(result){
					console.log(result);
				}

		}) 
	})
});