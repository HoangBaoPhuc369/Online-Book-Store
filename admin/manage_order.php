<?php include "db_connect.php" ?>
<?php 
if(isset($_GET['id'])){
	$qry = $conn->query("SELECT o.*,c.name FROM orders o inner join customers c on c.id = o.customer_id where o.id = ".$_GET['id']);
	foreach($qry->fetch_array() as $k => $v){
		$$k = $v;
	}
}
?>
<style type="text/css">
	.img-field{
		width: calc(25%);
		height: 156px;
		overflow: hidden;
		display: flex;
		justify-content: center
	}
	.detail-field{
		width: calc(50%);
	}
	.amount-field{
		width: calc(25%);
		text-align:right;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.img-field img{
		max-width: 100%;
		max-height: 100%;
	}
	.qty-input{
		width: 75px;
		text-align: center; 
	}

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }
</style>
<div class="container-fluid">
	<form action="" id="manage-order">
			<input type="hidden" name="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-6 border-right">
					<!-- <b class="text-muted"></b> -->
					<h6 class="font-weight-bold text-primary" style="margin: 0;">Quản lý hóa đơn</h6>
					 <?php 
					    $qry = $conn->query("SELECT o.*,b.image_path,b.title,b.author FROM order_list o inner join books b on b.id = o.book_id where o.order_id =$id ");
					    $total = 0;
					    ?>
					<?php if($qry->num_rows > 0): ?>
					    		<ul class="list-group">
					    			<?php 
					    			while($row= $qry->fetch_array()):
					    				$total += $row['qty']*$row['price'];
					    			?>
					    			<li class="list-group-item" data-id="<?php echo $row['id'] ?>" data-price="<?php echo $row['price'] ?>">
					    				<div class="d-flex w-100">
					    					<div class="img-field mr-4 img-thumbnail rounded">
					    						<img src="assets/uploads/<?php echo $row['image_path'] ?>"  alt="" class="img-fluid rounded">
					    					</div>
					    					<div class="detail-field">
					    						<p>Sách: <?php echo $row['title'] ?></p>
					    						<p>Tác giả: <?php echo $row['author'] ?></p>
					    						<p>Đơn giá: <?php echo number_format($row['price']) ?></p>
					    						<p>Số lượng: <?php echo number_format($row['qty']) ?></p>
					    					</div>
					    					<div class="amount-field">
					    						<span class="amount"><?php echo number_format($row['qty']*$row['price']) ?>đ</span>
					    					</div>
					    				</div>
					    			</li>
					    		<?php endwhile; ?>
					    		</ul>
					<?php endif; ?>
				</div>
				<div class="col-md-6">
					<!-- <b class="text-muted">Thông tin</b> -->
					<h6 class="font-weight-bold text-primary" style="margin: 0;">Thông tin</h6>
					<p>Khách hàng: <?php echo ucwords($name) ?></p>
					<p>Địa chỉ vận chuyển: <?php echo ucwords($address) ?></p>
					<p>Tổng tiền hóa đơn: <?php echo number_format($total) ?>đ</p>
					<div class="form-group">
						<label for="" class="control-label">Trạng thái</label>
						<select name="status" id="" class="custom-select custom-select-sm">
							<option value="0" <?php echo $status == 0 ? 'selected' : '' ?>>Chưa giải quyết</option>
							<option value="1" <?php echo $status == 1 ? 'selected' : '' ?>>Xác nhận</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
	$('#manage-order').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'ajax.php?action=update_order',
			method:'POST',
			data:$(this).serialize(),
			success:function(resp){
				if(resp == 1){
					alert_toast('Data successfully saved.',"success");
					setTimeout(function(){
						location.reload()
					},750)
				}
			}
		})
	})
</script>