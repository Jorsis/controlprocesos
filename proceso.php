<?
require_once('include/header.inc.php');
require_once('formularios.php');


if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';

if ($_POST['enviar'])
{
	$fv = new FormValidator($_POST);
	$fv->doValidation();
	
	if($fv->isError()) {

		//
		// if error show the error box
		//

		echo($fv->getErrorBox());
	}
else {
	if(!$_POST['obligatorio'])
	   $obligatorio = 0;
	else 
	   $obligatorio = $_POST['obligatorio'];
		$sql = "insert into proceso (id_proceso, nombre, descripcion, obligatorio,orden_proceso)
		        values ('".strtoupper($_POST['t_id_proceso_1'])."', '".$_POST['t_nombre_1']."', '".$_POST['t_descripcion_1']."', '".$obligatorio."', (select max(orden_proceso) + 1 from proceso))";
		
		if ($db->Execute($sql) === false){
			$imprimir .= "Error insertando :". $db->ErrorMsg()."<br>";
		}
		else {
			$imprimir .= "<div id='exito' class='ingexito'>Se ingreso con exito <br></div>";
			unset($_POST);
		}
		
	}	
	
}
$imprimir .= formularioproceso($_POST['t_id_proceso_1'], $_POST['t_nombre_1'],$_POST['t_descripcion_1'],$_POST['obligatorio']);

echo $imprimir;


require_once('include/footer.inc.php');
?>