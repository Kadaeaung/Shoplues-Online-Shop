<?php
  include('dbconnect.php');
   include('BackEnd_Header.php');


  $sql="SELECT * from users";
  $stmt=$conn->prepare($sql);
  $stmt->execute();
  $users=$stmt->fetchAll();

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
                    <h1> <i class="icofont-list"></i> User </h1>
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
                                          <th>Name</th>
                                          <th>Contact</th>
                                          <th>Action</th>
                                 
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <?php 
                                      $i=1;
                                       foreach ($users as $user)
                                        {
                                          $id=$user['id'];
                                          $name=$user['name'];
                                          $email=$user['email'];
                                          $phone=$user['phone'];
                                          $address=$user['address'];
                                         
                                       
                                        
                                      ?>
                                        
                                 
                                        <tr>

                                            <td> <?php echo $i++; ?> </td>
                                            <td>  <img src="<?= $photo?>" class="img-fluid w-25">
                                               <?= $name ?> <?php echo "<br/>"; ?>
                                               <?= $email ?> 



                                            </td> 
                                            <td><?= $phone ?> <?php echo "<br/>"; ?><?= $address ?></td> 
                                                                                         

                                            <td>
                                             
                                                <a href="itemdelete.php?id=<?=$user['id']?>" class="btn btn-outline-danger">
                                                    <i class="icofont-close"></i>
                                                </a>
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