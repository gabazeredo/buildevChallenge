<?php

function buscaPerguntas($pQuery){
	
	$conexao = mysqli_connect("localhost", "root", "root", "buildev_db");

	$dados = mysqli_query($conexao, $pQuery) or die("Sua query retornou um erro");
	
	$arraySelect = array();
	if ($dados->num_rows > 0) {
	 
		while($row = $dados->fetch_assoc()) {
			$arraySelect[] = $row;
		}
	}
	else {
		return 0;
	}
	
	mysqli_close($conexao);
	
	return $arraySelect;
	
}



?>