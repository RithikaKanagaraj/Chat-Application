<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	     import="javax.sql.rowset.*" 
	     import="java.time.format.DateTimeFormatter"
	     import="java.time.LocalDateTime"
	     pageEncoding="ISO-8859-1"%>
	 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Chat Window</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="style.css">
</head>
<body>
	<%
	String to = request.getParameter("receiver");
	String from = request.getParameter("sender"); 
	%> 
    <div class="menu">
        <div class="back"><a href="userslist.jsp"><i class="fa fa-chevron-left " style="color:white"></i> </a><img src="https://i.imgur.com/DY6gND0.png" draggable="false"/></div>
        <div class="name"><%=to%></div>
        <div class="last">
        <%
	        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");  
	        LocalDateTime now = LocalDateTime.now();  
	        out.println(dtf.format(now));  
        %></div>
    </div>
     
<ol class="chat">
    

<%
Class.forName("com.mysql.jdbc.Driver");   // Load JDBC Driver for MySQL
CachedRowSet rowSet = RowSetProvider.newFactory().createCachedRowSet();
rowSet.setUrl("jdbc:mysql://localhost:3306/Rithu");
rowSet.setUsername("root");
rowSet.setPassword("2029");

rowSet.setCommand("select sender,reciever,message,time from chathistroy where (sender='"+from+"' and "+"reciever='"+to+"') or (sender='"+to+"' and reciever='"+from+"') order by time asc;");
rowSet.execute();
  while (rowSet.next()) {
   	String sender = rowSet.getString("sender");
   	String receiver= rowSet.getString("reciever");
   	String message = rowSet.getString("message");
   	String time =  rowSet.getString("time");
   	if(to.equalsIgnoreCase(sender)){
   		String chat="<li class='other'> <div class='avatar'><img src='https://i.imgur.com/DY6gND0.png' draggable='false'/></div> <div class='msg'>";
    	chat+="<p>"+message+"!</p>";
    	chat +="<time>"+time+"</time>";
    	chat +="</div></li>";
	    out.println(chat);
   	}
   	else{
   		String chat="<li class='self'> <div class='avatar'><img src='https://i.imgur.com/HYcn9xO.png' draggable='false'/></div> <div class='msg'>";
    	chat+="<p>"+message+"!</p>";
    	chat +="<time>"+time+"</time>";
    	chat +="</div></li>";
	    out.println(chat);
   	}
   	
   	 
   }




//out.println("select sender,reciever,message,time from chathistroy where (sender='"+from+"' and reciever='"+to+"') or (sender='"+to+"' and reciever='"+from+"') order by time asc;");
  %> 
	  
</ol>
   


 <form name="chatmessages" >
<div class="input-group mb-3 fixed-bottom">
  <input type="text" class="form-control textarea" placeholder="Type here! "  id="typedmsg" name="message">
  <input type="text" class="form-control textarea"   name="from" value="<%=from%>" hidden>
  <input type="text" class="form-control textarea"  name="to" value="<%=to%>" hidden  >
  <input type="text" class="form-control textarea" name="user" value="<%=from%>" hidden >
  <div class="input-group-append">
    <button class="btn btn-outline-secondary" type="button"onclick="return insertMessages()">Send</button>
  </div>
</div>

  </form>

 
    <script >
        $(function(){
  $('.fa-minus').click(function(){    $(this).closest('.chatbox').toggleClass('chatbox-min');
  });
  $('.fa-close').click(function(){
    $(this).closest('.chatbox').hide();
  });
});

        
        function insertMessages(){
         	 var message=document.forms["chatmessages"]["message"].value;
          	 var messagefrom=document.forms["chatmessages"]["from"].value;
          	 var messageto=document.forms["chatmessages"]["to"].value;
          	 var messageuser=document.forms["chatmessages"]["user"].value; 
       	 if (message==null || message=="") {
       		 alert("Please Type any message !");
       		 return false;
       	 } 
       	 else{
       		 var http = new XMLHttpRequest();
       		 http.open("POST", "Message/insertMessage.jsp", true);
       		 http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
       		 var params = "message=" + message+ "&from=" + messagefrom+ "&to=" + messageto+ "&user=" + messageuser; // probably use document.getElementById(...).value
       		 http.send(params);
       		 http.onload = function() {
       		 	//alert(http.responseText);
       			document.getElementById("typedmsg").value ="";
       			location.reload();
       		 }
       	 } 
        } 
        
        autoRefresh();
        function autoRefresh(){
        	setTimeout(function(){
        		   window.location.reload(1);
        		}, 8000);
        }
    </script>
</body>
</html>