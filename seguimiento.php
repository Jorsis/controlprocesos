<?
require_once('include/header.inc.php');
//echo $db->DBTimeStamp(time()-1);
if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';
   
   ?>
   
   <?


if ($_POST['enviar'])
{
	$fv = new FormValidator($_POST);
	$fv->doValidation();
	
	$date = time();
	
	if($fv->isError()) {

		//
		// if error show the error box
		//

		echo($fv->getErrorBox());
	}
	
	elseif (isset($_REQUEST['t_unidad_1'])) {
		
		$sql= "select count(*) from unidades where orden = '".$_REQUEST['t_orden_1'] . "' and unidad = '{$_REQUEST['t_unidad_1']}'";
		
		$dato = $db->Execute($sql);
		
		if ($dato->fields['count'] == 0) {
			?>
        	    <script language="javascript">
        	        alert('La unidad que esta intentando registrar no pertenece a este lote');
        	    </script>
        	    <?
        	    echo '<meta http-equiv="refresh" content="0;url=seguimiento.php?t_orden_1='.$_REQUEST['t_orden_1'] . '&t_proceso_1='.$_REQUEST['t_proceso_1'].'"';
        	    exit();
		}
		
		$sql = "select * from seguimiento where orden = '".$_REQUEST['t_orden_1'] . "' and proceso = '".$_REQUEST['t_proceso_1']."' and unidad = '{$_REQUEST['t_unidad_1']}'";
		
		
    
        $dato = $db->Execute($sql);
        
        
    
        $recordset = $db->Execute($sql);
        
        if ($recordset->_numOfRows == 0){
        	
        	
        	$sql = "insert into seguimiento (orden, proceso, unidad, inicio)
		        values ('".$_REQUEST['t_orden_1']."', '".$_REQUEST['t_proceso_1']."', '{$_REQUEST['t_unidad_1']}', '{$date}')";
        	
        	//echo $sql;
        	if ($db->Execute($sql) === false){
			$imprimir .= "Error insertando :". $db->ErrorMsg()."<br>";
		    }
		    else {
			    $imprimir .= "<div id='exito' class='ingexito'>Se ingreso con exito <br></div>";
			    
		}
		
		//echo '<meta http-equiv="refresh" content="3;url=refrescar.php"';
        }
        else 
        {
        	if (isset($dato->fields['finalizacion']))
        	{
        	    ?>
        	    <script language="javascript">
        	        alert('El proceso para esta orden ya se ejecuto');
        	    </script>
        	    <?
        	}
             else{ 
                $sql = "update seguimiento set finalizacion = {$date} 
                    where orden = '".$_REQUEST['t_orden_1']."' and proceso = '".$_REQUEST['t_proceso_1']."' and unidad = '{$_REQUEST['t_unidad_1']}'";
            
            $db->Execute($sql);
            
             }
            //echo '<meta http-equiv="refresh" content="3;url=refrescar.php"';
        
        }
		
		
		
	}
	header("Cache-control: no-store,no-cache,must-revalidate");
}


$imprimir = null;
$formulario = new cForm();

$formulario->_method='post';
$formulario->_name='seguimiento';

$imprimir .= "<table align=center border=0>
 <caption><H2>SEGUIMIENTO</H2></caption>";


if (!$_REQUEST['t_orden_1']){

    $formulario->add_text('<h3>Lote</h3>', 1, 0);
    $formulario->input('t_orden_1', $_REQUEST['t_orden_1'], '15', '15', '', 0, 1, 1, 1, '', false, 't_orden_1', 'onkeyup="pasarMayusculas(this)"');
}
elseif (!$_REQUEST['t_proceso_1']) {
	
	$sql = "SELECT COUNT(*) FROM orden WHERE orden = '{$_REQUEST['t_orden_1']}'";
	
	$dato = $db->Execute($sql);
		
	if ($dato->fields['count'] == 0) {
		?>
        	    <script language="javascript">
        	        alert('el lote <?= $_REQUEST['t_orden_1'] ?> no se ha registrado.');
        	    </script>
        	    <?
        	    echo '<meta http-equiv="refresh" content="0;url=seguimiento.php"';
        	    exit();
	}
	
	
	$oden = $_REQUEST['t_orden_1'];
	$formulario->add_text('<h3>Proceso</h3>', 1, 0);
    $formulario->input('t_proceso_1', $_REQUEST['t_proceso_1'], '20', '50', '', 0, 1, 1, 1, '', false, 't_proceso_1', 'onkeyup="pasarMayusculas(this.value)"');
    $formulario->hidden('t_orden_1', $_REQUEST['t_orden_1']);
	
    
    
    
    /*$sql = "select orden, proceso, proceso.nombre, inicio, finalizacion from seguimiento,proceso where proceso.id_proceso = seguimiento.proceso and orden = '".$_REQUEST['t_orden_1']."'";
    
    //$dato = $db->Execute($sql);
    

    $recordset = $db->Execute($sql);
      
	if ($recordset->RecordCount() == 0)
	{
		$imprimir .= "<div id='alerta' class='alert'>No se ha iniciado el proceso</div>";
	}
	else{
		$pager = new ADODB_Pager($db,$sql); 
        $pager->Render($rows_per_page=10); 	
	}*/
   
}elseif ($_REQUEST['t_proceso_1'] && $_REQUEST['t_orden_1']) {
	
	$sql= "select count(*) from proceso	where id_proceso = '".$_REQUEST['t_proceso_1'] . "'";
		
		$dato = $db->Execute($sql);
		
		if ($dato->fields['count'] == 0) {
			?>
        	    <script language="javascript">
        	        alert('La proceso <?= $_REQUEST['t_proceso_1'] ?> no esta registrado');
        	    </script>
        	    <?
        	    echo '<meta http-equiv="refresh" content="0;url=seguimiento.php?t_orden_1='.$_REQUEST['t_orden_1'] . '"';
        	    exit();
		}
	
	
	$formulario->add_text('<h3>Unidad</h3>', 1, 0);
    $formulario->input('t_unidad_1', '', '20', '50', '', 0, 1, 1, 1, '', false, 't_unidad_1', 'onkeyup="pasarMayusculas(this.value)"');
    $formulario->hidden('t_orden_1', $_REQUEST['t_orden_1']);
    $formulario->hidden('t_proceso_1', $_REQUEST['t_proceso_1']);
}

$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2, " return confproceso()");

$imprimir .= "</table>";


echo $imprimir;



require_once('include/footer.inc.php');
?>  


<? 
  	     /*   $codproceso = '<script language="JavaScript"> document.write(document.seguimiento.t_proceso_1.value); </script>';
  	       $codproceso = 5555;
  	        $sql = "select orden_proceso from proceso where id_proceso = '$codproceso'"; 
  	        $recordset = $db->Execute($sql);
  	        echo $recordSet->fields[0];*/
  	     
  	   $sql = "select * from proceso"; 
  	       $recordsets = $db->Execute($sql); 
  	       
 /*echo "<pre>";
 print_r($recordset->RecordCount());
 echo "</pre>"; 	 
 echo $recordset->GetRows();   */    
  	       
  	        
?>
<script language="JavaScript">
function confproceso()
{
	var obligatorio;
	var codigo;
	var opcional = 0;
	var obligatorio = 0;
	var listaobligatorio = '\n';
	var listaopcional = '\n';
	var test;
	<? global $oden; ?>

if (document.seguimiento.t_proceso_1)	
  {
  	    
  	    codigo = document.seguimiento.t_proceso_1.value;
  	    
  	    
  	    <?
  	       
  	       
  	       
  	       while (!$recordsets->EOF)
  	       {
  	       	?>
  	       	
  	       	if (codigo == '<? echo $recordsets->fields[0]; ?>')
  	       	{
  	       		
  	       		
  	       		<? 
  	       		  $sql = "select * from proceso where orden_proceso < {$recordsets->fields[4]} order by orden_proceso desc";
  	       		  $recordset = $db->Execute($sql); 
  	       		
  	       		$verificar = $recordset->_numOfRows;
  	       		
  	       		
  	       		    
  	       		    while (!$recordset->EOF)
  	       		    {
  	       		    	
  	       		    	
  	       		    	$sql = "select proceso.obligatorio, nombre 
  	       		    	        from proceso 
  	       		    	        where orden_proceso = $verificar  and 
  	       		    	        ($oden not in (select orden 
  	       		    	        from seguimiento 
  	       		    	        where proceso = '".$recordset->fields[0]."' and orden = '$oden' and finalizacion is not NULL))";
  	       		    	
  	       		    	$verificar = $verificar - 1;
  	       		    	
  	       		    	if (($recordset2 = $db->Execute($sql)) === false) 
  	       		    	    break;
  	       		    	
  	       		    	
  	       		    	
  	       		    	
  	       		    	$sql2 = $sql2 . " <br>" . $sql;  
  	       		    	
  	       		    	
  	       		    	?>
  	       		    	test = test + 1;
  	       		    	
  	       		    	<?
  	       		  
  	       		    	if ($recordset2->RecordCount() == 1)
  	       		    	{
  	       		    		
  	       		    		?>
  	       		    	
  	       		    	
  	       		    	
  	       		    	<?
  	       		    		
  	       		    		
  	       		    		if ($recordset2->fields[0] == 'f')
  	       		    		{
  	       		    			?>
  	       		    			opcional = opcional + 1;
  	       		    			listaopcional = listaopcional + '<?= $recordset2->fields[1] ?>' + '\n';
  	       		    			<?
  	       		    			
  	       		    		}
  	       		    		else 
  	       		    		{
  	       		    			?>
  	       		    			obligatorio = obligatorio +1;
  	       		    			listaobligatorio = listaobligatorio + '<?= $recordset2->fields[1] ?>' + '\n';
  	       		    			<?
  	       		    			
  	       		    		}
  	       		    		
  	       		    	}
  	       		    	
  	       		    $recordset->MoveNext(); 
  	       		    	
  	       		    }
  	       		
  	       		
  	       		 ?>
  	       		
  	       	}
  	       	<?
  	       	$recordsets->MoveNext(); 

  	       }
  	    ?>
  	    
  	    if (obligatorio > 0)
  	    {
  	    	alert("hay un proceso obligatorio: " + listaobligatorio);
  	        return false;
  	    }
  	    else if (opcional > 0)
  	    {
  	    	if (confirm("Los siguientes procesos no se han iniciado o terminado: " + listaopcional + "\n Realmente desea continuar con este proceso? "))
  	       	    return true;
  	       	else
  	       	    return false;
  	    }
  	    
  		
  }
  else 
      return true;
      
      
  

}


 </script>                               
