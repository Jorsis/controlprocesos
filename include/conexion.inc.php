<?
/**
 * En este archivo se abrira la conexion con la base de datos y se cargara en el 
 * objeto llamado $db, a partir de este objeto se ejecutaran todas las consultas
 * necesaria para trabajar en la aplicacion 
 */

require_once('adodb/adodb.inc.php');
include_once('adodb/adodb-pager.inc.php'); 
require_once('config.inc.php');


    $db = ADONewConnection(DBCON); 
    //Mientras se programa se utilizara la funcion debug para relizar depuraciones al sistema
    
    $db->Connect(HOST, USER, PASSWORD, DB); 
    
    
    /*
    $rs = $db->Execute('select * from usuario.estudiante'); 
    
    $sql = 'select * from usuario.estudiante';
    
    $pager = new ADODB_Pager($db,$sql); 
    $pager->Render($rows_per_page=30); */
    

?>