<?php

	include_once("../includes/validacaosessao.php");
	
	
	$usu = $_SESSION['usuario'];
	
	echo $usu;
	
	$conexao = mysqli_connect("localhost", "root", "root", "buildev_db");
	
	$pontos = $_GET["pontos"];
	
	$dados = mysqli_query($conexao, "UPDATE jogadores SET creditos={$pontos} WHERE id={$usu} AND creditos <={$pontos};") or die("Sua query retornou um erro");

	$atualizou = mysqli_affected_rows($conexao);

	mysqli_close($conexao);

	if($atualizou > 0 ){

		return $atualizou." registros alterados/deletados com sucesso." ;

	}else{

		return "Nenhum registro foi atualizado/deletado";

	}	 

?>