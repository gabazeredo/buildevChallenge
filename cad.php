
<html>

<head>

<meta name="description" content="jogo online "/>
<meta name="author" content="Gabriel's production"/>
<link rel="icon" href="imgs/iconGame.ico">

<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
<link href="css/signin.css" rel="stylesheet"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>

<script>

function myFunction(){
	alert('Cadastrado');
	
	window.location="index.php";
}


</script>




</head>



<body class=" text-center">

	<form class="form-signin" ">
      
	  <img class="mb-4" src="imgs/logo.jpg" alt="" width="72" height="72">
    
    	<h1 class="h3 mb-3 font-weight-normal">Cadastro</h1>    
		</br>
		
      <input type="text" id="inputNome" class="form-control" placeholder="Nome" name="inputNome" required autofocus>
      <input type="text" id="inputNomeUsu" class="form-control" placeholder="Nome de usu�rio" name="inputNomeUsu" required autofocus>
      <input type="date" id="dataNasc" class="form-control" name="inputDate" required autofocus>
      <input type="email" id="inputEmail" class="form-control" placeholder="E-mail " name="inputEmail" required autofocus>
      <input type="password" style="margin-bottom:0px;"id="inputPassword" class="form-control" placeholder="Senha" name="inputSenha" required>
      <input type="password" id="inputPasswordConf" class="form-control" placeholder="Confirmar senha" name="inputConfSenha" required>
      
	  
      <button onclick="myFunction()">Cadastrar</button>
      
     
	  <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    
	</form>

</body>

</html>
