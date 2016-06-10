<?php	
	ini_set('max_execution_time', 0);
	ini_set('memory_limit', '-1');
	
#***********************************Changes to be done here**************************************************
	$GLOBALS["HOST"]     = "localhost";
	$GLOBALS["USERNAME"] = "root";
	$GLOBALS["PASSWORD"] = "";
	$GLOBALS["DATABASE"] = "geonames";

	#path of the download folder which is in the geonames folder..Dont forget to end with /
	define('DPATH', dirname(__FILE__).DIRECTORY_SEPARATOR.'download'.DIRECTORY_SEPARATOR);
	
#*****************************************************************************	

	$db = connectDatabase();

	function connectDatabase() {
		try{
			$db = new PDO("mysql:dbname={$GLOBALS["DATABASE"]};host={$GLOBALS["HOST"]}", $GLOBALS["USERNAME"], $GLOBALS["PASSWORD"]);
			$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$db->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES utf8");
			return $db;
		}catch(PDOException $ex)
		{
			die(json_encode(array('outcome' => false, 'message' => 'Database connection failed')));
		}
	}

?>
