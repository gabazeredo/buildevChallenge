<?php  

session_start();
include_once("includes/cadastro.php");

?>


<html>

<head>

<meta name="description" content="jogo online "/>
<meta name="author" content="Rodrigo's production"/>
<link rel="icon" href="imgs/iconeGame.ico">

<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
<link href="css/signin.css" rel="stylesheet"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>

<script>

function cadastrarConta(){

document.location.href="cad.php";
	
}

</script>

</head>



<body class=" text-center">

	<form class="form-signin" method="post" action="index.php">
      
	  <img class="mb-4" src="imgs/logo.png"></center>
    
    	<h1 class="h3 mb-3 font-weight-normal">Entre com sua conta!</h1>    
		</br>
		</br>
	  <label for="inputEmail" class="sr-only">E-mail</label>
      <input type="email" id="inputEmail" class="form-control" placeholder="E-mail " name="inputEmail" maxlength="90" required autofocus>
      <label for="inputPassword" class="sr-only">Senha</label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Senha" name="inputSenha" maxlength="32" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
	  <button class="btn btn-lg btn-danger btn-block" type="button" action="" onclick="cadastrarConta()">Cadastrar</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018 Buildev</p>
    
	</form>

</body>

</html>
