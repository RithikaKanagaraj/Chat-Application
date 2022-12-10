<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>

<form name="register" >
  <div class="container">
    <h1>Register</h1>
    <p>Welcome to ChatBox</p>
    <hr>

    <label for="username"><b>Name</b></label>
    <input type="text" placeholder="Enter name" name="name" id="name" required>

    <label for="username"><b>Username</b></label>
    <input type="text" placeholder="Enter username" name="username" id="username" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" id="password" required>
 
    <button  onclick="insertMessages()" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
  </div>
</form>
 <script >
 
        
        
        function insertMessages(){
         	 var name=document.forms["register"]["name"].value;
          	 var username=document.forms["register"]["username"].value;
          	 var password=document.forms["register"]["password"].value; 
       	 if ((username==null || username=="")&&(password==null || password=="")) {
       		 alert("Please enter username and passowrd !");
       		 return false;
       	 } 
       	 else{ 
       		 var http = new XMLHttpRequest();
       		 http.open("POST", "Message/register.jsp", true);
       		 http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
       		 var params = "name=" + name+ "&username=" + username+ "&password=" + password; // probably use document.getElementById(...).value
       		 http.send(params);
       		 http.onload = function() {
       			 console.log(http);
       		 	console.log(http.responseText);
       		 	var x =parseInt(http.responseText);
       		 	if(x=="1"){
       		 		alert("Register sussessfully.Please login to start chat");
       		 	window.open('login.jsp');
       		 	//window.location.replace('login.jsp'); 
       		 	}else{
       		 		alert("Try later"); 
       		 	}
       			
       		 }
       		 //TO LOGIN
       		window.open('login.jsp');
       	 } 
        }  
    </script>
</body>
</html>
