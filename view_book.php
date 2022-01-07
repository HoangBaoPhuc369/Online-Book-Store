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

    <style>
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
    </style>
    <body id="page-top">
      <!-- Navigation-->
      <div class="toast" id="alert_toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body text-white">
        </div>
      </div>
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
          <div class="container grid wide">
            <nav class="header__navbar hide-on-mobile-tablet">              
                 
                  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                  <div class="collapse navbar-collapse" id="navbarResponsive">
                      <ul class="navbar-nav ml-auto">
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
             <div class="header-with-search">
                    <label for="mobile-search-checkbox" class="header__mobile-search">
                        <i class="header__mobile-search-icon fas fa-search"></i>
                    </label>
                    <div class="header__logo hide-on-tablet">
                      <div>
                        <a class="navbar-brand js-scroll-trigger" href="./"><?php echo $_SESSION['system']['name'] ?></a>
                      </div>              
                    </div>

                    <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">
                    <div class="header__search">
                    <form action="" method="POST" class="header__search">
                        <div class="header__search-input-wrap">
                            <input type="text" class="header__search-input" placeholder="Nhập để tìm kiếm sản phẩm" name="key" value="<?=isset($_POST['key']) ? $_POST['key'] : "" ?>">
                       </div>
                        <div class="header__search-select">
                            <span class="header__search-select-label">Trong shop</span>
                            <i class="header__search-select-icon fas fa-angle-down"></i>
                        </div>
                        <button class="header__search-btn" name="search">
                            <i class="header__search-btn-icon fas fa-search"></i>
                        </button>
                        </form>
                    </div>

                    <div class="header__cart">
                        <div class="header__cart-wrap">
                          <ul class="navbar-nav ml-auto">
                              <li class="nav-item dropdown cart__list--items">
                                <a class="dropdown-toggle header__cart-list--dropdown"  data-toggle="dropdown" aria-expanded="true">
                                  <div id = "header__cart-list--amount"></div>
                                  <i class="fa fa-shopping-cart" style = "font-size: 24px"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu__animated  header__cart-list--menu" aria-labelledby="dropdownMenuButton" style="width: 400px">
                                  <div class="cart-list w-100 " id="cart_product"></div>
                                    <div class="d-block text-center header__cart-no-cart" id="cart-no-product">
                                      <img src="./assets/img/cart.png" class="header__cart-no-cart-img" alt="Giỏ hàng của bạn trống">
                                      <span class="header__cart-list-no-cart-msg">Chưa có sản phẩm</span>
                                    </div>
                                    <div class="d-flex justify-content-center w-100 p-2" id="cart_product--view-btn"></div>
                                  </div>
                               </li>
                          </ul>
                        </div>
                      </div>
                </div>
            </div>  
        </nav>
    <div class="main__view-books">
        <div class="container-fluid grid wide">
            <div class="row sm-gutter background-white">
                <div class="col p-5 wide-p-5 t-12 m-12 product__container">
                    <div class="product__image-main">
                        <img src="admin/assets/uploads/<?php echo $image_path ?>" class="product__image" alt="">
                    </div>
                </div>
                <div class="col p-7 wide-p-7 t-12 m-12 product__description">
                    <p class="product-title">Sách - <large><?php echo $title ?></large></p>
                    <!-- <p>Tác giả: <b><?php echo $author ?></b></p>
                    <p>Thể loại: <b> -->
                    <!-- <?php 
                    $cats = '';
                    $cat = explode(',', $category_ids);
                    foreach ($cat as $key => $value) {
                        if(!empty($cats)){
                        $cats .=", ";
                        }
                        if(isset($cname[$value])){
                        $cats .= $cname[$value];
                        }
                    }
                    echo $cats;
                    ?> -->
                    </b></p>
                    <div class="product-price__wrap">
                        <p>₫<?php echo number_format($price) ?></p>
                    </div>
                    <!-- <p>Mô tả:</p>
                    <p class=""><small><i><?php echo $description ?></i></small></p> -->
                    <div class="product__amount">
                        <div class="product__amount-title">Số lượng</div>
                        <div class="d-flex product__amount-main mg-r-30">
                            <span class="product__amount-main-minus btn-minus"><b><i class="fa fa-minus"></i></b></span>
                            <input type="number" name="qty" id="qty" class="product__amount-main-input-content" value="1">
                            <span class="product__amount-main-plus btn-plus"><b><i class="fa fa-plus"></i></b></span>
                        </div>
                    </div>
                    <div class="d-flex jusctify-content-center product-btn">
                        <div class="product-btn-cart">
                            <div class="product-btn-cart-content">
                                <button class="btn btn-add-2-cart btn-block d-flex" type="button" id="add_to_cart">
                                    <div class="product-btn-cart-main">
                                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                viewBox="0 0 511.976 511.976" style="enable-background:new 0 0 511.976 511.976;" xml:space="preserve">
                                            <g>
                                                <g>
                                                    <path d="M208,399.988c-26.464,0-48,21.536-48,48s21.536,48,48,48s48-21.536,48-48S234.464,399.988,208,399.988z M208,463.988
                                                        c-8.832,0-16-7.168-16-16c0-8.832,7.168-16,16-16c8.832,0,16,7.168,16,16C224,456.82,216.832,463.988,208,463.988z"/>
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <path d="M400,399.988c-26.464,0-48,21.536-48,48s21.536,48,48,48s48-21.536,48-48S426.464,399.988,400,399.988z M400,463.988
                                                        c-8.832,0-16-7.168-16-16c0-8.832,7.168-16,16-16c8.832,0,16,7.168,16,16C416,456.82,408.832,463.988,400,463.988z"/>
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <path d="M508.256,85.748c-3.008-3.648-7.52-5.76-12.256-5.76H119.936l-13.92-52.128c-1.856-7.008-8.192-11.872-15.456-11.872H16
                                                        c-8.832,0-16,7.168-16,16c0,8.832,7.168,16,16,16h62.272l82.272,308.128c1.856,7.008,8.192,11.872,15.456,11.872h256
                                                        c8.832,0,16-7.168,16-16c0-8.832-7.168-16-16-16H188.288l-9.376-35.136l285.792-12.864c7.456-0.352,13.696-5.792,15.008-13.12
                                                        l32-176C512.576,94.196,511.296,89.396,508.256,85.748z M450.56,256.596l-280.128,12.608L128.48,111.988h348.352L450.56,256.596z"
                                                        />
                                                </g>
                                            </g>
                                            <g>
                                                <g>
                                                    <path d="M336,175.988h-16v-16c0-8.832-7.168-16-16-16c-8.832,0-16,7.168-16,16v16h-16c-8.832,0-16,7.168-16,16
                                                        c0,8.832,7.168,16,16,16h16v16c0,8.832,7.168,16,16,16c8.832,0,16-7.168,16-16v-16h16c8.832,0,16-7.168,16-16
                                                        C352,183.156,344.832,175.988,336,175.988z"/>
                                                </g>
                                            </g>
                                        </svg>  
                                    </div>

                                    <span class="product-btn-add-product-text">Thêm vào giỏ hàng</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row sm-gutter background-white mg-t-15 pad-10">
                <div class="col p-12 wide-p-12 t-12 m-12">
                    <div class="product__details">
                        <div class="product__details-title">
                        <span>Chi tiết sản phẩm</span>
                        </div>                      
                    </div>
                </div>
                <div class="col p-12 wide-p-12 t-12 m-12">
                    <div class="product__details-content">
                        <div class="grid">
                            <div class="row sm-gutter" style="margin: 0 10px;">
                                <div class="col l-1-4 m-0 c-0">
                                    <div class="product__details-content-list __details-content-list--left">
                                        <span>Thể loại </span>
                                        <span>Tác giả </span>
                                    </div>
                                </div>
                                <div class="col l-10 m-12 c-12">
                                    <div class="product__details-content-list __details-content-list--right">
                                        <span>
                                            <?php 
                                            $cats = '';
                                            $cat = explode(',', $category_ids);
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
                                        </span>
                                        <span><?php echo $author ?></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col p-12 wide-p-12 t-12 m-12">
                    <div class="product__details">
                        <div class="product__details-title">
                        <span>Mô tả sản phẩm</span>
                        </div>                      
                    </div>
                </div>
                <div class="col p-12 wide-p-12 t-12 m-12">
                    <div class="product__details-content __details-content--description"><?php echo $description ?></div>
                </div>
            </div>
        </div>
    </div>
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
            uni_modal("Quản lý tài khoản",'signup.php');
        })

        $('.btn-minus').click(function(){
                var qty = $(this).siblings('input').val()
                    qty = qty > 1 ? parseInt(qty) - 1 : 1;
                    $(this).siblings('input').val(qty).trigger('change')
            })
        $('.btn-plus').click(function(){
            var qty = $(this).siblings('input').val()
                qty = parseInt(qty) + 1;
                $(this).siblings('input').val(qty).trigger('change')
        })
        // $('#manage_bid')
        $('#add_to_cart').click(function(){
            if('<?php echo !isset($_SESSION['login_id']) ?>' == 1){
                    uni_modal("Vui lòng đăng nhập trước",'login.php')
                    return false
            }
            start_load()

            $.ajax({
                url:'admin/ajax.php?action=add_to_cart',
                method:'POST',
                data:{book_id: '<?php echo $id ?>',price: '<?php echo $price ?>', qty:$('#qty').val()},
                success:function(resp){
                    if(resp == 1){
                        alert_toast("Thêm sách vào giỏ hàng thành công.","success")
                        end_load()
                        load_cart()
                    }
                }
            })
        })	

    </script>

    <?php $conn->close() ?>
      
</html>
