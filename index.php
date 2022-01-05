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
                        <div class="header__search-input-wrap">
                            <input type="text" class="header__search-input" placeholder="Nhập để tìm kiếm sản phẩm">
                       </div>
                        <div class="header__search-select">
                            <span class="header__search-select-label">Trong shop</span>

                            <i class="header__search-select-icon fas fa-angle-down"></i>
                                              
                            <!-- <ul class="header__search-option">
                                <li class="header__search-option-item">
                                    <span>Trong shop</span>
                                    <i class="fas fa-check"></i>
                                </li>
                            </ul> -->
                        </div>
                        <button class="header__search-btn">
                            <i class="header__search-btn-icon fas fa-search"></i>
                        </button>
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
  <main id="main-field">
        <?php 
        $page = isset($_GET['page']) ? $_GET['page'] : 'home';
        include $page.'.php';
        ?>
       
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
        <!-- <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"></h5>
          </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" id='submit' onclick="$('#uni_modal form').submit()">Lưu</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          </div>
        </div> -->
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
    </script>

    <?php $conn->close() ?>
      
</html>
