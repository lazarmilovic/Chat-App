# Chat-App

A simple chat app created using Jquery, Ajax and PHP. The index page is the log-in page where entered data by a user are forwarded using Ajax to get_this_user.php page. If the data is matching the data from the database, the user will be re-directed to the chat.php page and the session and the $_SESSION['user_id] will be equal to user_id from the database. If the data are not matching, the user will get an error message and will be asked to enter valid data. If the user is logged in, the script will update the status for this user in the database, setting it to 1 instead of 0.  
Once the user is re-directed to the chat.php page, his id will be taken from SESSION and will be sent via Ajax to the get_users.php page where all the users from the database will be selected (except the logged user) and a div with their details will be appended to the users div. Each div with available user's info is clickable and a click on it will trigger a function that will pass the user's info to chat_history div. For each available user there is a small round div with a black background which represents that the user is offline and which will become green once that particular user logs in. That was handled with Ajax function check_status which was set to check the statuses of every displayed user every 3 seconds. 
Once the logged user chooses the user s(he) wants to send a message to, the previous conversation between the users will be displayed chronologically to chat_message_history div. If the message was sent by the logged user it will be moved to the right with a blue background and if it was received it will be moved to the left with a gray background. 
As soon as a user from the left menu is picked, the message text area will be enabled and the logged user will be able to type a message. At the same time, the Keyup event is created on the message textarea and if it is empty- the send button will be disabled and if it is not empty- the send button will be enabled. 
By clicking the send button, the data from the message text area will be sent to the new_message.php script via Ajax, where it will be inserted in the database and the same text will be returned as a response text and will be appended to the existing chat. 

DATABASE STRUCTURE:
table 1: USERS
  columns: - id;
           - user name;
           - password;
           - picture;
           - status. 
           
table 2: CHATS
  columns: - id of the chat;
           - id of the user1;
           - id of the user2;
           - id of the user who sent the message;
           - message;
           - date and time of the message. 
