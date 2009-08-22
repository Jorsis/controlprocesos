<?

require_once('include/header.inc.php');
//include_once('include/sql2excel.class.php');
if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';


?>

<script language="javascript" src="script/cal2.js"></script>
<script language="javascript" src="script/cal_conf2.js"></script>

<script language="javascript">
function activar()
{
	var code;
	if (document.freporte.reporte[0].checked)
	{
		document.freporte.t_orden_1.disabled = true;
		document.freporte.s_cliente_1.disabled = false;
		
	}
	if (document.freporte.reporte[1].checked)
	{
		document.freporte.t_orden_1.disabled = false;
		document.freporte.s_cliente_1.disabled = true;
		
	}
	
	
}
</script>

<?
$imprimir = null;
$imprimir .= "<table align=center border=0>
<caption><H2>Reporte</H2></caption>";

$formulario = new cForm();
$formulario->_name = 'freporte';
//$formulario->radio('reporte', array('cliente'=>'cliente', 'orden'=>'orden'), '', 1, 1, 1, 1, 8, '', 'activar()');
/*$formulario->add_text('Cliente', 0, 0, 1, 1, '', '', '');
$formulario->radio('reporte', 'orden', '', 1, 0, 1, 0, 1, '');
$formulario->add_text('Orden', 0, 1, 1, 1, '', '', '');
$formulario->add_text('orden', 1, 0);
$formulario->input('t_orden_1', $orden, '15', '15', '', 0, 0, 1, 1, '', true);

$formulario->add_text('cliente', 0, 0);
$sql = "select * from cliente order by nombre_usuario";

	$data = $db->Execute($sql);
	
	$values = array();
	while (!$data->EOF)
	{
	
		$dato = array ('col0' => $data->fields['id_cliente'],
		               'col1' => $data->fields['nombre_usuario']);
		             
		               
		$values[] = $dato;
		               
		$data->MoveNext();

		
		
	}
	
	
	$formulario->select("s_cliente_1", $values, "", "","",0,0, 1, 1, true);*/
    $formulario->add_text('<h3>Fecha Inicio</h3>', 0, 0);
	$formulario->inputcal('t_fecha_inicio_4', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar1')", 'imagenes/cal.gif');
	$formulario->add_text('<h3>Fecha Fin</h3>', 0, 0);
	$formulario->inputcal('t_fecha_fin_4', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar2')", 'imagenes/cal.gif');

$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);

$imprimir .= "</table>";


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
		  //and (seguimiento.inicio is null or seguimiento.finalizacion is null)
		  
  unset($_SESSION['sql']);

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
		        and '{$_REQUEST['t_fecha_fin_4']} 23:59:59')) order by orden.orden, proceso.orden_proceso";
		
       //echo $sql;

if (!$_SESSION['sql'])
    $_SESSION['sql']=$sql;
		$pager = new ADODB_Pager($db,$_SESSION['sql']); 
        $pager->Render($rows_per_page=20); 
        
		/*if ($db->Execute($sql) === false){
			$imprimir .= "Error en la consulta :". $db->ErrorMsg()."<br>";
		}*/
	
	}
	
}

echo $imprimir;


/*$db_host='localhost';
	$db_user='lineadigital';
	$db_pwd='lineadigital';
	$db_dbname='lineadigital';
	

$excel=new Sql2Excel($db_host,$db_user,$db_pwd,$db_dbname);

$excel->ExcelOutput($sql);
	echo"<h1>Exel Generate Completed!!</h1>";
*/
if ($_POST['enviar'])
        echo '<meta http-equiv="Refresh" content="0;URL=excel.php?sql=' . $sql . '">';

?>