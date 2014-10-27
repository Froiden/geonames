This script downloads the following files to the download folder:

1. http://download.geonames.org/export/dump/allCountries.zip 
2. http://download.geonames.org/export/dump/alternateNames.zip 
3. http://download.geonames.org/export/dump/admin1CodesASCII.txt 
4. http://download.geonames.org/export/dump/timeZones.txt 
5. http://download.geonames.org/export/dump/featureCodes_en.txt 
6. http://download.geonames.org/export/dump/iso-languagecodes.txt 
7. http://download.geonames.org/export/dump/countryInfo.txt

After downloading the files, the 2 zipped files _allCountries.zip_ and _alternateNames.zip_ are unzipped by the script itself. Then correspoding database tables are created for the above downloaded files to import.

| Filename              | Database Tables Name     |
|-----------------------|--------------------------|
| allCountries.txt      | geo_name                 |
| alternateNames.txt    | geo_alternateNames       |
| admin1CodesASCII.txt  | geo_admin1               |
| timeZones.txt         | geo_timeZones            |
| featureCodes\_en.txt  | geo_featureCodes         |
| iso-languagecodes.txt | geo_languagecodes        |
| countryInfo.txt       | geo_country              |

Then all the information is imported from files to their corresponding tables.

Note: Please create the database first and then the database name in the config.php file
