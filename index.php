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
        margin-top: 2rem !important;
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
                          <li class="nav-item"><a class="nav-link js-scroll-trigger" href="./">Home</a></li>
                          <?php if(isset($_SESSION['login_id'])): ?>


                          
                            
                          <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.php?page=about">About</a></li>
                          <?php if(isset($_SESSION['login_id'])): ?>
                        <div class=" dropdown mr-4 header__user-name">
                              <a href="#" class="text-white dropdown-toggle"  id="account_settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $_SESSION['login_name'] ?> </a>
                                <div class="dropdown-menu" aria-labelledby="account_settings" style="left: -2.5em;">
                                  <a class="dropdown-item" href="javascript:void(0)" id="manage_my_account"><i class="fa fa-cog"></i> Manage Account</a>
                                  <a class="dropdown-item" href="admin/ajax.php?action=logout2"><i class="fa fa-power-off"></i> Logout</a>
                                </div>
                          </div>
                        <?php else: ?>
                          <li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:void(0)" id="login_now">Login</a></li>
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
                        <!-- <div class="header__cart-wrap">
                            <i class="header__cart-icon fas fa-shopping-cart"></i>
                            <span class="header__cart-notice">3</span>

                           
                            <div class="header__cart-list">
                                <img src="./assets/img/no_cart.png" alt="" class="header__cart-no-cart-img">
                                <span class="header__cart-list-no-cart-msg">Chưa có sản phẩm</span>
                                
                                <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                                <ul class="header__cart-list-item">
                                   
                                    <li class="header__cart-item">
                                        <img src="https://ohuiwhoovietnam.com/wp-content/uploads/2019/10/set-duong-chong-lao-hoa-ohui-prime-advancer-8sp-06.jpg" alt="" class="header__cart-img">
                                        <div class="header__cart-item-info">
                                            <div class="header__cart-item-head">
                                                <h5 class="header__cart-item-name">Set dưỡng chống lão hóa Ohui</h5>
                                                <div class="header__cart-item-price-wrap">
                                                    <span class="header__cart-item-price">2.070.000đ</span>
                                                    <span class="header__cart-item-multiply">x</span>
                                                    <span class="header__cart-item-quantity">1</span>
                                                </div>
                                            </div>

                                            <div class="header__cart-item-body">
                                                <span class="header__cart-item-description">Phân loại hàng: Bạc</span>
                                                <span class="header__cart-item-remove">Xóa</span>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="header__cart-item">
                                        <img src="https://myphamohui.com/wp-content/uploads/2019/08/set-ohui-moisture-6sp-e1622189365589.jpg" alt="" class="header__cart-img">
                                        <div class="header__cart-item-info">
                                            <div class="header__cart-item-head">
                                                <h5 class="header__cart-item-name">Set dưỡng ẩm da Ohui Miracle Moisture</h5>
                                                <div class="header__cart-item-price-wrap">
                                                    <span class="header__cart-item-price">2.400.000đ</span>
                                                    <span class="header__cart-item-multiply">x</span>
                                                    <span class="header__cart-item-quantity">1</span>
                                                </div>
                                            </div>

                                            <div class="header__cart-item-body">
                                                <span class="header__cart-item-description">Phân loại hàng: Bạc</span>
                                                <span class="header__cart-item-remove">Xóa</span>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="header__cart-item">
                                        <img src="https://product.hstatic.net/1000062910/product/310b7c9ec69f01c29b969b6be3cb8f49_25b6719b45ed4c5f9f13d58e111a1439.jpeg" alt="" class="header__cart-img">
                                        <div class="header__cart-item-info">
                                            <div class="header__cart-item-head">
                                                <h5 class="header__cart-item-name">Kem dưỡng trắng da Ohui Extreme White Cream</h5>
                                                <div class="header__cart-item-price-wrap">
                                                    <span class="header__cart-item-price">1.699.000đ</span>
                                                    <span class="header__cart-item-multiply">x</span>
                                                    <span class="header__cart-item-quantity">1</span>
                                                </div>
                                            </div>

                                            <div class="header__cart-item-body">
                                                <span class="header__cart-item-description">Phân loại hàng: Bạc</span>
                                                <span class="header__cart-item-remove">Xóa</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>

                                <button class="header__cart-view btn btn--primary">Xem giỏ hàng</button>
                            </div>
                        </div> -->
                        <div class="header__cart-wrap">
                          <li class="nav-item dropdown cart__list--items">
                              <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="true">
                                <div class="badge-amount badge-danger cart-count">0</div>
                                <i class="fa fa-shopping-cart"></i>
                                <!-- <span>Cart</span> -->
                              </a>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="width:25vw">
                                <div class="cart-list w-100" id="cart_product">
                                
                                  
                                </div>
                                
                                <div class="d-flex bg-light justify-content-center w-100 p-2">
                                    <a href="index.php?page=cart" class="btn btn-sm btn-primary btn-block col-sm-4 text-white"><i class="fa fa-edit"></i>  View Cart</a>
                                </div>
                              </div>
                            </li>
                          <?php endif; ?>
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
        <footer class=" py-5 bg-dark">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="mt-0 text-white">Contact us</h2>
                        <hr class="divider my-4" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                        <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
                        <div class="text-white"><?php echo $_SESSION['system']['contact'] ?></div>
                    </div>
                    <div class="col-lg-4 mr-auto text-center">
                        <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
                        <!-- Make sure to change the email address in BOTH the anchor text and the link target below!-->
                        <a class="d-block" href="mailto:<?php echo $_SESSION['system']['email'] ?>"><?php echo $_SESSION['system']['email'] ?></a>
                    </div>
                </div>
            </div>
            <br>
            <div class="container"><div class="small text-center text-muted">Copyright © 2020 - <?php echo $_SESSION['system']['name'] ?> | <a href="https://www.sourcecodester.com/" target="_blank">Sourcecodester</a></div></div>
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
