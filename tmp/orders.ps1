$listFileName = 'C:\tmp\input.csv'
$orderTmplate = Get-Content C:\tmp\order.tmplate -Raw
$orderWithResultsTemplate = Get-Content C:\tmp\order_with_results.template -Raw
$resultsTemplate = Get-Content C:\tmp\result.template -Raw

#$connectionString = "Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword"
#$conn = [System.Data.SqlClient.SqlConnection]::new($connectionString)
#$comm = [System.Data.SqlClient.SqlCommand]::new($conn)

#$comm.CommandText("inert into test_table") # тут инсерт в базу

try {

#    $conn.Open()

    import-csv $ListFile -Delimiter "`t" | ForEach-Object {
        $order = $orderTmplate -f 
        $_."First Name".trim(),
        $_.'Last Name'.trim(),
        [datetime]::ParseExact($_.'DOB', 'MM/dd/yyyy', $null),
        $_.'Gender'.trim() 

        $orderWithResults = $orderWithResultsTemplate -f 
        $_."First Name".trim(),
        $_.'Last Name'.trim(),
        [datetime]::ParseExact($_.'DOB', 'MM/dd/yyyy', $null),
        $_.'Gender'.trim()

        $results = $resultsTemplate -f 
        $_."First Name".trim(),
        $_.'Last Name'.trim(),
        [datetime]::ParseExact($_.'DOB', 'MM/dd/yyyy', $null),
        $_.'Gender'.trim()
    
        
        $order 

        '----'
        $orderWithResults 

        '----'
        $results 

#        $comm.ExecuteNonQuery()   

    }

}
catch {
    # тут обработка на уникальность.
}
finally {
#    $conn.Close()
}
