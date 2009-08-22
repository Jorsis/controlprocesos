<?php
require_once('include/header.inc.php');
if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';

?>
   
  
<?php


$form = new cForm;

$form->add_feedback("texto del campo", "", 1, 0);

$form->input('campo', '', '10', '10', '', 0, 1);

$form->checkbox('chequear', '5', '', 1, 0, '');

$form->add_text('presione aca', 0, 1);

$form->draw('enviar', 'enviar', '', 'center', '', 1, 1);

//$rs = $db->Execute('select * from usuario.estudiante'); 
    
$sql = 'select * from cliente';
    
    $pager = new ADODB_Pager($db,$sql); 
    $pager->Render($rows_per_page=30);


//$Dbg->add('DEBUG INFO');

//$Dbg->display();




require_once('include/footer.inc.php');
?>

  </body>
</html>
