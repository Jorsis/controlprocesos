<?
//make class file require
require('xpMenu.class.php');
//construct the class
$xpmenu = new xpMenu();

//add category and options on menu
//use the format: 
//addMenu("short_name")
//addCategory("short_name", "name", "image", "menu")
//addOption("short_name", "name", "image", "link", "category", "menu")
//remember: short_name can be anything without spaces or specials chars

$xpmenu->addMenu("menu1");

$xpmenu->addCategory("menusup1", "Google Links on Menu 1", "icons/network.gif", "menu1");
	$xpmenu->addOption("google", "Google on Menu 1", "icons/wmail.gif", "http://www.google.com", "menusup1", "menu1");
	$xpmenu->addOption("gmail", "GMail on Menu 1", "icons/news.gif", "http://www.gmail.com", "menusup1", "menu1");
	$xpmenu->addOption("maps", "Google Maps on Menu 1", "icons/wmail.gif", "http://maps.google.com", "menusup1", "menu1");
	$xpmenu->addOption("labs", "Google Labs on Menu 1", "icons/news.gif", "http://labs.google.com", "menusup1", "menu1");

$xpmenu->addCategory("menusup2", "My Links on Menu 1", "icons/wmail.gif", "menu1");
	$xpmenu->addOption("inter", "Internacional on Menu 1", "icons/wmail.gif", "http://www.internacional.com.br", "menusup2", "menu1");
	$xpmenu->addOption("theblog", "TheBlog.br on Menu 1", "icons/news.gif", "http://the.blog.br", "menusup2", "menu1");
	$xpmenu->addOption("portalsi", "PortalSI.info on Menu 1", "icons/si.gif", "http://www.portalsi.info", "menusup2", "menu1");

$xpmenu->addMenu("menu2");

$xpmenu->addCategory("menu2sup1", "Google Links on Menu 2", "icons/network.gif", "menu2");
	$xpmenu->addOption("google1", "Google on Menu 2", "icons/wmail.gif", "http://www.google.com", "menu2sup1", "menu2");
	$xpmenu->addOption("gmail1", "GMail on Menu 2", "icons/news.gif", "http://www.gmail.com", "menu2sup1", "menu2");
	$xpmenu->addOption("maps1", "Google Maps on Menu 2", "icons/wmail.gif", "http://maps.google.com", "menu2sup1", "menu2");
	$xpmenu->addOption("labs1", "Google Labs on Menu 2", "icons/news.gif", "http://labs.google.com", "menu2sup1", "menu2");

$xpmenu->addCategory("menu2sup2", "My Links on Menu 2", "icons/wmail.gif", "menu2");
	$xpmenu->addOption("inter1", "Internacional on Menu 2", "icons/wmail.gif", "http://www.internacional.com.br", "menu2sup2", "menu2");
	$xpmenu->addOption("theblog1", "TheBlog.br on Menu 2", "icons/news.gif", "http://the.blog.br", "menu2sup2", "menu2");
	$xpmenu->addOption("portalsi1", "PortalSI.info on Menu 2", "icons/si.gif", "http://www.portalsi.info", "menu2sup2", "menu2");	

?>

<html>
<head>

<?
//javascript for the menu
echo $xpmenu->javaScript();
//css for menu
echo $xpmenu->style();
?>

</head>
<body bgcolor='#FFFFFF' marginheight='0' marginwidth='0' topmargin='0' leftmargin='0'>
<table border='1' cellpadding='0' cellspacing='0' width='100%' height='100%'><tr><td valign='top'>
	<table border='0' cellspacing='1' cellpadding='0' width='100%' height='100%' bgcolor='#f1f1ed'>
		<tr>
			<td valign='top' width=50%>
			<?
				//show menu (put this where you want to show the XP Menu)
				echo $xpmenu->mountMenu("menu1");
			?>
  			</td>
			<td valign='top' width=50%>
			<?
				//show menu (put this where you want to show the XP Menu)
				echo $xpmenu->mountMenu("menu2");
			?>
  			</td>
  		</tr>
  	</table>
  </table>

</body>
</html>