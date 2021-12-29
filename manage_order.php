<?php session_start() ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<p>Giao dịch này chỉ chấp nhận tiền mặt khi giao hàng. Vui lòng đợi email xác minh hoặc cuộc gọi từ ban quản lý sau khi thanh toán</p>
		<form id="manage-order">
			<div class="form-group display-grid">
				<label for="" class="control-label">Địa chỉ vận chuyển</label>
				<textarea name="address" id="" cols="30" rows="4" class="form-control  resized-none" required=""><?php echo $_SESSION['login_address'] ?></textarea>
			</div>
		</form>
	</div>
</div>
<script>
	$('#manage-order').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'admin/ajax.php?action=save_order',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err)
			},
			success:function(resp){
				if(resp == 1){
					alert_toast('Order successfully submitted.',"success");
					setTimeout(function(){
						location.reload()
					},750)
				}
			}
		})
	})
</script>