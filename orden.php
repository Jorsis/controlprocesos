<?
//error_reporting (2047);
require_once('include/header.inc.php');
require_once('formularios.php');

if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';


if ($_POST['enviar'])
{
	$fv = new FormValidator($_POST);
	$fv->doValidation();
//print_r($_REQUEST);
	
	if($fv->isError()) {

		//
		// if error show the error box
		//

		echo($fv->getErrorBox());			
	}
	else {
		$date = getdate();
            if (!$_REQUEST['t_unidades_6'])
                $unidadesc = 0;
            else 
                $unidadesc = $_REQUEST['t_unidades_6'];
                         

		$sql = "insert into orden (orden, referencia, unidades, especie, tipo, corte, peso, ancho, largo, espesor, calidad, novedad)
		        values ('".$_POST['t_lote_1']."', '".$_POST['t_referencia_0']."', '".$unidadesc."',
		                '{$_POST['t_especie_0']}','{$_POST['t_tipo_0']}','{$_POST['t_corte_0']}',
		                '{$_POST['t_peso_0']}','{$_POST['t_ancho_0']}','{$_POST['t_largo_0']}',
		                '{$_POST['t_espesor_0']}','{$_POST['t_calidad_0']}','{$_POST['t_novedad_0']}'
		        )";
	
            $_SESSION['id_orden'] = $_POST['t_lote_1'];
            $_SESSION['referencia'] = $_POST['t_referencia_0'];
            $_SESSION['cantidad'] = $_POST['t_unidades_6'];
            //$_SESSION['cliente'] = $_POST['s_cliente_1'];

		
		if ($db->Execute($sql) === false){
			$imprimir .= "Error insertando :". $db->ErrorMsg()."<br>";
		}
		else {
			for ($i=1; $i <= $unidadesc; $i++){
				$sql = "INSERT INTO unidades (orden) VALUES ('{$_POST['t_lote_1']}')";
				$db->Execute($sql);
			}
			
			
			
			
                 // echo '<meta http-equiv="refresh" content="0;url=barcode.php"';

                  
			?>
			    <script language="javascript">
			      window.open('barcode.php',"toolbar=yes, location=yes, directories=yes, status=yes, menubar=yes, width=800,height=600");
			    
			    </script>
			<?
			$imprimir .= "<div id='exito' class='ingexito'>Se ingreso con exito <br></div>";
			unset($_POST);
		}
		
	}
	
}


$imprimir .= formularioorden($_POST['t_orden_1'], $_POST['t_referencia_0'],$_POST['t_unidades_0'],$_POST['t_cliente_1']);

echo $imprimir;




require_once('include/footer.inc.php');
?>


