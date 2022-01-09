<?php 
include 'admin/db_connect.php'; 

if(isset($_POST['search'])){
    $search = $_POST['key'];
}else{
    $search = '';
}
$sql_pro = "SELECT * FROM books WHERE title LIKE '%".$search."%'";
$query_pro = mysqli_query($conn,$sql_pro);

?>

<style>
    #cat-list li{
        cursor: pointer;
        font-size: 14px;
    }
       #cat-list li:hover {
        color: white;
        background: #007bff8f;
    }
    .prod-item p{
        margin: unset;
    }
    .bid-tag {
    position: absolute;
    right: .5em;
}
</style>
<?php 
$cid = isset($_GET['category_id']) ? $_GET['category_id'] : 0;
?>
<div class="contain-fluid grid wide">
    <div class="row sm-gutter app__contain">
        <div class="col l-2 m-0 c-0">
            <div class="card app__category">
                <div class="card-header">Danh mục</div>
                <div class="card-body category-list">
                    <ul class='list-group' id='cat-list'>
                        <li class='list-group-item' data-id='all' data-href="index.php?page=home&category_id=all">Tất Cả</li>
                        <?php
                            $cat = $conn->query("SELECT * FROM categories order by name asc");
                            while($row=$cat->fetch_assoc()):
                                $cat_arr[$row['id']] = $row['name'];
                            ?>
                        <li class='list-group-item' data-id='<?php echo $row['id'] ?>' data-href="index.php?page=home&category_id=<?php echo $row['id'] ?>"><?php echo ucwords($row['name']) ?></li>

                        <?php endwhile; ?>
                    </ul>

                </div>
            </div>
        </div>
        <div class="col l-10 m-12 c-12">
            <div class="card product__contain">
                <div class="row sm-gutter">
                    <?php
                        $where = "";
                        if($cid > 0){
                            $where  = " where CONCAT('[',REPLACE(category_ids,',','],['),']') LIKE '%[".$cid."]%'  ";
                        }
                        $books = $conn->query("SELECT * from books $where order by title asc");
                        if($books->num_rows <= 0){
                            echo "<center><h4><i>Sách không có sẵn.</i></h4></center>";
                        } 
                        while($row=$books->fetch_assoc()):
                        ?>

                            <?php
                                if($search){
                            ?>
                                <?php
                                while($row = mysqli_fetch_array($query_pro)){
                                ?>
                                <div class="col l-2-4 c-6 col home-product__contain">
                                    <a href="view_book.php?id=<?php echo $row['id'] ?>"  class="card view_prod card-product" data-id="<?php echo $row['id'] ?>">
                                        <div class="product__list">
                                            <div class="home-product-item__img" style= "background-image: url(admin/assets/uploads/<?php echo $row['image_path'] ?>);"></div>
                                                <div class="prod-item">
                                                    <h4 class="home-product-item__name"><?php echo $row['title'] ?></h4>
                                                    <div class="home-product-item__price-current">
                                                        <span class="copper__character">₫</span>
                                                        <span class="price__product"><?php echo number_format($row['price']) ?></span>
                                                    </div>
                                                </div>
                                        </div>
                                    </a>
                                    <a href="view_book.php?id=<?php echo $row['id'] ?>" class="view_prod view__product--link" data-id="<?php echo $row['id'] ?>">
                                        <div class="home__product-information" >
                                            <p>Xem thông tin sản phẩm</p>
                                        </div>
                                    </a>
                                </div>
                                <?php
                                }
                                ?> 
                            <?php
                            }else {
                            ?>
                                <div class="col l-2-4 c-6 col home-product__contain">
                                    <a href="view_book.php?id=<?php echo $row['id'] ?>" class="card view_prod card-product" data-id="<?php echo $row['id'] ?>">
                                        <div class="product__list">
                                            <div class="home-product-item__img" style= "background-image: url(admin/assets/uploads/<?php echo $row['image_path'] ?>);"></div>
                                                <div class="prod-item">
                                                    <h4 class="home-product-item__name"><?php echo $row['title'] ?></h4>
                                                    <div class="home-product-item__price-current">
                                                        <span class="copper__character">₫</span>
                                                        <span class="price__product"><?php echo number_format($row['price']) ?></span>
                                                    </div>
                                                </div>
                                        </div>
                                    </a>
                                    <a href="view_book.php?id=<?php echo $row['id'] ?>" class="view_prod view__product--link" data-id="<?php echo $row['id'] ?>">
                                        <div class="home__product-information" >
                                            <p>Xem thông tin sản phẩm</p>
                                        </div>
                                    </a>
                                </div>
                            <?php
                            }
                            ?> 
                    <?php endwhile; ?>
                </div>
            </div>
        </div>
    </div>
</div>
       
<script>
    $('#cat-list li').click(function(){
        location.href = $(this).attr('data-href')
    })
     $('#cat-list li').each(function(){
        var id = '<?php echo $cid > 0 ? $cid : 'all' ?>';
        if(id == $(this).attr('data-id')){
            $(this).addClass('active')
        }
    })
     $('.view_prod').click(function(){
        uni_modal_right('Thông tin sách','view_prod.php?id='+$(this).attr('data-id'))
     })
</script>