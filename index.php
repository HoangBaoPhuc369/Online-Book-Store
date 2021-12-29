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
                          <li class="nav-item"><a class="nav-link js-scroll-trigger" href="./">Trang chủ</a></li>
                          <?php if(isset($_SESSION['login_id'])): ?>
                          <?php endif; ?>
                            
                          <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.php?page=about">Ebooks</a></li>
                          <?php if(isset($_SESSION['login_id'])): ?>
                        <div class=" dropdown mr-4 header__user-name">
                              <a href="#" class="text-white dropdown-toggle"  id="account_settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $_SESSION['login_name'] ?> </a>
                                <div class="dropdown-menu" aria-labelledby="account_settings" style="left: -2.5em;">
                                  <a class="dropdown-item" href="javascript:void(0)" id="manage_my_account"><i class="fa fa-cog"></i> Quản lý tài khoản</a>
                                  <a class="dropdown-item" href="admin/ajax.php?action=logout2"><i class="fa fa-power-off"></i> Đăng xuất</a>
                                </div>
                          </div>
                        <?php else: ?>
                          <li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:void(0)" id="login_now">Đăng nhập</a></li>
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
                            <!-- Search history -->
                            <!-- <div class="header__search-history">
                                <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
                                <ul class="header__search-history-list">

                                    <li class="header__search-history-item">
                                        <a href="">Kem dưỡng da</a>
                                    </li>

                                    <li class="header__search-history-item">
                                        <a href="">Kem trị mụn</a>
                                    </li>
                                    
                                </ul>
                            </div> -->
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
                                <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="true">
                                  <div class="badge-amount badge-danger cart-count">0</div>
                                  <i class="fa fa-shopping-cart"></i>
                                  <!-- <span>Cart</span> -->
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="width: 400px">
                                  <div class="cart-list w-100" id="cart_product"></div>
                                    
                                    <div class="d-flex justify-content-center w-100 p-2">
                                      <a href="index.php?page=cart" class="btn btn-sm btn-primary btn-block text-white"><i class="fa fa-edit"></i>  View Cart</a>
                                    </div>
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
    <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title">Confirmation</h5>
      </div>
      <div class="modal-body">
        <div id="delete_content"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id='confirm' onclick="">Continue</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="uni_modal" role='dialog'>
    <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title"></h5>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id='submit' onclick="$('#uni_modal form').submit()">Save</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="uni_modal_right" role='dialog'>
    <div class="modal-dialog modal-full-height  modal-md" role="document">
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
                                <a href="" class="footer-item__link">Giới thiệu về TickID Việt Nam</a>
                                
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
                        <h3 class="footer__heading">Vào cửa hành trên ứng dụng EBooks</h3>
                        <div class="footer__dowload">
                            <img src="./assets/img/QR_Code.png" alt="QR CODE" class="footer__dowload-qr">
                            <div class="footer__dowload-apps">
                                <a href="" class="footer__dowload-apps-link">
                                    <img src="./assets/img/Google_Play.png" alt="Google Play" class="footer__dowload-apps--img">
                                </a>
                                <a href="" class="footer__dowload-apps-link">
                                <img src="./assets/img/App_Store.png" alt="App Store" class="footer__dowload-apps--img">
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            
            <div class="footer-bottom">
                <div class="grid wide">
                    <p class="footer__text">© 2021 EBooks - Nền tảng bán sách online hàng đầu</p>
                </div>
            </div>
        </footer>
        
       <?php include('footer.php') ?>
    </body>
    <script type="text/javascript">
      $('#login').click(function(){
        uni_modal("Login",'login.php')
      })
      $('.datetimepicker').datetimepicker({
          format:'Y-m-d H:i',
      })
      $('#manage_my_account').click(function(){
          uni_modal("Manage Account",'signup.php');
      })
    </script>
    <?php $conn->close() ?>
  
</html>
