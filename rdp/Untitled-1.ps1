

[void][System.Reflection.Assembly]::LoadFrom("C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.23\Assemblies\v4.5.2\MySql.Data.dll" )
$myconnection = [MySql.Data.MySqlClient.MySqlConnection]::new()
$myconnection.ConnectionString = “server=yoursever;user id=youruser;password=yourpassword;database=yourdb;pooling=false”
