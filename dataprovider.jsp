<%@ include file ="header.jsp"%>
<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Data Provider</h2>
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
          <form name="sentMessage" id="contactForm"  method="post" action="datacheck.jsp">
	       <h3>Data_Provider Login</h3>
		 <div class="control-group">
                    <div class="controls">
			<input type="text" class="form-control" 
			   	   placeholder="UserName" id="name" name="uname" required
			           data-validation-required-message="Please enter your name" />
			  <p class="help-block"></p>
		   </div>
	         </div> 	
                <div class="control-group">
                  <div class="controls">
			<input type="Password" class="form-control" placeholder="Password" name="pass"
			   	            id="email" required
			   		   data-validation-required-message="Please enter your email" />
		</div>
	    </div> 	
			  
              		 
	     <div id="success"> </div> <!-- For success/fail messages -->
		 <br>
	    <button type="submit" class="btn btn-primary pull-right">Login</button><br />
          </form>
								</div>
								<div class="col-md-6">

								</div>
							</div>
	</div>
 
	</section>
	<br><br><br><br><br>
  
