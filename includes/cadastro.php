<?php


include_once("banco_de_dados.php");
session_start();

if(isset($_POST["inputEmail"])){
	
	$arr = "SELECT * FROM jogadores WHERE email='{$_POST['inputEmail']}' AND senha='{$_POST['inputSenha']}'";
	
	if($arr == 0){
	
		echo "<script>alert('Usuário ou senha incorretos!');</script>";
	}else{
		
		
		$_SESSION['arrUsuario'] = $arr[0];
	
	}
}




?>