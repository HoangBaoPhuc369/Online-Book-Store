<?php include('db_connect.php');?>

<div class="container-fluid mg-bt-170">
	
	<div class="col-lg-12">
		<div class="row">
			<!-- Table Panel -->
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h6 class="font-weight-bold text-primary" style="margin: 0;">Danh sách Sách</h6>
						<span class="float:right"><a class="btn btn-primary btn-sm col-sm-3 float-right" href="javascript:void(0)" id="new_book">
			                    <i class="fa fa-plus"></i> New 
			                </a></span>
					</div>
					<div class="card-body">
						<table class="table table-bordered table-hover">
							<colgroup>
								<col width="5%">
								<col width="15%">
								<col width="30%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="text-center">Ảnh</th>
									<th class="text-center">Chi tiết</th>
									<th class="text-center">Thể loại</th>
									<th class="text-center">Số lượng</th>
									<th class="text-center">Giá</th>
									<th class="text-center">Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$cname[0] = "Not Set";
								$categories = $conn->query("SELECT * FROM categories ");
								while($row = $categories->fetch_assoc()){
									$cname[$row['id']] = ucwords($row['name']);
								}
								$book = $conn->query("SELECT * from books order by title asc");
								while($row=$book->fetch_assoc()):
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td class="text-center">
										<div class="d-flex w-100 jus-cont-center">
					    					<div class="img-field img-thumbnail rounded">
					    						<img src="assets/uploads/<?php echo $row['image_path'] ?>"  alt="" class="img-fluid rounded">
					    					</div>
										</div>
									</td>
									<td class="">
										<p>Title: <b><?php echo $row['title'] ?></b></p>
										<p><small>Tác giả: <b><?php echo $row['author'] ?></b></small></p>
										<p><small>Mô tả: <span class="truncate"><?php echo $row['description'] ?></span></small></p>
									</td>
									<td class="">
										<p>
											<b>
											<?php 
											$cats = '';
											$cat = explode(',', $row['category_ids']);
											foreach ($cat as $key => $value) {
												if(!empty($cats)){
													$cats .=", ";
												}
												if(isset($cname[$value])){
													$cats .= $cname[$value];
												}
											}
											echo $cats;
											?>
											</b>
										</p>
									</td>
									<td class="">
										<p class="text-right"><b><?php echo number_format($row['qty']) ?></b></p>
									</td>
									<td class="">
										<p class="text-right"><b><?php echo number_format($row['price'],2) ?></b></p>
									</td>
									<td class="text-center">
										<button class="btn btn-sm btn-primary edit_book" type="button" data-id="<?php echo $row['id'] ?>">Edit</button>
										<button class="btn btn-sm btn-danger delete_book" type="button" data-id="<?php echo $row['id'] ?>">Delete</button>
									</td>
								</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
		</div>
	</div>	

</div>
<style>
	
	td{
		vertical-align: middle !important;
	}
	td p {
		margin:unset;
	}
	.custom-switch{
		cursor: pointer;
	}
	.custom-switch *{
		cursor: pointer;
	}
	.img-field{
		width: calc(80%);
    	height: 128px;
		overflow: hidden;
		display: flex;
		justify-content: center;
	}

	.img-field img{
		max-width: 100%;
		max-height: 100%;
	}
	/*.img img{
		max
	}*/
</style>
<script>
	$('#new_book').click(function(){
		uni_modal("Thêm sách mới","manage_book.php","mid-large")
	})
	$('.edit_book').click(function(){
		uni_modal("Quản lý dữ liệu sách","manage_book.php?id="+$(this).attr('data-id'),"mid-large")
	})
	$('#manage-book').on('reset',function(){
		$('input:hidden').val('')
		$('.select2').val('').trigger('change')
	})
	
	$('#manage-book').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'ajax.php?action=save_book',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp==1){
					alert_toast("Thêm mới dữ liệu thành công",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
				else if(resp==2){
					alert_toast("Cập nhật dữ liệu thành công",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	})
	$('.delete_book').click(function(){
		_conf("Bạn có muốn xóa sách này?","delete_book",[$(this).attr('data-id')])
	})
	function delete_book($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_book',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Xóa dữ liệu thành công",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
	$('table').dataTable()
</script>