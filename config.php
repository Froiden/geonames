<?php	
	ini_set('max_execution_time', 0);
	
	
#------------------Changes to be done here-----------------------------
	
	$host='localhost'; #hostname
	$user='root';          #user
	$password='';      #password
	$database='gabned';      #database name
	#path of the download folder which is in the geonames folder..Dont forget to end with /
	$path='/Install Directory/xampp/htdocs/geonames/download/';
	
#*****************************************************************************	
	
	#Database base connection string
	$con=mysql_connect($host,$user,$password);
	mysql_select_db($database,$con);
	
	#opening connection for the insertion og utf8 characters
	mysql_query("SET NAMES utf8");
?>