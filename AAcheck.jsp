<%@page import="databaseconnection.*,java.sql.*"%>
<%!
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
String uname = request.getParameter("uname");
String password = request.getParameter("pass");

con = databasecon.getconnection();
stmt = con.createStatement();

if(uname.equalsIgnoreCase("AA") && (password.equalsIgnoreCase("AA"))){
response.sendRedirect("AA_home.jsp?msg=succ");
}else{
response.sendRedirect("AA.jsp?msg1=unsucc");
}
%>