<?php
	$secret = $_POST["secretWord"];
	if ("44fdcv8jf3" != $secret) exit; // note the same secret as the app - could be let out if this check is not required. secretWord is not entered by the user and is used to prevent unauthorized access to the database
	
	$name = $_POST['name'];
	$theme = $_POST['theme'];
	$privateMode = $_POST['privateMode'];
	$eventDate = $_POST['eventDate'];
	$listOfGuests = $_POST['listOfGuests'];
    $place = $_POST['place'];
	
// POST items should be checked for bad information before being added to the database.

// Create connection
	$mysqli=mysqli_connect("sql9.freemysqlhosting.net","sql9249206","lVfvvmXfXq","sql9249206"); // localhost, user name, user password, database name
 
// Check connection
	if (mysqli_connect_errno())
	{
	  echo "
Failed to connect to MySQL: " . mysqli_connect_error();
	}
	
	$query = "insert into `SavedParties` (name, theme, priva, eventdate, list, place) value ('".$name."','".$theme."','".$privateMode."','".$eventDate."','".$listOfGuests."','".$place."')";
	$result = mysqli_query($mysqli,$query);

	echo $result; // sends 1 if insert worked
?>