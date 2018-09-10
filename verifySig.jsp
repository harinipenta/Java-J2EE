  <%@ include file="uheader.jsp"%>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   <title>Attribute-Based Storage </title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,cpabe.*,CME.Commitment_Scheme"%>
<%@ page import="java.sql.*"%>
<%! String aKey=null;
boolean status;%>
<% String fid=request.getParameter("fid");

	 

%>


<%!String  thisLine = null;
StringBuffer sb1=null;
boolean sts;
String filename=null,j,unm=null,fid=null,fnm=null,skey=null,b=null,aces=null,d=null,s;
int i=0;byte pubkey[]=null,Label[]=null;
%>
 <%

try{
Connection con = databasecon.getconnection();

String filedata=request.getParameter("file");

fnm=request.getParameter("fname");
fid=request.getParameter("fid");


Statement st1=con.createStatement();
ResultSet r1=st1.executeQuery("select pubkey,Label from publiccloud where fid="+fid+"  ");
if(r1.next())
	{
	pubkey=r1.getBytes(1);
	Label=r1.getBytes(2);
}
Commitment_Scheme cme=new Commitment_Scheme();

 sts=cme.Verify(filedata,pubkey,Label);
System.out.println(sts);

	 out.println("<script>alert('Label is Verified,Given FileData is Valid')</script>");
%>


<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">File Download</h2>
			</div>
		</div>
	</div>
	</section>
	<section id="content">
	<div class="container">
		<div class="row"> 
							<div class="col-md-12">
								
							</div>
						</div>
	<div class="row">
								<div class="col-md-6">
									
		   <!-- Form itself -->
          <form name="sentMessage"  method="post" action="finalDownload.jsp" id="demoForm" class="demoForm">
	       <h3><a href="" style="text-decoration:none">File Downloading</a></h3>
		   <label>File_Id</label><div class="control-group">
                    <div class="controls">
			<input type="text" class="form-control" 
			   	   placeholder="Name" id="name" name="fid" value=<%=fid%> required
			           data-validation-required-message="Please enter your name" />
			  <p class="help-block"></p>
		   </div>
	         </div>
		 <label>File Name</label><div class="control-group">
                    <div class="controls">
			<input type="text" class="form-control" 
			   	  name="fname" value=<%=fnm%> id="name"  required
			           data-validation-required-message="Please enter your name" />
			  <p class="help-block"></p>
		   </div>
	         </div> 	
               <label>File Data ( M )</label> <div class="control-group">
                  <div class="controls">
			 <textarea rows="10" cols="100" class="form-control" 
                      name="file" id="message" required
		       data-validation-required-message="Please enter your message" minlength="5" 
                       data-validation-minlength-message="Min 5 characters" 
                        maxlength="999" style="resize:none"><%=filedata%></textarea>
					    <p class="help-block"></p>
		</div>
	    </div> 	
			   
	     <div id="success"> </div> <!-- For success/fail messages -->
		 <br>
	    <button type="submit" class="btn btn-primary pull-right">Download</button><br />
          </form>

								</div>
								<div class="col-md-6">

								</div>
							</div>
	</div>
 
	</section>
	<%
	}
	catch(Exception e){
	e.printStackTrace();
	}%>
	<br><br><br><br><br>

 