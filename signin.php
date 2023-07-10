<?php 
		require 'dbconnect.php';
		session_start();

		$email = $_POST['email'];
		$password = $_POST['password'];


		$sql = "SELECT users.*, roles.name as rname  FROM users LEFT JOIN roles ON users.role_id = roles.id WHERE email=:email AND password=:password";
		$stmt= $conn->prepare($sql);
		$stmt->bindParam(':email',$email);
		$stmt->bindParam(':password',$password);
		$stmt->execute();

		if($stmt->rowCount() <= 0)
		{
			 if(!isset($_COOKIE['loginCount']))
                {
                        $loginCount = 1;
                }
                else
                {
                        $loginCount = $_COOKIE['loginCount'];
                        $loginCount++;
                }
       setcookie('loginCount',$loginCount,time()+10);

                if($loginCount >=3)
                {
                        #time_Out

                echo '<iframe src="https://giphy.com/embed/Ke8JKfxe83FpLrra71" style=" width:100%; height:100vh; object-fit:cover;"></iframe>';

                        setcookie('loginCount','',time()-10);

              echo "<script type=\"text/javascript\">

                        (function(){
                                setTimeout(function(){
                                        location.href='login.php';
                                        },10000);
                                })();
                  </script>";
                }
                else
                {
                        $_SESSION['reg_fail'] = 'Invalid Email and Password Try Again';
                        header('location:login.php');
                }

		}

        else
        { 

        	$user = $stmt->fetch(PDO::FETCH_ASSOC);
        	//var_dump($user);die();

        	$_SESSION['loginuser'] = $user;
            

        	$roleid= $user['role_id'];
        	if($roleid == 1)
        	{
        		header('location:categorylist.php');
        	}
        	else
        	{
        		{
        		header('location:index.php');
        	}
        	}
        }

       
		

 ?>