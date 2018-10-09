<?php 

include_once("banco_de_dados.php");

?>

<html>

<head>

</head>

<body>

<?php

$arrplayer = select("SELECT nome_usuario FROM jogadores");

if(isset($_POST['nUsuario'])){
	

	sql_delete_update("UPDATE jogadores SET nome_usuario='{$_POST['nUsuario']}'");
}

if(isset($_POST['nSenha'])){

	sql_delete_update("UPDATE jogadores SET senha='{$_POST['nSenha']}'");
}

?>

<form action="perfil.php" method="post" name="formPerfil" >
	<div><h1>Alterar usuário:</div>
	<input type="text" placeholder="Novo usuário" name="nUsuario" />
	<div><h1>Alterar senha:<h1></div>
	<input type="password" placeholder="" name="nSenha" />
	
	<input type="submit" />
	
</form>
	
</body>


</html>