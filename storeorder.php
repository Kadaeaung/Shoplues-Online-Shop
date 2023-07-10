<?php 
		
		require 'dbconnect.php';
		session_start();

		$cart = $_POST['cart'];
		$note= $_POST['note'];

		//voucher

		date_default_timezone_set('Asia/Rangoon');
		$voucher=strtotime(date("h:i:s"));

		//orderdate
		$orderdate=date('Y-m-d');

		// userid
		$userid= $_SESSION['loginuser']['id'];

		//status
		$status = 0;
		$total=0;

		foreach ($cart as $key => $value) {

			$id= $value['id'];
			$qty= $value['qty'];
			$uniprice= $value['price'];
			$discount=$value['discount'];
			if($discount >0)
			{
				$price = $discount;
			}
			else
			{
				$price= $uniprice;
			}
			$subtotal= $qty *$price;
			$total = $subtotal++;

			$sql = "INSERT INTO orderdetails (voucherno,qty,item_id) values (:voucherno, :qty,:item_id)";
			$stmt=$conn->prepare($sql);
			$stmt->bindParam(':voucherno',$voucher);			
			$stmt->bindParam(':qty',$qty);
			$stmt->bindParam(':item_id',$id);
			$stmt->execute();
		}

		$sql = "INSERT INTO orders (orderdate,voucherno,total,note,status,user_id) values (:orderdate,:voucherno,:total,:notes,:status,:user_id)";
			$stmt=$conn->prepare($sql);
			$stmt->bindParam(':orderdate',$orderdate);
			$stmt->bindParam(':voucherno',$voucher);
			$stmt->bindParam(':total',$total);
			$stmt->bindParam(':notes',$note);
			$stmt->bindParam(':status',$status);
			$stmt->bindParam(':user_id',$userid);


			$stmt->execute();

		var_dump($cart);
		var_dump($note);

 ?>