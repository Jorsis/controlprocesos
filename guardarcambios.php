<?php
require_once('include/header.inc.php');
function validaValor($cadena)
{
	// Funcion utilizada para validar el dato a ingresar recibido por GET	
	if(eregi('^[a-zA-Z0-9._αινσϊρ‘!Ώ? -]{1,40}$', $cadena)) return TRUE;
	else return FALSE;
}

$dato=trim($_GET['dato']); 
$codigo=trim($_GET['codigo']);
$name=trim($_GET['name']); 
$user=trim($_GET['user']);

if(validaValor($dato) && validaValor($codigo))
{

	if ($name == 'password')
	    $dato = md5($dato);
	
	if($user == 'cliente')
	{
	
		if($name == 'id_usuario')
		   $sql = "UPDATE cliente SET id_usuario='$dato', id_cliente='$dato' WHERE id_usuario='$codigo'";
		else
		   $sql = "UPDATE cliente SET $name='$dato' WHERE id_usuario='$codigo'";
		   
		   
	        $consulta=$db->Execute($sql);
	
	}
	elseif($user == 'usuario')
	{
	
		if($name == 'id_usuario')
		   $sql = "UPDATE usuario_control SET id_usuario='$dato', cedula='$dato' WHERE id_usuario='$codigo'";
		else
		   $sql = "UPDATE usuario_control SET $name='$dato' WHERE id_usuario='$codigo'";
		   
		   
	        $consulta=$db->Execute($sql);
	
	}
	
}
// No retorno ninguna respuesta
?>