<?
require_once('include/header.inc.php');
require_once('formularios.php');

if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';

$imprimir = null;


if ($_POST['enviar'])
{
	$fv = new FormValidator($_POST);
	$fv->doValidation();
	
	if($fv->isError()) {

		//
		// if error show the error box
		//

		$imprimir .= ($fv->getErrorBox());
	}
	else {
		  if (isset($_POST['activo']))
		      $activo = 1;
		  else 
		      $activo = 0;
		  
		  
		$sql = "insert into usuario_control(id_usuario, nombre_usuario, cedula, nombre,tipo,password,activo)
		        values ('".$_POST['t_id_usuario_1']."', '".$_POST['t_nombre_usuario_1']."', '".$_POST['t_id_usuario_1']."',  '".$_POST['t_nombre_1']."', '".$_POST['t_tipo_1']."', '".md5($_POST['t_password_1'])."', '".$activo."')";
		
		
		if ($db->Execute($sql) === false){
			$imprimir .= "Error insertando :". $db->ErrorMsg()."<br>";
		}
		else {
			$imprimir .= "<div id='exito' class='ingexito'>Se ingreso con exito <br></div>";
			unset($_POST);
		}
		
	}
	
}

$imprimir .= formlariousuario($_POST['t_id_usuario_1'], $_POST['t_nombre_1'], $_POST['t_nombre_usuario_1'], $activo);

echo $imprimir;

require_once('include/footer.inc.php');
?>