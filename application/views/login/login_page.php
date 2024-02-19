<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-4 col-sm-offset-4 my-5  border border-4">
			<div class="login-panel panel panel-primary">
		        <div class="panel-heading">
		            <h3 class="panel-title"><span class="glyphicon glyphicon-lock"></span> Login
		            </h3>
		        </div>
		    	<div class="panel-body">
		        	<form method="POST" action="<?php echo base_url(); ?>/login/login">
		            	<fieldset>
		                	<div class="form-group">
		                    	<input class="form-control" placeholder="Email" type="text" name="email" required>
		                	</div>
		                	<div class="form-group">
		                    	<input class="form-control" placeholder="Password" type="password" name="password" required>
		                	</div>
		                	<button type="submit" class="btn btn-lg btn-primary btn-block"><span class="glyphicon glyphicon-log-in"></span> Login</button>
		            	</fieldset>
		        	</form>
		    	</div>
		    </div>
			<?php
				if($this->session->flashdata('error')){
					?>
					<div class="alert alert-danger text-center" style="margin-top:20px;">
						<?php echo $this->session->flashdata('error'); ?>
					</div>
					<?php
				}
			?>
		</div>
	</div>
</div>
</body>
</html>