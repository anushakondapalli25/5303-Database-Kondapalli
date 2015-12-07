<?php

error_reporting(1);

$host 	= 'localhost';
$user 	= 'akondapalli';
$pass 	= 'akondapalli2015';
$db 	= 'akondapalli';

$load = new LoadTestData($host,$user,$pass,$db);

$load->addUsers();
//$load->loadCourses();



class LoadTestData{

	var $db;
	//var $Roles;

	function __construct($host,$user,$pass,$db){
		//connect to database on local server
		$this->db = new mysqli($host,$user,$pass,$db);

		if ($this->db->connect_errno) {
			echo "Failed to connect to MySQL: (" . $db->connect_errno . ") " . $db->connect_error;
		}
		
	}
	
	
	
	function addUsers(){		

		
		
			//pull entire user from object to make code below easier to read
				$last   			        = $_POST['last'];
				$first       		        = $_POST['first'];
				$street			            = $_POST['street'];
				$city    			        = $_POST['city'];
				$state  			        = $_POST['state'];
				$zip			            = $_POST['zip'];
				$email          	        = $_POST['email'];
				$password			        = $_POST['password'];
				$phone   			        = $_POST['phone'];
				$picture			        = $_POST['picture'];
				$user_id                    = $_POST['user_id'];
				$social_security_no			= $_POST['social_security_no'];
				$credit_card_no 			= $_POST['credit_card_no'];
				$expiration_month		    = $_POST['expiration_month'];
				$expiration_year		    = $_POST['expiration_year'];
				$cvc             			= $_POST['cvc'];
				$document              		= $_POST['document'];
				$date_posted                = $_POST['date_posted'];
				$job                        = $_POST['job'];
				$job_description            = $_POST['job_description'];
				//echo $first;
				$result=$this->loadRoles($last,$first,$street,$city,$state,$zip,$email,$password,$phone,$picture,$user_id,$social_security_no,$credit_card_no,$expiration_month,$expiration_year,$cvc,$document,$date_posted,$job,$job_description);
				//echo $query."\n";
				//$result = $this->db->query($query);
				//header('Location: users.php');
				if($result > 0)
					header('Location: users.php');
				else
					header('Location: register.html'); 

		
	}
	


	private function loadRoles($last,$first,$street,$city,$state,$zip,$email,$password,$phone,$picture,$user_id,$social_security_no,$credit_card_no,$expiration_month,$expiration_year,$cvc,$document,$date_posted,$job,$job_description){
		
		$query = "INSERT INTO user VALUES ( '$last', '$first', '$street', '$city','$state','$zip','$email','$password','$phone','$picture','$user_id','$social_security_no','$credit_card_no','$expiration_month','$expiration_year','$cvc','$document','$date_posted','$job','$job_description')";
        $result = $this->db->query($query);
        return $result;
	}
}

