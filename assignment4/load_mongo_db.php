<?php

// connect
$m = new MongoClient();

// select a database
$db = $m->akondapalli;

// select a collection (analogous to a relational database's table)
$collection = $db->random_people;

$json = file_get_contents("http://api.randomuser.me/?results=1000");//receiving contents from the mentioned link

     //loop to insert data into table   
   $json_array = json_decode($json);	    
	for($i=0;$i<sizeof($json_array->results);$i++)
    {
        $collection->insert($json_array->results[$i]);
    }   
?>