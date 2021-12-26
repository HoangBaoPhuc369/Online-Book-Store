<?php 
include 'admin/db_connect.php'; 
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
                        <li class='list-group-item' data-id='all' data-href="index.php?page=home&category_id=all">All</li>
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
                            echo "<center><h4><i>No Available Product.</i></h4></center>";
                        } 
                        while($row=$books->fetch_assoc()):
                        ?>
                        <div class="col l-2-4 c-6">
                            <div class="card">
                            <div class="float-right align-top bid-tag">
                                    <span class="badge badge-pill badge-primary text-white"><i class="fa fa-tag"></i> <?php echo number_format($row['price']) ?></span>
                                </div>
                                <div class="card-img-top d-flex justify-content-center" style="max-height: 30vh;overflow: hidden">
                                <img class="img-fluid" src="admin/assets/uploads/<?php echo $row['image_path'] ?>" alt="Card image cap">
                                
                                </div>
                                <div class="float-right align-top d-flex">
                                </div>
                                <div class="card-body prod-item">
                                    <p>Title: <?php echo $row['title'] ?></p>
                                    <p>Author: <?php echo $row['author'] ?></p>
                                    <p>
                                    <small>
                                    <?php 
                                    $cats = '';
                                    $cat = explode(',', $row['category_ids']);
                                    foreach ($cat as $key => $value) {
                                    if(!empty($cats)){
                                        $cats .=", ";
                                    }
                                    if(isset($cat_arr[$value])){
                                        $cats .= $cat_arr[$value];
                                    }
                                    }
                                    echo $cats;
                                    ?>
                                    
                                    </small>
                                    </p>
                                    <p class="truncate"><?php echo $row['description'] ?></p>
                                <button class="btn btn-primary btn-sm view_prod" type="button" data-id="<?php echo $row['id'] ?>"> View</button>
                                </div>
                            </div>
                        </div>
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
        uni_modal_right('View Book','view_prod.php?id='+$(this).attr('data-id'))
     })
</script>