<%@ include file="privateheader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<body>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Re-Encryption</h2>
			</div>
		</div>
	</div>
	</section>
    <div ><br><br>
<center><h3>Data Provider Request</h3><br><br>

<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  
<%
if(request.getParameter("msg")!=null){
	  out.println("<script>alert('Label( L )and new Ciphertext( ct) updated in Public Cloud')</script>");
}

%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();
%>
<table cellspacing="20" cellpadding="10">
<tr><th width="20%"><h4>File ID</th><th width="20%"><h4>File Name</th><th width="20%"><h4>Data Provider</th><th width="20%"><h4>Re-Encryption</th></tr>
<tr></tr>
<%
ResultSet r=st.executeQuery("select *from temp where sts='duplicate'");
while(r.next()){%>
<tr height="10"></strong></td><td><strong><%=r.getString(1)%></td><td><strong><%=r.getString(2)%></td><td><strong><%=r.getString(5)%></td>
<td><a href="reEnc1.jsp?fid=<%=r.getString(1)%>"><font size="" color="#3366ff"><strong>View</center></font></a></td></tr>
<%}%>
<%}catch(Exception e){e.printStackTrace();}%>
</div ></table>
</body>
</html><br><br><br><br><br><br><br><br><br><br><br><br>
