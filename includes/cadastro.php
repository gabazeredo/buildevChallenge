<?php


include_once("banco_de_dados.php");


if(isset($_POST["inputEmail"])){
	
	$arrplayer = select("SELECT id FROM jogadores WHERE email='{$_POST['inputEmail']}' && senha='{$_POST['inputSenha']}'");
	$arradm = select("SELECT id FROM administradores WHERE email='{$_POST['inputEmail']}' && senha='{$_POST['inputSenha']}'");
	
	if($arrplayer == 0 && $arradm == 0){
		
		echo "<script>alert('Usuário e/ou senha incorretos!');</script>";
		
	
	} else if($arradm != 0){
			
			$usuario = $arradm[0]['id'];
			$_SESSION['usuario']    = $usuario;
			$_SESSION['id_session_adm'] = session_id();
			header("location:includes/painel_adm.php");
			
	}
	else{
		
		$usuario = $arrplayer[0]['id'];
		$_SESSION['usuario']    = $usuario;
		$_SESSION['id_session'] = session_id();
		header("location:home.php");
		
	}
}



?>