<?php 
		
		require 'dbconnect.php';

		$id = $_GET['id'];
		$id= $_GET['tid'];


		$status= 1;

		$sql = "UPDATE orders SET  status=:status where id=:id";



		$stmt = $conn->prepare($sql);
		$stmt->bindParam(':id',$id);
		$stmt->bindParam(':status',$status);
		$stmt->execute();
		if (isset($_GET['id'])) {
			header('location:orderlist.php');

		}
	  else{
	  	header('location:dashboard.php');
	  }

		
 ?>