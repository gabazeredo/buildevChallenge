<html>


	<head>
	</head>

<body>
<pre>
<?php


function select($pQuery){
	
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


function php_insert($pQuery){

	$conexao = mysqli_connect("localhost", "root", "root", "buildev_db");

	$dados = mysqli_query($conexao, $pQuery) or die("Sua query retornou um erro");

	mysqli_close($conexao);

	return $dados;

}


function sql_delete_update($pQuery){

	$conexao = mysqli_connect("localhost", "root", "root", "buildev_db");

	$dados = mysqli_query($conexao, $pQuery) or die("Sua query retornou um erro");

	$atualizou = mysqli_affected_rows($conexao);

	mysqli_close($conexao);

	if($atualizou > 0 ){

		return $atualizou." registros alterados/deletados com sucesso." ;

	}else{

		return "Nenhum registro foi atualizado/deletado";

	}
}



?>
</pre>

	</body>
</html>