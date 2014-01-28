<?php
	
	include 'config.php';	
#------------------CODE FOR DOWNLOADING THE FILES --------------
	$download=array(
	'admin1CodesASCII.txt',
	'timeZones.txt',
	'featureCodes_en.txt',
	'iso-languagecodes.txt',
	'alternateNames.zip',
	'allCountries.zip',
	'countryInfo.txt');
	
	foreach($download as $file){
		$destination = "download/$file";
		 
		if (file_exists($destination)) {
		   echo "The file <b>$file</b> already exists in the download Folder<br> ";
        }else{
			
	   	 	$ch = curl_init();
			$source = "http://download.geonames.org/export/dump/$file ";
			
			curl_setopt($ch, CURLOPT_URL, $source);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			$data = curl_exec ($ch);
			curl_close ($ch);
			$file = fopen($destination, "w+");
			fputs($file, $data);
			fclose($file);
		}
		 
	}
	
#**********************END OF CODE FOR DOWNLOADING***************************
	
	
	
	
#--------------CODE FOR UNZIPPING THE 2 ZIPPED FILES-----------------------
	$zip = new ZipArchive;
	$filename=array('allCountries.zip','alternateNames.zip');
	foreach($filename as $file){
			$file1 = preg_replace('"\.zip$"', '.txt', $file);
			if (file_exists("download/$file1")) {
		  			 echo "The file <b>$file1</b> already exists in the download Folder<br> ";
       		 }else{
				$res = $zip->open('download/'.$file);
					if ($res === TRUE) {
			 	 $zip->extractTo($path);
			 	 $zip->close();
			 	 echo "$file UnZipped!<br>";
				}else {
				  echo "$file UnZipped! Failed<br>";
				}
		}
	}
#*********************END OF CODE FOR UNZIPPING THE 2 ZIPPED FILES*********************
	
	
	
	
	
#---------------------CODE FOR TABLES CREATION AND DATABASE INSERTION----------------------
	#Database base connection string
	$con=mysql_connect($host,$user,$password);
	mysql_select_db($database,$con);
	
	#opening connection for the insertion og utf8 characters
	mysql_query("SET NAMES utf8");
	
	#Code for truncationg the already inserted database the tables
	$query="SHOW TABLES";
	$result =mysql_query($query);
	while($data = mysql_fetch_array($result)){
				mysql_query("TRUNCATE ".$data["Tables_in_$database"]);
	}
	
	#Code for the creation of tables
	$query=file_get_contents('tables.sql');
	$statement=mysql_query($query);

	#Array of filename and the table name 
	$tablenames=array(
		#txt name,table name
		array('allCountries.txt','geo_name'),
		array('alternateNames.txt','geo_alternateName'),
		array('admin1CodesASCII.txt','geo_admin1'),
		array('timeZones.txt','geo_timeZones'),
		
		array('featureCodes_en.txt','geo_featureCodes'),
		array('iso-languagecodes.txt','geo_languagecodes'),
		
		array('countryInfo.txt','geo_country')
	
	);
	
foreach($tablenames as $file){
	
		$query="load data infile '{$path}{$file['0']}' IGNORE INTO TABLE {$file['1']} CHARACTER SET UTF8;";	
	    $statement=mysql_query($query);		
}	

	#Delete empty rows from countryIndo
	$query="
	DELETE FROM geo_country where iso_alpha2 LIKE '#%';
	DELETE FROM geo_languagecodes where iso_639_3='ISO';
	DELETE FROM geo_timezones where countrycode='CountryCode';
	";
	$statement=mysql_query($query);
	if ($statement) {
		echo 'DElETED';
	} 
#******************END OF CODE FOR TABLES CREATION AND DATABASE INSERTION***************************
	
?>