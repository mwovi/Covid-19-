<?php
    // Create Database Connection
   $server = "localhost" ;
   $username = "root" ;
   $password = "peter" ;
   $database = "scheduler" ;


   $conn = @mysqli_connect($server,$username,$password,$database);
   
    // Check Database Connection
    if (!$conn) {
      die ("<script>alert('Connection Failed.')</script>");
    }
  // echo "Connected successfully";

  //die("Connection failed: " . mysqli_connect_error());
?>

