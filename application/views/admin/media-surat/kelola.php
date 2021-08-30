<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
				    <?php echo $this->session->flashdata('notify');?>
				    <?php echo validation_errors();?>
					<!-- OVERVIEW -->
									    <a href="#" class="act-btn" onclick="add_supplier() ">+</a>

					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">Kelola Media Pengiriman Surat</h3>
							<p class="panel-subtitle">Admin / Pengaturan / Media Pengiriman Surat</p>
						</div>
						<div class="panel-body">
						
							<table class="display" id="data">
							    <thead>
							        <tr>
                                        <th>No.</th>
							            <th>Media Surat</th>
							            <th>Keterangan</th>
							            <th>Opsi</th>
							        </tr>
							    </thead>
							    <tbody>
							        
                                    <?php $no = 1; foreach($set as $row){ ?>
                                    <tr>
                                        <td><?php echo $no++;?></td>
							            <td><?php echo $row->nama_media;?></td>
							            
							            <?php if(empty($row->keterangan)) { ?>
                                            <td><small style="color:red">Keterangan Kosong</small></td> 
							            <?php } else { ?>
							                <td><?php echo $row->keterangan;?></td> 
							            <?php } ?>     
							            <td>
							                <button class="btn btn-warning" onclick="edit_supplier(<?php echo $row->id_media;?>)"><i class="fa fa-edit"></i> Edit</button> 
							                 <?php echo anchor('media-surat/destroy/'.$row->id_media,'<button class="btn btn-danger"><i class="fa fa-trash"></i> Hapus</button>',array('onclick' => 'return confirm("Anda yakin ingin menghapus data ini?")'));?> 
							            </td>
							            </tr>
							         <?php } ?>   
							        
							    </tbody>
							</table>
						</div>
					</div>
				
			<!-- END MAIN CONTENT -->
		</div>
    </div>
</div>

<script>
    
   
    function add_supplier(){
        $('#form')[0].reset();
        $("#myModal").modal('show');
        $('.modal-title').text('Tambah Media Surat'); // Set title to Bootstrap modal title
        $('[name=submit]').val('Tambah').show();
        $('#form').attr('action','<?php echo site_url('media-surat/create');?>');
        $('.modal-footer').show();
    }

    function edit_supplier(id)
    {
      save_method = 'update';
      $('#form')[0].reset(); // reset form on modals

      //Ajax Load data from ajax
      $.ajax({
        url : "<?php echo base_url('media-surat/get')?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data)
        {
            $('[name="id_media"]').val(data.id_media);
            $('[name="nama_media"]').val(data.nama_media);
            $('[name="keterangan"]').val(data.keterangan);
            $('#myModal').modal('show'); // show bootstrap modal when complete loaded
            $('.modal-title').text('Edit Media Surat'); // Set title to Bootstrap modal title
            $('[name=submit]').val('Edit').show();
            $('.modal-footer').show();
            $('#form').attr('action','<?php echo site_url('media-surat/update');?>');
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax'+jqXHR);
        }
    });
    }
</script>

<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog ">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Tambah Jenis Kegiatan</h4>
      </div>
      <div class="modal-body">
        <?php echo form_open('media-surat/create',array('id' => 'form'));?>
        <input type="hidden"  name="id_media"/>

        <div class="form-group">
            <label>Media Surat</label>
            <input type="text" name="nama_media" class="form-control">
        </div>
        
        
        <div class="form-group">
           <label>Keterangan</label><small style="color:red">*optional</small>
           <textarea name="keterangan" class="form-control"></textarea>
        </div>
        
        <div class="modal-footer">
            <input type="submit" name="submit" value="Tambah" class="btn btn-success">
            <?php echo form_close();?>
        </div>
      </div>
      
    </div>

  </div>
</div>
