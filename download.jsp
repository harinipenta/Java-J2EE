<%@ include file="uheader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Attribute-Based Storage </title>
<body>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">File Download</h2>
			</div>
		</div>
	</div>
	</section>
    <div ><br><br><br><br><br>
<font size="" color="ff6600"><h2></h3></font>
<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  
<%if(request.getParameter("msg")!=null){
	  out.println("<script>alert('Sorry, this file can not  Access by You')</script>");
}
if(request.getParameter("msgs")!=null){
	  out.println("<script>alert('Label is Verified,Given FileData is Invalid')</script>");
}
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();
%>
<table cellspacing="20" cellpadding="10" align="center">
<tr><th width="20%"><h4>File ID</th><th width="20%"><h4>File Name</th><th width="20%"><h4>Data Provider</th><th width="20%"><h4>File Data</th></tr>
<tr></tr>
<%
ResultSet r=st.executeQuery("select *from publiccloud ");
while(r.next()){%>
<tr height="20"></strong></td><td><strong><%=r.getString(1)%></td><td><strong><%=r.getString(2)%></td><td><strong><%=r.getString(5)%></td>
<td><a href="View.jsp?fid=<%=r.getString(1)%>"><font size="" color="#3366ff"><strong>View</center></font></a></td></tr><tr></tr><tr></tr>	
<%}%>
<%}catch(Exception e){e.printStackTrace();}%>
</div ></table>
</body>
<br><br><br><br><br><br>
 