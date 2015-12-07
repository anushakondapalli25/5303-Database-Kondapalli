<?php
	error_reporting(1);
	$db = new mysqli("localhost", "akondapalli", "akondapalli2015", "akondapalli");

	if ($db->connect_errno) {
		echo "Failed to connect to MySQL: (" . $db->connect_errno . ") " . $db->connect_error;
	}
?>
<!DOCTYPE HTML>
<!--
	Miniport by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Online Resume Portal</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" />
	</head>
	<body>

<!-- Home -->

<!-- Work -->
<div class="wrapper style2" id="usersDiv">
	<article id="work">
		<header>
			<h2>Online Resume Portal</h2>
			
		</header>
	</article>
</div>
<div class="wrapper">

<table id="usersTable" class="display" cellspacing="0" width="80%">
        <thead>
            <tr>
                
                <th>first</th>
                <th>last</th>
				<th>street</th>
				<th>city</th>
				<th>state</th>
				<th>zip</th>
				<th>email</th>
				<th>password</th>
				<th>phone</th>
				<th>picture</th>
				<th>user_id</th>
				<th>social_security_no</th>
				<th>credit_card_no</th>
				<th>expiration_month</th>
				<th>expiration_year</th>
				<th>cvc</th>
				<th>document</th>
				<th>date_posted</th>
				<th>job</th>
				<th>job_description</th>
                
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>first</th>
                <th>last</th>
				<th>street</th>
				<th>city</th>
				<th>state</th>
				<th>zip</th>
				<th>email</th>
                <th>password</th>
				<th>phone</th>
				<th>picture</th>
				<th>user_id</th>
				<th>social_security_no</th>
				<th>credit_card_no</th>
				<th>expiration_month</th>
				<th>expiration_year</th>
				<th>cvc</th>
				<th>document</th>
				<th>date_posted</th>
				<th>job</th>
				<th>job_description</th>
                
            </tr>
        </tfoot>
        <tbody>


<?php
//Php will poluate each table row
$query = "SELECT * FROM user";
$result = $db->query($query);
if($result) {
	while ($row = $result->fetch_assoc()) {
		echo"<tr>";
		echo"<td>{$row['first']}</td>\n";
		echo"<td>{$row['last']}</td>\n";
		echo"<td>{$row['street']}</td>\n";
		echo"<td>{$row['city']}</td>\n";
		echo"<td>{$row['state']}</td>\n";
		echo"<td>{$row['zip']}</td>\n";
		echo"<td>{$row['email']}</td>\n";
		echo"<td>";
		echo"<a href=\"{$row['picture']}\"><i class=\"fa fa-picture-o\"></i></a> ";
		echo"</td>\n";
		echo"<td>{$row['phone']}</td>\n";
		echo"<td>{$row['picture']}</td>\n";
		echo"<td>{$row['user_id']}</td>\n";
		echo"<td>{$row['social_security_no']}</td>\n";
		echo"<td>{$row['credit_card_no']}</td>\n";
		echo"<td>{$row['expiration_month']}</td>\n";
		echo"<td>{$row['expiration_year']}</td>\n";
		echo"<td>{$row['cvc']}</td>\n";
		echo"<td>{$row['document']}</td>\n";
		echo"<td>{$row['date_posted']}</td>\n";
		echo"<td>{$row['job']}</td>\n";
		echo"<td>{$row['job_description']}</td>\n";
		echo"</tr>";
	 }
}
?>
 
        </tbody>
    </table>
	

</div>
			</div>

		

		
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script>
			$(function() {
			
				
				

				$('#usersTable').DataTable();
				$('#coursesTable').DataTable();

				
			});
			</script>

	</body>
</html>
