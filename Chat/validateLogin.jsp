<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	     import="javax.sql.rowset.*" pageEncoding="ISO-8859-1"%>
	 
	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String msg="Invalid User and Password.";
	 int count =0;
	 
	Class.forName("com.mysql.jdbc.Driver");   // Load JDBC Driver for MySQL
	CachedRowSet rowSet = RowSetProvider.newFactory().createCachedRowSet();
	rowSet.setUrl("jdbc:mysql://localhost:3306/Rithu");
	rowSet.setUsername("root");
	rowSet.setPassword("2029");
    rowSet.setCommand("select count(*) as COUNT from users where user='"+username+"' and password='"+password+"'");
	rowSet.execute();
    
		  while (rowSet.next()) {
		      count = rowSet.getInt("COUNT") ;
		      out.println(count);
		      if(count!=0){
		      	msg="Login Successfully.!"; 
		      	rowSet.setCommand("update users set status=1 where user='"+username+"' and password='"+password+"'");
		    	rowSet.execute();
		      	
		      }
		      else{
		    	  msg="Invalid password";
		     }
		      
	    }
		
		 %>  
		  <%     
		if(count!=0){
		%>
		<jsp:forward page="userslist.jsp">
    <jsp:param name="username" value="<%=username%>"/>
</jsp:forward>
 <%}
		else{%>
		<jsp:forward page="login.jsp">
    <jsp:param name="msg" value="<%=msg%>"/>
</jsp:forward>
		
		<%} %> 
	   
 
 