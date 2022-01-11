 <style>
   .modal-dialog.large {
    width: 80% !important;
    max-width: unset;
  }
  .modal-dialog.mid-large {
    width: 50% !important;
    max-width: unset;
  }
 </style>
 
 <script>
 	$('.datepicker').datepicker({
 		format:"yyyy-mm-dd"
 	})
 	 window.start_load = function(){
    $('body').prepend('<di id="preloader2"></di>')
  }
  window.end_load = function(){
    $('#preloader2').fadeOut('fast', function() {
        $(this).remove();
      })
  }

 	window.uni_modal = function($title = '' , $url='',$size=''){
    start_load()
    $.ajax({
        url:$url,
        error:err=>{
            console.log()
            alert("Có lỗi xảy ra !!!")
        },
        success:function(resp){
            if(resp){
                $('#uni_modal .modal-title').html($title)
                $('#uni_modal .modal-body').html(resp)
                if($size != ''){
                    $('#uni_modal .modal-dialog').addClass($size)
                }else{
                    $('#uni_modal .modal-dialog').removeAttr("class").addClass("modal-dialog modal-md")
                }
                $('#uni_modal').modal({
                  show:true,
                  backdrop:'static',
                  keyboard:false,
                  focus:true
                })
                end_load()
            }
        }
    })
}
  window.uni_modal_right = function($title = '' , $url=''){
    start_load()
    $.ajax({
        url:$url,
        error:err=>{
            console.log()
            alert("An error occured")
        },
        success:function(resp){
            if(resp){
                $('#uni_modal_right .modal-title').html($title)
                $('#uni_modal_right .modal-body').html(resp)
                
                $('#uni_modal_right').modal('show')
                end_load()
            }
        }
    })
}
window.viewer_modal = function($src = ''){
    start_load()
    var t = $src.split('.')
    t = t[1]
    if(t =='mp4'){
      var view = $("<video src='"+$src+"' controls autoplay></video>")
    }else{
      var view = $("<img src='"+$src+"' />")
    }
    $('#viewer_modal .modal-content video,#viewer_modal .modal-content img').remove()
    $('#viewer_modal .modal-content').append(view)
    $('#viewer_modal').modal({
                  show:true,
                  focus:true
                })
                end_load()  

}
window.alert_toast= function($msg = 'TEST',$bg = 'success'){
      $('#alert_toast').removeClass('bg-success')
      $('#alert_toast').removeClass('bg-danger')
      $('#alert_toast').removeClass('bg-info')
      $('#alert_toast').removeClass('bg-warning')

    if($bg == 'success')
      $('#alert_toast').addClass('bg-success')
    if($bg == 'danger')
      $('#alert_toast').addClass('bg-danger')
    if($bg == 'info')
      $('#alert_toast').addClass('bg-info')
    if($bg == 'warning')
      $('#alert_toast').addClass('bg-warning')
    $('#alert_toast .toast-body').html($msg)
    $('#alert_toast').toast({delay:3000}).toast('show');
  }
  window._conf = function($msg='',$func='',$params = []){
     $('#confirm_modal #confirm').attr('onclick',$func+"("+$params.join(',')+")")
     $('#confirm_modal .modal-body').html($msg)
     $('#confirm_modal').modal('show')
  }
  window.load_cart = function(){
    $.ajax({
      url:'admin/ajax.php?action=get_cart_count',
      success:function(resp){
        if(resp){
          resp =JSON.parse(resp)
          if(Object.keys(resp.list).length > 0 ){
            var ul = $('<ul class="list-group" ></ul>')
            Object.keys(resp.list).map(k=>{
              var li = $('<li class="list-group-item"><a href="view_book.php?id='+resp.list[k].book_id+'"class="item d-flex justify-content-between align-items-center"></a></li>')
               li.find('.item').append('<div class="cart-img"><img src="admin/assets/uploads/'+resp.list[k].image_path+'" alt=""></div>')
               li.find('.item').append('<div class="header__cart-item-info"><div class="header__cart-item-head"><div class="cart-title">'+resp.list[k].title+'</div></div><div class="header__cart-item-body"><div class="cart-body">'+resp.list[k].author+'</div></div></div>')
               li.find('.item').append('<span class="cart-item__price-qty"><span class="cart-item-price">'+resp.list[k].price+'đ</span><span class="cart-item-multiply">x</span><span class="badge badge-primary cart-qty">'+resp.list[k].qty+'</span></span>')
               ul.append(li)
            })
            $('#header__cart-list--amount').html('<div class="badge-amount badge-danger cart-count" id="cart-count-product">'+resp.count+'</div>')
            $('#cart_product').html(ul)
            $('#cart_product--view-btn').html('<a href="cart_product.php" class="btn btn-sm btn-primary btn-block text-white">Xem giỏ hàng</a>')
            var child = document.getElementById("cart-no-product")
            child.parentNode.removeChild(child)
          } 
        }
      }
    })
  }
  $('#login_now').click(function(){
    uni_modal("Đăng nhập",'login.php')
  })
  $(document).ready(function(){
    load_cart()
     $('#preloader').fadeOut('fast', function() {
        $(this).remove();
      })
  })

  
 </script>
        <!-- Bootstrap core JS-->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->

        <script src="js/scripts.js"></script>
        <script src="js/validator.js"></script>
       
