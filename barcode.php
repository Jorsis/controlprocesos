<?
require_once('include/conexion.inc.php');
require_once('include/Smarty/Smarty.class.php');
session_start(); 
$db->debug = false;



$smarty = new Smarty;


$barcode = array('CODE' => 'code128',
                 'OUTPUT' => '1',  // 1 = png, 2 = jpg
                 'THICKNESS' => '50', //
                 'RESOLUTION' => '2', // resolucion
                 'FONT' => '5', //tamaño de la fuente
                 'A1' => '', //Checksum
                 'A2' => '',
                 'ALT' => 'Error');


$codebar = array();
$count = 0;

//code=code39&o=1&t=30&r=1&text=a22222&f=2&a1=&a2=" alt="Error? Can't display image!"

$sql = "SELECT unidad FROM unidades WHERE orden = '{$_SESSION['id_orden']}'";

$record = $db->Execute($sql);

/*$sqlcliente = "select * from cliente where id_usuario = '{$_SESSION['cliente']}' LIMIT 1 OFFSET 0";
$concliente = $db->Execute($sqlcliente);*/

/*echo "<pre>";
print_r($record);
echo "</pre>";*/

$bar_orden[] ="<b>LOTE</b>";
//$bar_orden[] ="<b>CLIENTE</b>";
$bar_orden[] ="<b>REFERENCIA</b>";
$bar_orden[] ="<b>UNIDADES</b>"; 


$bar_orden[] = '<img src="include/barcodegen/html/image.php?code='.$barcode['CODE'].'&o='.$barcode['OUTPUT'].'&t='.$barcode['THICKNESS'].'&r='.$barcode['RESOLUTION'].'&text='.urlencode($_SESSION['id_orden']).'&f='.$barcode['FONT'].'&a1='.$barcode['A1'].'&a2='.$barcode['A2'].'" alt='.$barcode['ALT'].' />';

//$bar_orden[] =ucwords($concliente->fields['nombre_cliente']);
$bar_orden[] =$_SESSION['referencia'];
$bar_orden[] =$_SESSION['cantidad'];



$smarty->assign('id_orden', $bar_orden);

if (!$record)
    echo $db->ErrorMsg();
else 
    while (!$record->EOF)
    {
        $count += 1;
        $codebar[] = $_SESSION['id_orden'] . '
                      <br>
                      <img src="include/barcodegen/html/image.php?code='.$barcode['CODE'].'&o='.$barcode['OUTPUT'].'&t='.$barcode['THICKNESS'].'&r='.$barcode['RESOLUTION'].'&text='.urlencode($record->fields[0]).'&f='.$barcode['FONT'].'&a1='.$barcode['A1'].'&a2='.$barcode['A2'].'" alt='.$barcode['ALT'].' /><br><br><br><br><br>';
        /*if ($count % 2)
            $codebar[] = '&nbsp;';*/
        
        $record->MoveNext();
        
        
    }
$smarty->assign('codebar', $codebar);
$smarty->display('barcode.tpl');

?>