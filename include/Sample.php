<html>
<head>
<title>Sample for Form Validator</title>
</head>
<body>
<?
if($_POST['b_save_0']) {
	
	require("./FormValidator.php");
	
	$fv = new FormValidator($_POST);
	$fv->doValidation();
	
	$DateForValidation = $_POST['s_month_0']."-".$_POST['s_date_0']."-".$_POST['s_year_0'];
	
	//
 	// perform any other addtional validation if required
 	// --------------------------------------------------
 	//
	// validate date of birth
	//

	if(!$fv->isDate($DateForValidation, "")) {
		$fv->setErrorMessage("Invalid Joining Date");
	}
	
	//
	// match the password and confirm password.
	//
	
	if(trim($_POST['t_password_1']) != trim($_POST['t_confirm_password_1'])) {
		$fv->setErrorMessage("Confirm Password Not Matching");
	}

	if($fv->isError()) {

		//
		// if error show the error box
		//

		echo($fv->getErrorBox());
	}
	else {

		//
		// no error found 
		// now do the database processing (insert/update/delete) or show.
		//
		
		?><center><font color="#008080">Congrats !!! You filled the form successfully... ;)</font></center><?
	}
}
?>
<center>
<h4>Example form</h4>
<table border="1" cellpadding="4" cellspacing="4" bgcolor="#F2F2F2">
  <tr>
    <td>
<form method="POST" action="">
<table border="0" cellpadding="4" style="border-collapse: collapse">
    <tr>
      <td valign="top" align="right"><b>Name
      <font color="#FF0000">*</font></b></td>
      <td><input type="text" name="t_name_1" size="20"></td>
    </tr>
    <tr>
      <td valign="top" align="right"><b>Email
      <font color="#FF0000">*</font></b></td>
      <td><input type="text" name="t_email_2" size="20"></td>
    </tr>
    <tr>
      <td valign="top" align="right"><b>Date of Birth
      <font color="#FF0000">*</font></b></td>
      <td>
      <select size="1" name="s_year_0">
      <?
      for($i = (date("Y")-100) ; $i  <= (date("Y")-3) ; $i++)
      {
      	?><option value="<?=$i?>"><?=$i?></option><?
      }
      ?>
      </select>
      <select size="1" name="s_date_0">
      <?
      for($i = 1 ; $i  <= 32 ; $i++)
      {
      	?><option value="<?=$i?>"><?=$i?></option><?
      }
      ?>      
      </select>
      <select size="1" name="s_month_0">
      <?
      for($i = 1 ; $i  <= 12 ; $i++)
      {
      	?><option value="<?=$i?>"><?=$i?></option><?
      }
      ?>      
      </select><br>
      [Format Year, month, date]
      </td>
    </tr>
    <tr>
      <td valign="top" align="right"><b>User Name
      <font color="#FF0000">*</font></b></td>
      <td><input type="text" name="t_user_name_1" size="20"></td>
    </tr>
    <tr>
      <td valign="top" align="right"><b>Password
      <font color="#FF0000">*</font></b></td>
      <td><input type="text" name="t_password_1" size="20"></td>
    </tr>
    <tr>
      <td valign="top" align="right"><b>Confirm Password
      <font color="#FF0000">*</font></b></td>
      <td><input type="text" name="t_confirm_password_1" size="20"></td>
    </tr>
    <tr>
      <td valign="top" align="right"><b>Address&nbsp;&nbsp;&nbsp; </b></td>
      <td><textarea rows="7" name="x_address_0" cols="19"></textarea></td>
    </tr>
    <tr>
      <td valign="top" align="right"><b>Salary
      <font color="#FF0000">*</font></b></td>
      <td><input type="text" name="t_salary_6" size="6"> USD</td>
    </tr>
    <tr>
      <td colspan="2" valign="top">
      <p align="center"><input type="submit" value="Save" name="b_save_0"></td>
    </tr>
</table>
</td>
  </tr>
</table>

</form>
</center>
</body>
</html>