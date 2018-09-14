<?php

include_once("banco_de_dados.php");

if(isset($_SESSION["usuario"])){
	
	$arr = select("SELECT * FROM jogadores WHERE email='{$_SESSION['usuario']['email']}' && senha='{$_SESSION['usuario']['senha']}'");

	if($arr == 0){
		header("location:cad.php");
	
	}else if($_SERVER['PHP_SELF'] == "/challenge/index.php"){
		header("location:home.php");
	}	
	
}else if($_SERVER['PHP_SELF'] != "/challenge/index.php"){
		header("location:index.php");
	}	





?>