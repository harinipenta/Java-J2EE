  <%@ include file="dheader.jsp"%>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Attribute-Based Storage</title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script>  
function f1Submit() {  
alert('skT and CT =( T , L, ct, pf ) are forwarded to the Private Cloud..!');  
alert('Wait until get the Result');  
document.f1.action="req1.jsp";  
document.f1.submit(); 
}
</script>
</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*,SHA.*,CME.*,cryptographic.*,cpabe.*,it.unisa.dia.gas.jpbc.Element"%>
<%! int rno=0;
String s=null;String filedata=null;%>
<%
String acces=request.getParameter("idss");
 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fnm");
	 String pars=request.getParameter("pars");
	 filedata=request.getParameter("file");

String Tags =SHA.SHA_256(filedata,"sha-256");

Commitment_Scheme cme=new Commitment_Scheme();
cme.keyGeneration();

byte[] publicKey=cme.getPublicKey();

byte[] privateKey=cme.getPrivateKey();

byte[] Label=cme.Sign(filedata,privateKey);

Zero_Knowledge_Proof.initialize();

double pf=Zero_Knowledge_Proof.proof();

Element skt=Cpabe.getTrapdoorKey(pars.getBytes());
System.out.println("skt="+skt);
 Connection con1=databasecon.getconnection();
 Statement stmt=con1.createStatement();
 stmt.executeUpdate("delete from temp");
 PreparedStatement p=con1.prepareStatement("insert into temp values(?,?,"+Cpabe_enc+"(?,'"+pars+"'),?,?,?,?,?,?,?,?)");
p.setInt(1,Integer.parseInt(fid));
p.setString(2,fnm);
p.setBytes(3,new String(filedata).getBytes());
p.setString(4,acces);
p.setString(5,unm);
p.setString(6,Tags);
p.setBytes(7,Label);
p.setString(8, Double.toString(pf));
p.setString(9,skt.toString());
p.setString(10,"validtest");
p.setBytes(11,publicKey);
int i=p.executeUpdate();
if(i>0){
stmt.executeUpdate("delete from temp1");
}



 %>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
byte data[]=null;
%>
<% 
	
Connection con=databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();

ResultSet r1=st.executeQuery("select filedata,Tag,Label,pf from temp where fid="+fid+" ");
if(r1.next())
	{
data=r1.getBytes(1);

	
%>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">File Upload</h2>
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
          <form name="f1"  method="post"  id="demoForm" class="demoForm">
	       <h3><a href="" style="text-decoration:none">FileEncrypting</a></h3>
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
			   	  id="name" name="fnm" required
			          />
			  <p class="help-block"></p>
		   </div>
	         </div> 	
               <label>Ciphertext ( ct )</label> <div class="control-group">
                  <div class="controls">
			 <textarea rows="10" cols="100" class="form-control" 
                      name="ct" id="message" required
		      
                       data-validation-minlength-message="Min 5 characters" 
                        maxlength="999" style="resize:none"><%=new String(data)%></textarea>
					    <p class="help-block"></p>
		</div>
	    </div> 	
			   <label>Tag ( T )</label><div class="control-group">
                    <div class="controls">
			<input type="text" value=<%=r1.getString(2)%> class="form-control" 
			   	  id="name" name="tag" required
			           />
			  <p class="help-block"></p>
		   </div>
	         </div> 
			  <label>Label ( L )</label><div class="control-group">
                    <div class="controls">
			<input type="text" value="<%=new String(r1.getBytes(3))%>" class="form-control" 
			   	  id="name" name="label" required />
			  <p class="help-block"></p>
		   </div>
	         </div> 
			  <label>Proof ( pf )</label><div class="control-group">
                    <div class="controls">
			<input type="text" value=<%=r1.getString(4)%> class="form-control" 
			   	  id="name" name="pf" required
			           data-validation-required-message="Please enter your name" />
			  <p class="help-block"></p>
		   </div>
	         </div>
			 <label>TrapdoorKey ( skT )</label><div class="control-group">
                    <div class="controls">
			<input type="skt" value=<%=skt%> class="form-control" 
			   	  id="name" name="fnm" required readonly
			           data-validation-required-message="Please enter your name" />
			  <p class="help-block"></p>
		   </div>
	         </div>
			 
	     <div id="success"> </div> <!-- For success/fail messages -->
		 <br>
	    <button type="submit" onclick="f1Submit()" class="btn btn-primary pull-right">SEND</button><br />
          </form>

								</div>
								<div class="col-md-6">

								</div>
							</div>
	</div>
 
	</section>
	<%}%>
	<br><br><br><br><br>
	 