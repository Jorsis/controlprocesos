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
$formulario->radio('reporte', array('cliente'=>'cliente', 'orden'=>'orden'), '', 1, 1, 1, 1, 8, '', 'activar()');
/*$formulario->add_text('Cliente', 0, 0, 1, 1, '', '', '');
$formulario->radio('reporte', 'orden', '', 1, 0, 1, 0, 1, '');
$formulario->add_text('Orden', 0, 1, 1, 1, '', '', '');*/
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
	
	
	$formulario->select("s_cliente_1", $values, "", "","",0,0, 1, 1, true);
    $formulario->add_text('fecha inicio', 0, 0);
	$formulario->inputcal('t_fecha_inicio_4', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar1')", 'imagenes/cal.gif');
	$formulario->add_text('fecha fin', 0, 0);
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
		  
		  
		$sql = "select ord.ingreso, ord.referencia, ord.unidades, cliente.nombre_cliente, ord.orden,
		
		(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'S001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as SEPARACION, 		   
		        (select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'I001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as IMPRESION, 
		        
(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'G001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as GRABACION, 

(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'M001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as MUESTRA, 
		        
(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'P001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as PRODUCCION,		        		        		        
(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'T001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as TERMOFIJACION, 
(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'D001' and inicio >='{$_REQUEST['t_fecha_inicio_4']}'  and finalizacion <= '{$_REQUEST['t_fecha_fin_4']}') as DESPACHO
		                   
		        from cliente, orden as ord, seguimiento";
		
		
		
	            if ($_REQUEST['t_orden_1'])
		          $sql .= " where ord.orden = {$_REQUEST['t_orden_1']} and cliente.id_usuario = ord.cliente ";
		        else 
		            $sql .= " where '{$_REQUEST['s_cliente_1']}' = ord.cliente and ord.orden = seguimiento.orden and cliente.id_cliente = ord.cliente";
		            
		            $sql .= " and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null) group by ingreso, referencia, unidades, nombre_cliente, ord.orden";
		
       //echo $sql;
		$pager = new ADODB_Pager($db,$sql); 
        $pager->Render($rows_per_page=10); 
        
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