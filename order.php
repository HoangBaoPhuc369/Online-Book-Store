<!DOCTYPE html>
<html lang="en">
    <?php
    session_start();
    include('admin/db_connect.php');
    ob_start();
        $query = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
         foreach ($query as $key => $value) {
          if(!is_numeric($key))
            $_SESSION['system'][$key] = $value;
        }
    ob_end_flush();
    include('header.php');
    
    if(isset($_GET['id'])){
        $qry = $conn->query("SELECT * FROM books where id= ".$_GET['id']);
        foreach($qry->fetch_array() as $k => $val){
            $$k=$val;
        }
       
        if(!empty($category_ids))
        $cat_qry = $conn->query("SELECT * FROM categories where id in ($category_ids)");
        $cname = array();
        while($row=$cat_qry->fetch_array()){
            $cname[$row['id']] = ucwords($row['name']);
        }
    }
	
    ?>

    <style type="text/css">
        #main-field {
            background: #f5f5f5;
        }
        .cart-img {
            width: calc(20%);
            height: 13vh;
            padding: 3px
        }
        .cart-img img {
            width: 100%;
            height: 100%;
        }
        .cart-qty {
            font-size: 14px
        }
        .img-field{
        width: calc(28%);
        max-height: 150px;
        overflow: hidden;
        display: flex;
        justify-content: center;
        margin-left: 20px;
        }
        .detail-field{
            width: calc(50%);
        }
        .amount-field{
            text-align:right;
            display: flex;
            align-items: center;
            justify-content: center;
            color: rgb(255, 66, 78);
        }
        .img-field img{
            max-width: 100%;
            max-height: 100%;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
        }
    </style>
    <body id="page-top">
      <!-- Navigation-->
      <div class="toast" id="alert_toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body text-white">
        </div>
      </div>
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <nav class = "navbar-header-top hide-on-mobile-tablet  wide-p-0">
               <div class="grid wide">
                <ul class="navbar-nav mg-t-0 ml-auto jus-cont-rig">
                        <li class="nav-item">
                            <i class="fas fa-home"></i>
                            <a class="nav-link js-scroll-trigger header-link" style="padding-left: 0" href="./">Trang chủ</a>
                        </li>
                        <?php if(isset($_SESSION['login_id'])): ?>
                        <?php endif; ?>
                            
                        <li class="nav-item">
                            <i class="fas fa-question-circle"></i>
                            <a class="nav-link js-scroll-trigger header-link" style="padding-left: 0" href="index.php?page=about">Ebooks</a>
                        </li>
                        <?php if(isset($_SESSION['login_id'])): ?>
                            <div class=" dropdown header__user-name">
                                <i class="fas fa-user-circle"></i>
                                <a href="#" class="dropdown-toggle header__nav-user--link"  id="account_settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $_SESSION['login_name'] ?> </a>
                                <div class="dropdown-menu header__navbar-user-menu" aria-labelledby="account_settings" style="left: -3em;">
                                <a class="dropdown-item header__navbar-user-item" href="javascript:void(0)" id="manage_my_account">Quản lý tài khoản</a>
                                <a class="dropdown-item header__navbar-user-item" href="admin/ajax.php?action=logout2">Đăng xuất</a>
                            </div>
                        </div>
                        <?php else: ?>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger header-link" href="javascript:void(0)" id="login_now">Đăng nhập</a></li>
                        <?php endif; ?>
                    </ul>
               </div>
            </nav>
            <div class="navbar-header-bottom">
                <div class="container grid wide">
                    <div class="header-with-search jus-cont-space">
                        <label for="mobile-search-checkbox" class="header__mobile-search">
                            <i class="header__mobile-search-icon fas fa-search"></i>
                        </label>
                        <div class="header__logo mg-r-425 hide-on-tablet">
                          <div>
                            <a class="navbar-brand js-scroll-trigger primary-color" href="./"><?php echo $_SESSION['system']['name'] ?></a>
                          </div>              
                        </div>
    
                        <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">
                        
                        <form action="" method="POST" class="w-540">
                            <div class="header__search border-search">
                                <div class="header__search-input-wrap">
                                    <input type="text" class="header__search-input" placeholder="Nhập để tìm kiếm sản phẩm" name="key" value="<?=isset($_POST['key']) ? $_POST['key'] : "" ?>">
                               </div>
                                <button class="header__cart-search-btn" name="search">
                                    <i class="header__search-btn-icon fas fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>  
            </div>
        </nav>
        <main id = "main-field">
            <div class="container-fluid grid wide">	
                <div class="row sm-gutter app__contain">
                    <div class="line"></div>
                    <div class="cart__address">
                        <div class="cart__address-content">
                            <div class="cart__address-content-heading">
                                <div class="address-content-icon">
                                    <svg height="16" viewBox="0 0 12 16" width="12" class="shopee-svg-icon icon-location-marker"><path d="M6 3.2c1.506 0 2.727 1.195 2.727 2.667 0 1.473-1.22 2.666-2.727 2.666S3.273 7.34 3.273 5.867C3.273 4.395 4.493 3.2 6 3.2zM0 6c0-3.315 2.686-6 6-6s6 2.685 6 6c0 2.498-1.964 5.742-6 9.933C1.613 11.743 0 8.498 0 6z" fill-rule="evenodd"></path></svg>
                                </div>
                                <div>Địa chỉ nhận hàng</div>
                            </div>
                        </div>
                        <div class="cart__address-information">
                            <div class="cart__address-information-user">
                                <div class="information__user-name-phone"><?php echo $_SESSION['login_name'] ?> (+84) <?php echo $_SESSION['login_contact'] ?></div>
                                <div class="information__user-address"><?php echo $_SESSION['login_address'] ?></div>
                                <div class="information__user-default">MẶC ĐỊNH <?php echo $_SESSION['login_id'] ?></div>
                            </div>
                            <div class="cart__address-information-changes">THAY ĐỔi</div>
                            <div></div>
                        </div>
                    </div>
                    <?php 
                    $qry = $conn->query("SELECT cart.*,books.image_path,books.title,books.author,categories.name FROM books JOIN categories ON books.category_ids = categories.id JOIN cart ON books.id = cart.book_id where cart.customer_id = {$_SESSION['login_id']}");
                    $total = 0;
                    
                    ?>
                    <div class="cart__bill--header" id="header__cart">
                        <div class="cart__bill-left">
                            <p class=cart__bill-heading>Sản phẩm</p>
                        </div>
                        <div class="cart__bill-right">
                            <div class="grid">
                                <div class="row">
                                    <div class="l-4 d-flex justify-right">
                                        <p class="unit-cart">Đơn giá</p>
                                    </div>
                                    <div class="l-4 d-flex justify-right padding-right-30">
                                        <p class="amount-cart">Số lượng</p>
                                    </div>
                                    <div class="l-4 d-flex jus-cont-center">
                                        <p class="amount_of_price">Số tiền</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="cart__list-product">
                        <?php if($qry->num_rows > 0): ?>
                            <ul class="list-group grid">
                                <?php 
                                while($row= $qry->fetch_array()):
                                    $total += $row['qty']*$row['price'];
                                ?>
                                <li class="list-group__product--order" data-id="<?php echo $row['id'] ?>" data-price="<?php echo $row['price'] ?>">
                                    <div class="cart__bill-left">
                                        <div class="">
                                            <img src="admin/assets/uploads/<?php echo $row['image_path'] ?>"  alt="" class="img-fluid">
                                        </div>

                                        <div class="detail-field">
                                            <p class="book-name">Sách: <?php echo $row['title'] ?></p>
                                            <p class="book-author">Tác giả: <?php echo $row['author'] ?></p>
                                        </div>

                                        <div class="cart__product-main-classify">
                                            <div class="book-category">Thể loại sách: </div>
                                            <div class="book-cate-name"><?php echo $row['name'] ?></div>
                                        </div>
                                    </div>

                                    <div class="cart__bill-right">
                                        <div class="grid">
                                            <div class="row">
                                                <div class="l-4 d-flex justify-right">
                                                    <span class="product__unit-price"><?php echo number_format($row['price']) ?>đ</span>
                                                </div>
                                                <div class="l-4 d-flex justify-right">
                                                    <div class="d-flex product__amount-main">
                                                        <?php echo $row['qty'] ?>
                                                    </div>
                                                </div>
                                                <div class="l-4 d-flex jus-cont-center">
                                                    <div class="amount-field">
                                                        <span class="amount"><?php echo number_format($row['qty']*$row['price']) ?></span>
                                                        <span>đ</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            <?php endwhile; ?>
                            </ul>
                            <div class="cart__product-pay-total-order" id="total__product--price">
                                <div class="cart__bill-left"></div>
                                <div class="cart__bill-right">
                                    
                                    <div class="cart__product-order-total-right-all">Tổng Thanh Toán: </div>
                                
                                    <div class="cart__product-pay-total-right-price">
                                        <h4 class="text-right" id="tamount"><?php echo number_format($total) ?></h4>
                                        <span>đ</span>
                                    </div>
                                </div>
                            </div>
                        <?php else: ?>
                            
                           
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </main>
  <div class="modal fade" id="confirm_modal" role='dialog'>
    <div class="modal-dialog modal-md d-flex" role="document">
      <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Xác nhận</h5>
          </div>
          <div class="modal-body">
            <div id="delete_content"></div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" id='confirm' onclick="">Tiếp tục</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
          </div>
        </div>
    </div>
  </div>
  <div class="modal fade" id="uni_modal" role='dialog'>
   <div class="d-flex modal-wrap">
      <div class="modal-dialog modal-md" role="document">
      </div>
      <div class="modal-content">
        <div class="auth-form">
          <div class="modal-header">
            <h5 class="modal-title"></h5>
          </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" id='submit' onclick="$('#uni_modal form').submit()">Lưu</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          </div>
        </div>
      </div>                     

   </div>
  </div>
  <div class="modal fade" id="uni_modal_right" role='dialog'>
    <div class="modal-dialog modal-full-height book__information--width  modal-md" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span class="fa fa-arrow-right"></span>
        </button>
      </div>
      <div class="modal-body">
      </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="viewer_modal" role='dialog'>
    <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
              <button type="button" class="btn-close" data-dismiss="modal"><span class="fa fa-times"></span></button>
              <img src="" alt="">
      </div>
    </div>
  </div>
  <div id="preloader"></div>
        <footer class="footer">
            <div class="grid wide footer__content">
                <div class="row">
                    <div class="col l-2-4 c-6">
                        <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                        <ul class="footer-list">
                            <li class="footer-item">
                                <a href="" class="footer-item__link">Trung trâm trợ giúp</a>
                            </li>
                            <li class="footer-item">
                                <a href="" class="footer-item__link">EBooks Mall</a>
                            </li>
                            <li class="footer-item">
                                <a href="" class="footer-item__link">Hướng dẫn mua hàng</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col l-2-4 c-6">
                        <h3 class="footer__heading">Về EBooks</h3>
                        <ul class="footer-list">
                            <li class="footer-item">
                                <a href="" class="footer-item__link">Giới thiệu về EBooks</a>
                                
                            </li>
                            <li class="footer-item">
                                <a href="" class="footer-item__link">Tuyển dụng</a>
                            </li>
                            <li class="footer-item">
                                <a href="" class="footer-item__link">Điều khoản EBooks</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col l-2-4 c-6">
                        <h3 class="footer__heading">Danh mục</h3>
                        <ul class="footer-list">
                            <li class="footer-item">
                                <a href="" class="footer-item__link">Sản Phẩm</a>
                            </li>
                            <li class="footer-item">
                                <a href="" class="footer-item__link">Top bán chạy</a>
                            </li>
                            <li class="footer-item">
                                <a href="" class="footer-item__link">Combo ưu đãi</a>
                            </li>
                        </ul>
                    </div>

                    <div class="col l-2-4 c-6">
                        <h3 class="footer__heading">Theo dõi chúng tôi trên</h3>
                        <ul class="footer-list">
                            <li class="footer-item">
                                <a href="" class="footer-item__link">
                                    <i class="footer-item__icon fab fa-facebook"></i>
                                    Facebook
                                </a>
                            </li>
                            <li class="footer-item">
                                <a href="" class="footer-item__link">
                                    <i class="footer-item__icon fab fa-instagram"></i>
                                    Instagram
                                </a>
                            </li>
                            <li class="footer-item">
                                <a href="" class="footer-item__link">
                                    <i class="footer-item__icon fab fa-linkedin-in"></i>
                                    LinkedIn
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="col l-2-4 m-8 c-12">
                        <h3 class="footer__heading">Liên hệ với chúng tôi</h3>
                        <ul class="footer-list">
                            <li class="footer-item">
                                <a href="" class="footer-item__link">
                                    <i class="footer-item__icon fas fa-phone"></i>
                                    <div class=""><?php echo $_SESSION['system']['contact'] ?></div>
                                </a>
                            </li>
                            <li class="footer-item">
                                <a href="mailto:<?php echo $_SESSION['system']['email'] ?>" class="footer-item__link footer__email-link">
                                    <i class="footer-item__icon far fa-envelope"></i>
                                    <?php echo $_SESSION['system']['email'] ?>
                                </a>
                            </li>
                        </ul>  
                    </div>

                </div>
            </div>
            
            <div class="footer-bottom">
                <div class="grid wide">
                    <p class="footer__text">Copyright © 2022 <?php echo $_SESSION['system']['name'] ?> - Nền tảng bán sách online hàng đầu</p>
                </div>
            </div>
        </footer>
        
       <?php include('footer.php') ?>
    </body>

    <script type="text/javascript">
      $('#login').click(function(){
        uni_modal("Đăng nhập",'login.php')
      })
      $('.datetimepicker').datetimepicker({
          format:'Y-m-d H:i',
      })
      $('#manage_my_account').click(function(){
          uni_modal("Quản lý tài khoản",'manage_account_user.php');
      })

      $('.btn-minus').click(function(){
		start_load()
            var qty = $(this).siblings('input').val()
                qty = qty > 1 ? parseInt(qty) - 1 : 1;
            var input = $(this).siblings('input')
            var id = $(this).closest('li').attr('data-id')
            $.ajax({
            	url:'admin/ajax.php?action=update_cart',
            	method:'POST',
            	data:{id:id,qty:qty},
            	success:function(resp){
            		if(resp == 1){
                		input.val(qty).trigger('change')
                		calc()
            			end_load()
            		}
            	}
            })
     })
     $('.btn-plus').click(function(){
		start_load()
        var qty = $(this).siblings('input').val()
            qty = parseInt(qty) + 1;
        var input = $(this).siblings('input')
        var id = $(this).closest('li').attr('data-id')
        $.ajax({
        	url:'admin/ajax.php?action=update_cart',
        	method:'POST',
        	data:{id:id,qty:qty},
        	success:function(resp){
        		if(resp == 1){
            		input.val(qty).trigger('change')
            		calc()
        			end_load()
        		}
        	}
        })
     })
     function calc(){
     	$('.qty-input').each(function(){
     		var li = $(this).closest('li')
     		var price = li.attr('data-price')
     		var qty = $(this).val()
     		var amount = parseFloat(qty) * parseFloat(price);
     		li.find('.amount').text(parseFloat(amount).toLocaleString('en-US',{style:"decimal",maximumFractionDigits:2,minimumFractionDigits:2}))
     	})
     	var total = 0;
     	$('.amount').each(function(){
     		var amount = $(this).text()
     			amount = amount.replace(/,/g,'');
     			total += parseFloat(amount)
     	})
     	$('#tamount').text(parseFloat(total).toLocaleString('en-US',{style:"decimal",maximumFractionDigits:2,minimumFractionDigits:2}))
     }
     $('.rem_item').click(function(){
     	_conf("Bạn có chắc muốn bỏ sách khỏi giỏ hàng?","delete_cart",[$(this).attr('data-id')])
     })
     function delete_cart($id){
     	start_load()
     	$.ajax({
        	url:'admin/ajax.php?action=delete_cart',
        	method:'POST',
        	data:{id:$id},
        	success:function(resp){
        		if(resp == 1){
            		alert_toast("Sách đã được bỏ khỏi giỏ hàng","success");
        			setTimeout(function(){ location.reload() },750)
        		}
        	}
        })
     }
     $('#checkout').click(function(){
     	uni_modal('Thanh toán',"manage_order.php");
     })
    </script>

    <?php $conn->close() ?>
      
</html>
