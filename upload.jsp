<%@ include file ="dheader.jsp"%>
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
				<% if(request.getParameter("msg")!=null){%>
	  <font  color="006600"><b>File Uploaded Successfully</font>
<%}
if(request.getParameter("errormsg")!=null){%>
	  <font  color="red"><b>Invalid Proof, Please Upload same file again ..!</font>
	  <%
}

%>					
		   <!-- Form itself -->
          <form name="sentMessage" id="contactForm"  method="post" action="UploadAnyFiles" enctype="multipart/form-data">
	       <h3>File Upload</h3>
		 <div class="control-group">
                    <div class="controls">
			<input type="file" class="form-control"  accept=".txt" 
			   	   placeholder="UserName" id="name" name="file" required
			           data-validation-required-message="Please enter your name" />
			  <p class="help-block"></p>
		   </div>
	         </div> 	
                			  
	     <div id="success"> </div> <!-- For success/fail messages -->
		 <br>
	    <button type="submit" class="btn btn-primary pull-right">Next</button><br />
          </form>
								</div>
								<div class="col-md-6">

								</div>
							</div>
	</div>
 
	</section>
	<br><br><br><br><br>
 