

<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>


<%

String msg=request.getParameter("msg");     

if(msg.equals("uploaded")){

response.sendRedirect("upload.jsp?msg=uploaded");
}
else{

response.sendRedirect("upload.jsp?errormsg=Invalid_Proof");

}

%>




