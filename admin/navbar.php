
<style>
	.collapse a{
		text-indent:10px;
	}
	nav#sidebar{
		/*background: url(assets/uploads/<?php echo $_SESSION['system']['cover_img'] ?>) !important*/
	}
</style>

<ul id="accordionSidebar" class='navbar-nav bg-gradient-primary sidebar sidebar-dark accordion'>
	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="./">
		<div class="sidebar-brand-icon rotate-n-15" style="font-size: 35px">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3" style="font-weight: 600">Admin Page</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">


	<li class="nav-item nav-home">
		<a href="index.php?page=home" class="nav-link">
			<i class="fa fa-tachometer-alt "></i>
			<span>Bảng tin</span> 
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<li class="nav-item nav-orders">
		<a href="index.php?page=orders" class="nav-link">
			<i class="fa fa-clipboard-list"></i>
			<span>Quản lý hóa đơn</span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<?php if($_SESSION['login_type'] == 1): ?>

	<div class="sidebar-heading" style="font-weight: 700;">Main list</div>

	<li class="nav-item nav-categories">
		<a href="index.php?page=categories" class="nav-link">
			<i class="fa fa-list-alt "></i>
			<span>Quản lý danh mục</span>
		</a>
	</li>

	<li class="nav-item nav-books">
		<a href="index.php?page=books" class="nav-link">
			<i class="fa fa-book "></i>
			<span>Quản lý sách</span> 
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<?php endif; ?>
	<div class="sidebar-heading" style="font-weight: 700;">Reports</div>
	<li class="nav-item nav-sales_report">
		<a href="index.php?page=sales_report" class="nav-link">
			<i class="fa fa-th-list"></i>
			<span>Báo cáo doanh thu</span> 
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<?php if($_SESSION['login_type'] == 1): ?>
	<div class="sidebar-heading" style="font-weight: 700;">Systems</div>
	<li class="nav-item nav-customer">
		<a href="index.php?page=customer" class="nav-link">
			<i class="fas fa-users"></i>			
			<span>Quản lý tài khoản khách hàng</span> 
		</a>
	</li>
	<li class="nav-item nav-users">
		<a href="index.php?page=users" class="nav-link">
			<i class="fas fa-users-cog"></i>			
			<span>Quản lý tài khoản nhân viên</span> 
		</a>
	</li>
	<li class="nav-item nav-site_settings">
		<a href="index.php?page=site_settings" class="nav-link">
			<i class="fa fa-cogs"></i>
			<span>Cài đặt hệ thống</span> 
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">
	<?php endif; ?>
</ul>
<script>
	$('.nav_collapse').click(function(){
		console.log($(this).attr('href'))
		$($(this).attr('href')).collapse()
	})
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>
