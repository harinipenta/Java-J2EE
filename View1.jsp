  <%@ include file="publicheader.jsp"%>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <title>Attribute-Based Storage </title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,sk;
int i=0;byte data[]=null,Label[]=null;
%>
 <%
 String pars=null;

 try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();
ResultSet rss1=st1.executeQuery("select *from keygen");
if(rss1.next()){
pars=rss1.getString(2);
}
		

unm=(String)session.getAttribute("unm");
 fid=request.getParameter("fid");

ResultSet r1=st1.executeQuery("select sk from register where uid='"+unm+"'  ");
if(r1.next())
	{
	sk=r1.getString(1);
	}

ResultSet r=st.executeQuery("select fname,filedata,Label from publiccloud where fid="+fid+"  ");
if(r.next())
	{
	System.out.println("if");
	fnm=r.getString(1);
	data=r.getBytes(2);
	Label=r.getBytes(3);

}
}catch(Exception e11)
{
e11.printStackTrace();
}

%>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Storage Files</h2>
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
          <form name="sentMessage"  method="post" action="decrypt.jsp" id="demoForm" class="demoForm">
	       <h3><a href="" style="text-decoration:none">File Data</a></h3>
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
			<input type="text" value=<%=fnm%> class="form-control" 
			   	  id="name" name="sk" required
			          />
			  <p class="help-block"></p>
		   </div>
	         </div> 	
               <label>File Data ( ct )</label> <div class="control-group">
                  <div class="controls">
			 <textarea rows="10" cols="100" class="form-control" 
                      name="file" id="message" required readonly
		       style="resize:none"><%=new String(data)%></textarea>
					    <p class="help-block"></p>
		</div>
	    </div> 	
			 
			  <label>Label ( L )</label><div class="control-group">
                    <div class="controls">
			<input type="text" value="<%=new String(Label)%>" class="form-control" 
			   	  id="name" name="label" required readonly
			           />
			  <p class="help-block"></p>
		   </div>
	         </div> 
			
	     <div id="success"> </div> <!-- For success/fail messages -->
		 <br>
	   
          </form>

								</div>
								<div class="col-md-6">

								</div>
							</div>
	</div>
 
	</section>
	<br><br><br><br><br>
	 