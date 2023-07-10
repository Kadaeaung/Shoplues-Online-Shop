<?php require 'dbconnect.php'; ?>
<?php
    $key=$_GET['key'];
    $array = array();
    //$con=mysqli_connect("localhost","root","","demos");

    $sql="select * from cfg_demos where title LIKE :key";
                            $stmt= $conn->prepare($sql);
                            $stmt->bindParam(':key',$key);
                            $stmt->execute();
                            $items=$stmt->fetch(PDO::FETCH_ASSOC);

    //$query=mysqli_query($con, "select * from cfg_demos where title LIKE '%{$key}%'");
    while($row=$items)
    {
      $array[] = $row['session_name()'];
    }
    echo json_encode($array);
    
?>