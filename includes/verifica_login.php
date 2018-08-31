<?php
session_start();

if(isset($_SESSION["arrUsuario"])){
	
	$arr = "SELECT * FROM jogadores WHERE email='{$_SESSION["arrUsuario"]["email"]}' AND senha='{$_SESSION["arrUsuario"]["senha"]}'";

	if($arr == 0){
		header("location:login.php");
	
	}else if($_SERVER['PHP_SELF'] == "/challenge/index.php"){
		header("location:home.php");
	}	
	
}else if($_SERVER['PHP_SELF'] != "/challenge/index.php"){
		header("location:index.php");
	}	





?>