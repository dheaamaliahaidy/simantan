<div class="main"> 
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">Dashboard</h3>
							<p class="panel-subtitle"><b>Welcome <?= $this->session->userdata('nama_pegawai'); ?> (<?= $this->session->userdata('jabatan'); ?>)</b></p>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<a href="<?php echo site_url('admin/surat-internal/masuk');?>">
										<div class="card-counter primary">
											<i class="fa fa-envelope"></i>
											<span class="count-numbers"><?php echo $set_internal_masuk;?></span>
											<span class="count-name">Surat Internal Masuk</span>
										</div>
									</a>
								</div>

								<div class="col-md-3">
									<a href="<?php echo site_url('admin/surat-internal/keluar');?>">
										<div class="card-counter danger">
											<i class="fa fa-envelope-o"></i>
											<span class="count-numbers"><?php echo $set_internal_keluar;?></span>
											<span class="count-name">Surat Internal Keluar</span>
										</div>
									</a>
								</div>

								<div class="col-md-3">
									<a href="<?php echo site_url('admin/surat-eksternal/masuk');?>">
										<div class="card-counter primary">
											<i class="fa fa-envelope"></i>
											<span class="count-numbers"><?php echo $set_eksternal_masuk;?></span>
											<span class="count-name">Surat Eksternal Masuk</span>
										</div>
									</a>
								</div>

								<div class="col-md-3">
									<a href="<?php echo site_url('admin/surat-eksternal/keluar');?>">
										<div class="card-counter danger">
											<i class="fa fa-envelope-o"></i>
											<span class="count-numbers"><?php echo $set_eksternal_keluar;?></span>
											<span class="count-name">Surat Eksternal Keluar</span>
										</div>
									</a>
								</div>
							</div>
							<div class="row"> <!-- Baris ke-2 -->
								<div class="col-md-3">
									<a href="<?php echo site_url('admin/akun');?>"></a>
								<div class="card-counter info">
									<i class="fa fa-users"></i>
									<span class="count-numbers"><?php echo $set_akun;?></span>
									<span class="count-name">Akun Pengguna</span>
								</div>
								</div>

								<div class="col-md-3">
									<a href="<?php echo site_url('admin/unit-kerja');?>">
										<div class="card-counter success">
											<i class="fa fa-building"></i>
											<span class="count-numbers"><?php echo $set_unit;?></span>
											<span class="count-name">Unit Kerja</span>
										</div>
									</a>
								</div>

								<div class="col-md-3">
									<a href="<?php echo site_url('admin/jabatan');?>">
										<div class="card-counter warning">
											<i class="fa fa-star-o"></i>
											<span class="count-numbers"><?php echo $set_jabatan;?></span>
											<span class="count-name">Jabatan</span>
										</div>
									</a>
								</div>

								<div class="col-md-3">
									<a href="<?php echo site_url('admin/pegawai');?>">
										<div class="card-counter info">
											<i class="fa fa-id-badge"></i>
											<span class="count-numbers"><?php echo $set_pegawai;?></span>
											<span class="count-name">Pegawai</span>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					
					
