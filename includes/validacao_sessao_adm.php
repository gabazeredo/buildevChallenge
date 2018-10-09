<?php

session_start();

if(($_SESSION['id_session_adm']!=session_id()) || empty($_SESSION['usuario'])){
  unset($_SESSION);
  session_destroy();
  header("location:../index.php");
	
}

?>