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
/*$formulario->radio('reporte', array('cliente'=>'cliente', 'orden'=>'orden'), '', 1, 1, 1, 1, 8, '', 'activar()');
$formulario->add_text('Cliente', 0, 0, 1, 1, '', '', '');*/
/*$formulario->radio('reporte', 'orden', '', 1, 0, 1, 0, 1, '');
$formulario->add_text('Orden', 0, 1, 1, 1, '', '', '');*/
$formulario->add_text('orden', 1, 0);
$formulario->input('t_orden_1', $orden, '15', '15', '', 0, 0, 1, 1, '', false);

/*$formulario->add_text('cliente', 0, 0);
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
	$formulario->inputcal('t_fecha_inicio_0', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar1')", 'imagenes/cal.gif');
	$formulario->add_text('<h3>Fecha Fin</h3>', 0, 0);
	$formulario->inputcal('t_fecha_fin_0', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar2')", 'imagenes/cal.gif');

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
		  
		/*$sql = "select ord.orden, cli.nombre_cliente, ord.referencia, ord.unidades,
(select extract(day from seguimiento.inicio) || '-' ||extract(month from seguimiento.inicio) || '-' ||extract(year from seguimiento.inicio) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'S001') as fecha_inicio_separacion, (select extract(hour from seguimiento.inicio) || ':' || extract(minute from seguimiento.inicio) || ':' || extract(second from seguimiento.inicio)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'S001') as hora_inicio_separacion,

(select extract(day from seguimiento.finalizacion) || '-' ||extract(month from seguimiento.finalizacion) || '-' ||extract(year from seguimiento.finalizacion) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'S001') as fecha_finalizacion_separacion, (select extract(hour from seguimiento.finalizacion) || ':' || extract(minute from seguimiento.finalizacion) || ':' || extract(second from seguimiento.finalizacion)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'S001') as hora_finalizacion_separacion,

(select extract(day from seguimiento.inicio) || '-' ||extract(month from seguimiento.inicio) || '-' ||extract(year from seguimiento.inicio) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'I001') as fecha_inicio_impresion, (select extract(hour from seguimiento.inicio) || ':' || extract(minute from seguimiento.inicio) || ':' || extract(second from seguimiento.inicio)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'I001') as hora_inicio_impresion,

(select extract(day from seguimiento.finalizacion) || '-' ||extract(month from seguimiento.finalizacion) || '-' ||extract(year from seguimiento.finalizacion) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'I001') as fecha_finalizacion_impresion, (select extract(hour from seguimiento.finalizacion) || ':' || extract(minute from seguimiento.finalizacion) || ':' || extract(second from seguimiento.finalizacion)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'I001') as hora_finalizacion_impresion,

(select extract(day from seguimiento.inicio) || '-' ||extract(month from seguimiento.inicio) || '-' ||extract(year from seguimiento.inicio) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'G001') as fecha_inicio_grabacion, (select extract(hour from seguimiento.inicio) || ':' || extract(minute from seguimiento.inicio) || ':' || extract(second from seguimiento.inicio)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'G001') as hora_inicio_grabacion,

(select extract(day from seguimiento.finalizacion) || '-' ||extract(month from seguimiento.finalizacion) || '-' ||extract(year from seguimiento.finalizacion) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'G001') as fecha_finalizacion_grabacion, (select extract(hour from seguimiento.finalizacion) || ':' || extract(minute from seguimiento.finalizacion) || ':' || extract(second from seguimiento.finalizacion)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'G001') as hora_finalizacion_grabacion,

(select extract(day from seguimiento.inicio) || '-' ||extract(month from seguimiento.inicio) || '-' ||extract(year from seguimiento.inicio) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'M001') as fecha_inicio_muestra, (select extract(hour from seguimiento.inicio) || ':' || extract(minute from seguimiento.inicio) || ':' || extract(second from seguimiento.inicio)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'M001') as hora_inicio_muestra,

(select extract(day from seguimiento.finalizacion) || '-' ||extract(month from seguimiento.finalizacion) || '-' ||extract(year from seguimiento.finalizacion) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'M001') as fecha_finalizacion_muestra, (select extract(hour from seguimiento.finalizacion) || ':' || extract(minute from seguimiento.finalizacion) || ':' || extract(second from seguimiento.finalizacion)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'M001') as hora_finalizacion_muestra,

(select extract(day from seguimiento.inicio) || '-' ||extract(month from seguimiento.inicio) || '-' ||extract(year from seguimiento.inicio) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'P001') as fecha_inicio_produccion, (select extract(hour from seguimiento.inicio) || ':' || extract(minute from seguimiento.inicio) || ':' || extract(second from seguimiento.inicio)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'P001') as hora_inicio_produccion,

(select extract(day from seguimiento.finalizacion) || '-' ||extract(month from seguimiento.finalizacion) || '-' ||extract(year from seguimiento.finalizacion) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'P001') as fecha_finalizacion_produccion, (select extract(hour from seguimiento.finalizacion) || ':' || extract(minute from seguimiento.finalizacion) || ':' || extract(second from seguimiento.finalizacion)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'P001') as hora_finalizacion_produccion,

(select extract(day from seguimiento.inicio) || '-' ||extract(month from seguimiento.inicio) || '-' ||extract(year from seguimiento.inicio) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'T001') as fecha_inicio_termofijacion, (select extract(hour from seguimiento.inicio) || ':' || extract(minute from seguimiento.inicio) || ':' || extract(second from seguimiento.inicio)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'T001') as hora_inicio_termofijacion,

(select extract(day from seguimiento.finalizacion) || '-' ||extract(month from seguimiento.finalizacion) || '-' ||extract(year from seguimiento.finalizacion) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'T001') as fecha_finalizacion_termofijacion, (select extract(hour from seguimiento.finalizacion) || ':' || extract(minute from seguimiento.finalizacion) || ':' || extract(second from seguimiento.finalizacion)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'T001') as hora_finalizacion_termofijacion,

(select extract(day from seguimiento.inicio) || '-' ||extract(month from seguimiento.inicio) || '-' ||extract(year from seguimiento.inicio) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'D001') as fecha_inicio_despacho, (select extract(hour from seguimiento.inicio) || ':' || extract(minute from seguimiento.inicio) || ':' || extract(second from seguimiento.inicio)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'D001') as hora_inicio_despacho,

(select extract(day from seguimiento.finalizacion) || '-' ||extract(month from seguimiento.finalizacion) || '-' ||extract(year from seguimiento.finalizacion) from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'D001') as fecha_finalizacion_despacho, (select extract(hour from seguimiento.finalizacion) || ':' || extract(minute from seguimiento.finalizacion) || ':' || extract(second from seguimiento.finalizacion)from seguimiento where ord.orden = seguimiento.orden and seguimiento.proceso = 'D001') as hora_finalizacion_despacho

from orden ord, cliente cli, seguimiento seg
where cli.id_cliente = ord.cliente  and seg.finalizacion < '{$_REQUEST['t_fecha_fin_4']} 23:59:59' group by ord.orden, referencia, unidades,cli.nombre_cliente order by ord.orden desc";
		
		//and ord.orden = seg.orden
       //echo $sql;
		$pager = new ADODB_Pager($db,$sql); 
        $pager->Render($rows_per_page=30); */
        
		/*if ($db->Execute($sql) === false){
			$imprimir .= "Error en la consulta :". $db->ErrorMsg()."<br>";
		}*/
	
		
		
		include "include/adodb/pivottable.inc.php";
		
		/*$sql = PivotTableSQL($db, 'tiempos t, proceso p',
		                     'orden',
		                     'nombre', 
		                     'id_proceso = proceso');*/
		                     
		
		$sql = "SELECT p.nombre, t.tiempo as Total FROM tiempo t, proceso p WHERE id_proceso = proceso and t.orden= '{$_REQUEST['t_orden_1']}' GROUP BY nombre,tiempo";
		
		//echo $sql;
		
		$recordSet = $db->Execute($sql);
		
		$data = array();
		$proceso = array();
		
		if (!$recordSet) 	
			print $conn->ErrorMsg();
	    else
	    	while (!$recordSet->EOF) {	
	    		$data []= $recordSet->fields[1];	
	    		$proceso []= $recordSet->fields[0];	
	    		$recordSet->MoveNext();
	    	}

	}
	
}

echo $imprimir;


$_SESSION['grafica']=$data;
$_SESSION['proceso']=$proceso;
$_SESSION['orden']=$_REQUEST['t_orden_1'];



?>
<center><img src="grafica.php" alt="reporte de procesos" align="center">
</center>

<?


/*$db_host='localhost';
	$db_user='lineadigital';
	$db_pwd='lineadigital';
	$db_dbname='lineadigital';
	

$excel=new Sql2Excel($db_host,$db_user,$db_pwd,$db_dbname);

$excel->ExcelOutput($sql);
	echo"<h1>Exel Generate Completed!!</h1>";
*/
/*$_SESSION['sqlexcel'] = $sql;
if ($_POST['enviar'])
        echo '<meta http-equiv="Refresh" content="0;URL=excel.php">';*/

?>