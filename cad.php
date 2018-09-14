<?php 

include_once("includes/banco_de_dados.php");

if(isset($_POST['inputNome'])){

	$return = select("SELECT * FROM jogadores WHERE email= '{$_POST['inputEmail']}'");

		if($return == 0){
		
			date_default_timezone_set('America/Sao_Paulo');
			$dataReg = date("Y-m-d h:i:");
			$cadastrou = php_insert("INSERT INTO jogadores VALUES (DEFAULT, '{$_POST['inputNome']}', '{$_POST['inputNomeUsu']}', '{$_POST['inputSenha']}', '{$_POST['inputDate']}', '{$_POST['inputEmail']}', '{$dataReg}', '0')");	
			echo $cadastrou;
			
			header("location:index.php");
			
		} else { 
		
			echo "<script>alert('E-mail já existente!');</script>";
			
		}
	
}

?>


<html>

<head>

 <meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />

<meta name="description" content="jogo online "/>
<meta name="author" content="Rodrigo's production"/>
<link rel="icon" href="imgs/iconGame.ico">

<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
<link href="css/signin.css" rel="stylesheet"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>

<script>

function verificaSenha(){
	var senha = document.getElementById("inputPassword").value;
	var confSenha = document.getElementById("inputPasswordConf").value;

	if(senha == confSenha){
		return true;
		
	}else{
		alert('Senhas não se correspondem');
		return false;
	}
	
}

function cancelar(){
	
	document.location.href="index.php";
	
}


</script>




</head>



<body class=" text-center">

	<form class="form-signin" method="post" action="cad.php" onSubmit="return verificaSenha()">
      
	  <img class="mb-4" src="imgs/logo.jpg" alt="" width="72" height="72">
    
    	<h1 class="h3 mb-3 font-weight-normal">Cadastro</h1>    
		</br>
		
      <input type="text" id="inputNome" class="form-control" placeholder="Nome" name="inputNome" required autofocus>
      <input type="text" id="inputNomeUsu" class="form-control" placeholder="Nome de usuário" name="inputNomeUsu" required autofocus>
      <input type="date" id="dataNasc" class="form-control" name="inputDate" required autofocus>
      <input type="email" id="inputEmail" class="form-control" placeholder="E-mail " name="inputEmail" required autofocus>
      <input type="password" style="margin-bottom:0px;"id="inputPassword" class="form-control" placeholder="Senha" name="inputSenha" required>
      <input type="password" id="inputPasswordConf" class="form-control" placeholder="Confirmar senha" name="inputConfSenha" required>
      
	  
      <button class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button>
      <button class="btn btn-lg btn-danger btn-block" type="button" action="" onclick="cancelar()">Cancelar</button>
     
	  <p class="mt-5 mb-3 text-muted">&copy; 2017-2018 Buidev</p>
    
	</form>

</body>

</html>
