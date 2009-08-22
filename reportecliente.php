<?
require_once('include/header.inc.php');
if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';
?>
<script language="javascript" src="script/cal2.js"></script>
<script language="javascript" src="script/cal_conf2.js"></script>

<?
$imprimir = null;
$imprimir .= "<table align=center border=0>
<caption><H2>Reporte</H2></caption>";

$formulario = new cForm();
$formulario->_name = 'freporte';

    $formulario->add_text('fecha_inicio', 0, 0);
	$formulario->inputcal('t_fecha_inicio_4', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar1')", 'imagenes/cal.gif');
	$formulario->add_text('fecha_fin', 0, 0);
	$formulario->inputcal('t_fecha_fin_4', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar2')", 'imagenes/cal.gif');

$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);

$imprimir .= "</table>";

echo $imprimir;

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
		  
		  
		$sql = "SELECT orden.orden, cliente.nombre_cliente, orden.referencia, proceso.nombre, (extract(day from seguimiento.inicio) || '/' || 
		        extract(month from seguimiento.inicio) || '/' || extract(year from seguimiento.inicio)) as fecha_inicio, 
		        (extract (hour from seguimiento.inicio) || ':' || extract (minute from seguimiento.inicio) || ':' || 
		        extract (second from seguimiento.inicio)) as hora_inicio,
		        (extract(day from seguimiento.finalizacion) || '/' || extract(month from seguimiento.finalizacion) || '/' || 
		        extract(year from seguimiento.finalizacion)) as fecha_finalizacion, (extract (hour from seguimiento.finalizacion) || ':' ||
		        extract (minute from seguimiento.finalizacion) || ':' || 
		        extract (second from seguimiento.finalizacion)) as hora_finalizacion FROM cliente, orden, seguimiento, proceso 
		        WHERE cliente.id_cliente = orden.cliente and orden.orden = seguimiento.orden and proceso.id_proceso = seguimiento.proceso
		         and ((seguimiento.inicio between '{$_REQUEST['t_fecha_inicio_4']} 00:00:00' 
		        and '{$_REQUEST['t_fecha_fin_4']} 23:59:59') or (seguimiento.finalizacion between '{$_REQUEST['t_fecha_inicio_4']} 00:00:00' 
		        and '{$_REQUEST['t_fecha_fin_4']} 23:59:59')) and orden.cliente = '".$_SESSION['id_user']."' order by orden.orden, proceso.orden_proceso";
		
		
		
		 
		        
			         
		          
       //echo $sql;
		$pager = new ADODB_Pager($db,$sql); 
        $pager->Render($rows_per_page=10); 
        
		/*if ($db->Execute($sql) === false){
			$imprimir .= "Error en la consulta :". $db->ErrorMsg()."<br>";
		}*/
	
	}
	
}


?>