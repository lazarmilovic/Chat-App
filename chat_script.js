$(document).ready(function (){

	let users = $('.users');
	let send= $('#btn-send');
	let message= $('#new_message');
	let form =$('#form');
	let chat_pic= $('.chat_history_user_pic');
	let chat_name= $('.chat_history_user_info');
	let chat_id =$('.chat_history_user_id');
	let user_id= $('.user_id');
	let chat_history= $('.chat_history_chat');

	//enebling btn-send if the message is not empty and disabling it if the message is empty
	message.keyup(function(){
		if(message.val()!= ''){
			send.prop("disabled", false);
			send.css("background-color", "blue");
			
			
		} else {
			send.prop("disabled", true);
			send.css("background-color", 'gray');
		}
	});

	//this function will load messages between user1 and user2 and depending of sender (user1 or user2) will display it accordingly.
	let loadMessages= function(user1_id, user2_id){
		chat_history.empty();
		$.ajax({ url:'php/get_messages.php',
				method: 'POST',
				dataType:'json',
				data: {
					user1: user1_id,
					user2: user2_id
				}, 
				dataType: 'json',
				success: function(result){
					if(result != ''){
						for(let i=0; i<result.length; i++){
							//if the user1 sent this message, it will have a class 'chat_history_chat_sent'.
							if(result[i].chat_sent_by == user1_id){
								let item='<div class="chat_history_chat_sent"><p>'+result[i].chat_date+'</p><h4>'+result[i].chat_message+'</h4></div>';
								chat_history.append(item);
							} else {
								//if the user2 sent this message, it will have a class 'chat_history_chat_received'.
								let item='<div class="chat_history_chat_received"><p>'+result[i].chat_date+'</p><h4>'+result[i].chat_message+'</h4></div>';
								chat_history.append(item);
							}
						}

					} else{
						let item='<div class="chat_history_none"><p>No messages to display.</p></div>';
						chat_history.append(item);
					}

				}, 
				error: function(result){
					console.log(result);
				}

		})
	}  

	//this function will send a new message to a php file and reload all the messages between two users. It will happen on click but the button will be enebled only when
	let sendMessage= function(user1_id, user2_id){
			$.ajax({ url:'php/new_message.php',
					data: {
						new_message: message.val(),
						user_id: user1_id,
						user_2: user2_id, 
					},
					dataType: 'text',
					method:'POST',
					success: function(result){
						//getting the last message and appending it to the chat_history div
						let parsed= jQuery.parseJSON(result);
					
						let item='<div class="chat_history_chat_sent"><p>'+parsed.time+'</p><h4>'+parsed.message+'</h4></div>';
						chat_history.append(item);

					}, 
					error: function(result){
						console.log(result);
					}

			});
			message.val('');
	}
			//getting users from the database and displaying their info
			let getUsers= function(){
				$.ajax({url:'php/get_users.php',
								method:'POST',
								dataType: 'json',
								data: {
									id: user_id.html()
								},
								success: function(data){
									for(let i=0; i<data.length; i++) {
									let item= '<div class="users_user" id="'+data[i].user_id+'"><div class="users_user_pic"><img src="'+data[i].user_picture+'"></div><div class="users_user_info">'+data[i].user_name+'</div><div id="user_status'+i+'" class="status"></div><div class="users_user_id">'+data[i].user_id+'</div></div>';
										users.append(item);
									}
									let single_user= $('.users_user');
									//setting up event listeners for each available chat user
									for(let i=0; i<single_user.length; i++){
										$(single_user[i]).click(function(e){
	
											message.prop('disabled', false);
											//getting information from clicked div
											let pic= e.target.firstChild.firstChild.src;
											let id = e.target.id;
											let name= e.target.children[1].innerHTML;
											chat_id.html(id);
											//console.log(chat_id.html());
					
											let split= pic.split('chat/');
											let img= split[1];
											//changing the inforamtion in chat box with the information from clikced div
											chat_pic.css('background-image', 'url('+img+')');
											chat_name[0].innerHTML= name;
											//loading chat messages with the specific user
											loadMessages(user_id.html(), id);
											
										}) 
									}
					
								}, error: function(){
									console.log('error');
								}
							}); 
			}

		let checkStatus= function() {
			$.ajax({url: 'php/check_status.php',
					data: {
						id: user_id.html()
					},
					dataType: 'json',
					method: 'POST',
					success: function(result){
						let status_check;
						for(let i=0; i<result.length; i++){

							status_check= $('#user_status'+i);
							if(result[i].user_status ==1){
								if(status_check.hasClass('active')== false){
									status_check.addClass('active');
									
								}
							} else {
								status_check.removeClass('active');
							}
						}
						
					}, error: function(result){
						console.log(result);
						console.log('greska');
					}



					})

		}
	getUsers();
	jQuery.when(getUsers).then(setInterval(checkStatus,3000));
	send.click(function(e){
		e.preventDefault();
		sendMessage(user_id.html(),chat_id.html());
	}) 
});
