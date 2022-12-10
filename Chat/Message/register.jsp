<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%
String username = request.getParameter("username");
String password = request.getParameter("password"); 
String name=(String)request.getParameter("name"); 
Connection connection=null; 
int count =0;
String msg="";
try {  
	 Class.forName("com.mysql.jdbc.Driver"); 
	 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Rithu","root", "2029");
	 String query="insert  into users (name,user,password) values ('"+name+"','"+username+"','"+password+"')";
	 Statement st=connection.createStatement();
	 st.executeUpdate(query);
	 count =1;
	 msg="Login succes.";
} catch (ClassNotFoundException e) {
	 e.printStackTrace();
	 msg="Something Went Wrong";
	count = 0;
} catch (SQLException e) {
	 e.printStackTrace();
	 msg="Something Went Wrong";
	 count = 0;
}
 out.print(count);
%>
		  
		     
		<%-- if(count==1){
		%>
		<jsp:forward page="../login.jsp">
    <jsp:param name="username" value="<%=msg%>"/>
</jsp:forward>
 <%}
		else{%>
		<jsp:forward page="../registe.jsp">
    <jsp:param name="msg" value="<%=msg%>"/>
</jsp:forward>
		
		<%} %> --%>
	 
 