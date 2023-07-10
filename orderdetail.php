<?php 
require 'dbconnect.php';
require 'BackEnd_Header.php' ;
session_start();

		//qty ->orderdetail | note -> orders | || subtotal -> items ||itemName
$id=$_GET['id'];
$uid=$_GET['uid'];
		$sql="SELECT orders.id as orid,orderdetails.qty as oq,orders.note as ont,items.codeno  as ic,items.price  as ip ,items.name as itemn ,items.discount as itemd from orderdetails join orders on orderdetails.voucherno= orders.voucherno join items on  orderdetails.item_id= items.id  where orders.id=:id ";
  		$stmt=$conn->prepare($sql);
  		$stmt->bindParam(':id',$id);
  		$stmt->execute();
  		$orders=$stmt->fetchAll();




?>


<main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-file-text-o"></i> Invoice</h1>
          <p>A Printable Invoice Format</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Invoice</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <section class="invoice">
              <div class="row mb-4">
                <div class="col-6">
                  <h2 class="page-header"><i class="fa fa-globe"></i> Vali Inc</h2>
                </div>
                <div class="col-6">
<?php 
		date_default_timezone_set('Asia/Rangoon');
		$date=strtotime(date("h:i:s"));

		//orderdate
		$today=date('Y-m-d');


		$sql="SELECT name,address,email From users  where id=:uid";
  		$stmt=$conn->prepare($sql);
  		$stmt->bindParam(':uid',$uid);
  		$stmt->execute();
  		$users=$stmt->fetch(PDO::FETCH_ASSOC);
          //var_dump($users);die();
  		$uname=$users['name'];
  		$uaddress=$users['address'];
  		$uemail=$users['email'];


  		$sql="SELECT * From orders  where id=:id";
  		$stmt=$conn->prepare($sql);
  		$stmt->bindParam(':id',$id);
  		$stmt->execute();
  		$orders1=$stmt->fetch(PDO::FETCH_ASSOC);
          //var_dump($users);die();
  		$oid=$orders1['id'];



 ?>
                  <h5 class="text-right">Date:<?= $today ?></h5>
                </div>
              </div>
              <div class="row invoice-info">
                <div class="col-4">From
                  <address><strong><?= $uname ?> </strong><br><?= $uaddress ?><br>Email: <?= $uemail ?></address>
                </div>
                <div class="col-4">To
                  <address><strong><?= $_SESSION['loginuser']['name']?></strong><br><?= $_SESSION['loginuser']['address']?> <br><?= $_SESSION['loginuser']['phone']?><br><?= $_SESSION['loginuser']['email']?></address>
                </div>


                <div class="col-4"><b>Invoice #007612</b><br><br><b>Order ID:</b> <?= $oid ?><br><b>Payment Due:</b> 2/22/2014<br><b>Account:</b> 968-34567</div>
              </div>
              <div class="row">
                <div class="col-12 table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>Qty</th>
                        <th>Product</th>
                        <th>Serial #</th>
                        <th>Description</th>
                        <th>Subtotal</th>
                      </tr>
                    </thead>
                    <tbody>
                    	<?php 

                           
                                        foreach ($orders as $order):
                                        
                                          $qty=$order['oq'];
                                         // $oid=$order['id'];
                                          $note=$order['ont'];
                                          $codeno=$order['ic'];
                                          $name=$order['itemn'];
                                          $price=$order['ip'];
                                          $discount=$order['itemd'];
                                          $subtotal=0;
                                          if (isset($discount))
                                           {

                                           	$subtotal=$discount;
                                          	
                                          }
                                          else
                                          {
                                          	$subtotal=$price;
                                          }




                                      

                    	 ?>
                      <tr>
                        <td> <?= $qty ?></td>
                        <td> <?= $name ?></td>
                        <td><?= $codeno ?></td>
                        <td><?=   $note?></td>
                        <td><?= $subtotal ?></td>
                       
                      </tr>

                  <?php endforeach; ?>
                                   </tbody>
                  </table>
                </div>
              </div>
              <div class="row d-print-none mt-2">
                <div class="col-12 text-right"><a class="btn btn-primary" href="javascript:window.print();" target="_blank"><i class="fa fa-print"></i> Print</a></div>
              </div>
            </section>
          </div>
        </div>
      </div>
    </main>


<?php require 'BackEnd_Footer.php' ?>