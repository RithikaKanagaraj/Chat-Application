<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%@page import="javax.sql.rowset.*"%> 
<%
String username = request.getParameter("username"); 
Connection connection=null; 
int count =0;
String msg="Logout successfully.";
  try{
	Class.forName("com.mysql.jdbc.Driver");   // Load JDBC Driver for MySQL
	CachedRowSet rowSet = RowSetProvider.newFactory().createCachedRowSet();
	rowSet.setUrl("jdbc:mysql://localhost:3306/Rithu");
	rowSet.setUsername("root");
	rowSet.setPassword("2029"); 

    rowSet.setCommand("select id from users where user='"+username+"'");
  	rowSet.execute(); 
  	int id=0;
	 while (rowSet.next()) {
	    	id=rowSet.getInt("id");
	    }
	 
    rowSet.setCommand("update users set status=0 where id="+id);
  	rowSet.execute(); 
} catch (ClassNotFoundException e) {
	 e.printStackTrace();
	 msg="Something Went Wrong";
	 
	} catch (SQLException e) {
	 e.printStackTrace();
	 msg="Something Went Wrong";
	 
	}
%> 
<jsp:forward page="login.jsp">
  <jsp:param name="username" value="<%=msg%>"/>
</jsp:forward> 
 