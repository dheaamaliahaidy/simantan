
    <div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center"><img src="<?php echo base_url('assets/img/logomenhub.png');?>" alt="Logo PAS" width="50"></div>
								<p class="lead">Login to your account</p>
								<?php echo $this->session->flashdata('notif_login');?>
							</div>
							<?php echo form_open('login/signin',array('class' => 'form-auth-small'));?>
							    
								<div class="form-group">
									<label for="signin-email" class="control-label sr-only">Email</label>
									<input type="email" class="form-control" id="signin-email" name="email" placeholder="Email">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Password</label>
									<input type="password" class="form-control" id="signin-password" name="password" placeholder="Password">
								</div>
								
								<input type="submit" name="submit" class="btn btn-primary btn-lg btn-block" value="Login">
								
							<?php echo form_close();?>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h1 class="heading">SISTEM INFORMASI MANAJEMEN PERSURATAN </h1>
							<p>PUSAT ARSIP KEMENTERIAN PERHUBUNGAN</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	