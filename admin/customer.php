<?php 

?>

<div class="container-fluid mg-bt-170">
	
	<div class="row"></div>
	<br>
	<div class="col-lg-12">
		<div class="card ">
			<div class="card-header">
                <h6 class="font-weight-bold text-primary" style="margin: 0;">Danh sách tài khoản khách hàng</h6>
            </div>
			<div class="card-body">
				<table class="table-striped table-bordered">
			<thead>
				<tr>
					<th class="text-center">STT</th>
					<th class="text-center">Họ tên</th>
					<th class="text-center">Địa chỉ</th>
					<th class="text-center">Điện thoại</th>
					<th class="text-center">Email</th>
                    <th class="text-center">Ngày tạo</th>
                    <th class="text-center">Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<?php
 					include 'db_connect.php';
 					$customer = $conn->query("SELECT * FROM customers order by name asc");
 					$i = 1;
 					while($row= $customer->fetch_assoc()):
				 ?>
                    <tr>
                        <td class="text-center">
                            <?php echo $i++ ?>
                        </td>
                        <td class="text-center">
                            <?php echo ucwords($row['name']) ?>
                        </td>
                        
                        <td class="text-left">
                            <?php echo $row['address'] ?>
                        </td>
                        <td class="text-center">
                            <?php echo $row['contact'] ?>
                        </td>
                        <td class="text-center">
                            <?php echo $row['email']?>
                        </td>
                        <td class="text-center">
                            <?php echo date("M d,Y",strtotime($row['date_created']))?>
                        </td>
                        <td>
                            <center>
                                <div class="btn-group">
                                <button type="button" class="btn btn-primary btn-sm">Action</button>
                                <button type="button" class="btn btn-primary btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <div class="dropdown-menu left-40">
                                    <a class="dropdown-item delete_customer" href="javascript:void(0)" data-id = '<?php echo $row['id'] ?>'>Xóa</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item disable_account" href="javascript:void(0)" data-id = '<?php echo $row['id'] ?>'>Chặn Tài Khoản</a>
                                </div>
                                </div>
                            </center>
                        </td>
                    </tr>
				<?php endwhile; ?>
			</tbody>
		</table>
			</div>
		</div>
	</div>

</div>
<script>
	$('table').dataTable();

$('.delete_customer').click(function(){
		_conf("Bạn có chắc muốn xóa tài khoản khách hàng này?","delete_customer",[$(this).attr('data-id')])
	})
	function delete_customer($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_customer',
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
</script>