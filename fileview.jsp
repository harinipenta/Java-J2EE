<%@ include file ="uheader.jsp"%>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">User Home</h2>
			</div>
		</div>
	</div>
	</section>
	<section id="content">
	<div class="container">
		<div class="row"> 
							<div class="col-md-12">
								<h3><a href="" style="text-decoration:none">File Downloading</a></h3>
<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  
<%if(request.getParameter("msg")!=null){
	  out.println("<script>alert('Sorry, this file can not  Access by You')</script>");
}
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();
%>
<table border=2  cellpadding="10dp" cellspacing="20dp"><tr><th>Fid.</th><th>FileName</th><th>FileData</th></tr>
<%
ResultSet r=st.executeQuery("select *from filestore");
while(r.next()){%>
<tr><td><strong><%=r.getInt(1)%></strong></td><td><strong><%=r.getString(2)%></td><td><strong><a href="View.jsp?id=<%=r.getInt(1)%>"><font size="" color="#3366cc">View</font></td>
<%}}catch(Exception e){e.printStackTrace();}%>
</div ></table>
<br><br><br><br><br><br>
							</div>
						</div>
	</div>
 
	</section>
	<br><br><br><br><br>
 