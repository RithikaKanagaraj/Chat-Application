<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	     import="javax.sql.rowset.*" pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Chat list</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

  <!-- <p>Asdf</p> -->
    <%
	String username = request.getParameter("username"); 
	%>
    
 <%
	Class.forName("com.mysql.jdbc.Driver");   // Load JDBC Driver for MySQL
	CachedRowSet rowSet = RowSetProvider.newFactory().createCachedRowSet();
	rowSet.setUrl("jdbc:mysql://localhost:3306/Rithu");
	rowSet.setUsername("root");
	rowSet.setPassword("2029");  
    %>
<div class="container">
  <h2>Welcome to  ChatBox</h2>
  
<form action="logout.jsp"> <div class="text-right"> 
  <input type="text"  name="username" value="<%=username%>" hidden> 
  <input type="submit" value="Log out" class="btn btn-primary">
  </div>
</form> 


  <div class="card-columns">
    <%
    rowSet.setCommand("select * from users where status=1 AND user!='"+username+"'");
	rowSet.execute();
	    while (rowSet.next()) {
	    	String card = "<div class='card'><div class='card-body text-center'><p class='card-text'>";
	    		card+=rowSet.getString("user")+" is Avaible </p>  ";
	    		 
	    		 String form="<form action='chatwindow.jsp' method='post'><input type='text'  name='sender'  value='"+username+"' hidden>"
	    		 +"<input type='text'  name='receiver'  value='"+rowSet.getString("user")+"' hidden  >";
	    		 form+="<button type='submit'>Send Message!</button>  </form> ";
	    		 card+=form+"  </div> </div>";
		      out.println(card);
	    }
	  %>
      
     
    
  </div>
</div>


</body>
</html>
