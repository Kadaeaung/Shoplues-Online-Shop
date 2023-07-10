<?php
  include('dbconnect.php');
   include('BackEnd_Header.php');


  $sql="SELECT * FROM orders";
  $stmt=$conn->prepare($sql);
  $stmt->execute();
  $orders=$stmt->fetchAll();

  //   $sql="SELECT * FROM items";
  // $stmt=$conn->prepare($sql);
  // $stmt->execute();
  // $items=$stmt->fetchAll(PDO::FETCH_ASSOC);

  //     $sql="SELECT * FROM brands";
  // $stmt=$conn->prepare($sql);
  // $stmt->execute();
  // $brands=$stmt->fetchAll(PDO::FETCH_ASSOC);
  // var_dump($brands);

?>

         <main class="app-content">
            <div class="app-title">
                <div>
                    <h1> <i class="icofont-list"></i> Order </h1>
                </div>
                <ul class="app-breadcrumb breadcrumb side">
                    <a href="itemnew.php" class="btn btn-outline-primary">
                        <i class="icofont-plus"></i>
                    </a>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered" id="sampleTable">
                                    <thead>
                                        <tr>
                                          <th>No.</th>
                                          <th>Date</th>
                                          <th>VoucherNo</th>
                                          <th>Total</th>
                                          <th>Status</th>
                                 
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <?php 
                                      $i=1;
                                       foreach ($orders as $order)
                                        {
                                          $id=$order['id'];
                                          $date=$order['orderdate'];
                                          $order_status=$order['status'];
                                          $total=$order['total'];
                                          $voucher=$order['voucherno'];
                                          $uid=$order['user_id'];

                                          if($order_status== 0)
                                          {
                                            $status = "Order";
                                          }
                                          elseif($order_status==2){
                                            $status="Order Cancel";
                                          }
                                       else
                                       {
                                        $status="Order Confirm";
                                       }
                                        
                                      ?>
                                        
                                 
                                        <tr>

                                            <td> <?php echo $i++; ?> </td>
                                            <td> <?= $date ?> </td> 
                                            <td><?=$voucher ?></td> 
                                             <td><?= $total ?> </td> 
                                             <td><?= $status ?> </td>
                                              

                                            <td>
                                              <a href="orderdetail.php?id=<?=$id?>&uid=<?=$uid?>" class="btn btn-outline-warning">
                                                    <i class="icofont-exclamation-circle"></i>
                                                </a>


                                                <?php if($order_status == 0): ?>
                                                <a href="orderconfirm.php?id=<?=$id?>" class="btn btn-outline-success">
                                                    <i class="icofont-check"></i>
                                                </a>



                                                  
                                                <a href="orderdelete.php?id=<?=$id?>" class="btn btn-outline-danger">
                                                    <i class="icofont-ui-close"></i>
                                                </a>
                                              <?php endif; ?>
                                            </td>

                                        </tr>
                                         <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
<?php

  include('BackEnd_Footer.php');
?>