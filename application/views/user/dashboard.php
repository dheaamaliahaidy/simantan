<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">Dashboard</h3>
							<p class="panel-subtitle">Selamat Datang <?php echo $name;?></p>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
								<div class="card-counter primary">
									<i class="fa fa-envelope"></i>
									<span class="count-numbers"><?php echo $set_internal_masuk;?></span>
									<span class="count-name">Surat Internal Masuk</span>
								</div>
								</div>

								<div class="col-md-3">
								<div class="card-counter danger">
									<i class="fa fa-envelope-o"></i>
									<span class="count-numbers"><?php echo $set_internal_keluar;?></span>
									<span class="count-name">Surat Internal Keluar</span>
								</div>
								</div>

								<div class="col-md-3">
								<div class="card-counter primary">
									<i class="fa fa-envelope"></i>
									<span class="count-numbers"><?php echo $set_eksternal_masuk;?></span>
									<span class="count-name">Surat Eksternal Masuk</span>
								</div>
								</div>

								<div class="col-md-3">
								<div class="card-counter danger">
									<i class="fa fa-envelope-o"></i>
									<span class="count-numbers"><?php echo $set_eksternal_keluar;?></span>
									<span class="count-name">Pegawai</span>
								</div>
								</div>
							</div>
							
							
						</div>
					</div>
					
