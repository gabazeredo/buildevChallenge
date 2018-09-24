<?php


include_once("banco_de_dados.php");


if(isset($_POST["inputEmail"])){
	
	$arr = select("SELECT * FROM jogadores WHERE email='{$_POST['inputEmail']}' && senha='{$_POST['inputSenha']}'");
	
	if($arr == 0){
		
		echo "<script>alert('Usuário e/ou senha incorretos!');</script>";
	}
	else{
		
		$usuario = $arr[0];
		$_SESSION['usuario']    = $usuario;
		$_SESSION['id_session'] = session_id();
		header("location:home.php");
		
	}
}




?>