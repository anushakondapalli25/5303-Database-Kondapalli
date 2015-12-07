<?php

error_reporting(1);

$host 	= 'localhost';
$user 	= 'akondapalli';
$pass 	= 'akondapalli2015';
$db 	= 'akondapalli';

$load = new LoadReservations($host,$user,$pass,$db);

$load->checkUser();

class LoadReservations{

	var $db;	
	
	function __construct($host,$user,$pass,$db){
		//connect to database on local server
		$this->db = new mysqli($host,$user,$pass,$db);

		if ($this->db->connect_errno) {
			echo "Failed to connect to MySQL: (" . $db->connect_errno . ") " . $db->connect_error;
		}
	}
	
	function checkUser(){
		$email = $_POST['email'];
		$password = $_POST['password'];
		//echo $email;
		//echo $password;
		$this->getResult($email,$password);
	}
	
	function getResult($email,$password){
		$query = "SELECT * FROM  `user` WHERE email =  '$email' and password = '$password'";		
        $result = $this->db->query($query);   
		if(empty($result->fetch_assoc())){
			header('Location: index.html');
			
		}
		else{
			//echo "success";
			//$json = json_encode(array("login"=>true));
			header('Location: users.php');
			
		}		
	}
}