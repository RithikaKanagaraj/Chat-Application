<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%
String user=(String)request.getParameter("user");
String sender=(String)request.getParameter("from");
String reciever=(String)request.getParameter("to");
String message=(String)request.getParameter("message"); 
Connection connection=null; 
try { 
	  
 Class.forName("com.mysql.jdbc.Driver"); 
 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Rithu","root", "2029");
 String query="insert into chathistroy (user,sender,reciever,message) values ('"+user+"','"+sender+"','"+reciever+"','"+message+"')";
 Statement st=connection.createStatement();
 st.executeUpdate(query);
 out.println("1");
} catch (ClassNotFoundException e) {
 e.printStackTrace();
 out.println("0");
} catch (SQLException e) {
 e.printStackTrace();
 out.println("0");
}
%>