param(
    [string]$accession = "1903120001"
)


$conn  = [System.Data.SqlClient.SqlConnection]::new('Server=LABHEALTHSERV2;Database=LincolnDiagnosticsLIS;User Id=dbro;Password=****;MultipleActiveResultSets=true;')

$commGetAccession = [System.Data.SqlClient.SqlCommand]::new()
$commGetAccession.Connection = $conn
$commGetAccession.CommandText = "select PatientID, PhysicianCode from tblAccessions where accession = @Accession"
$commGetAccession.Parameters.Add([System.Data.SqlClient.SqlParameter]::new("@Accession", $accession)) | Out-Null


$commGetPatient = [System.Data.SqlClient.SqlCommand]::new()
$commGetPatient.Connection = $conn
$commGetPatient.CommandText = "select * from tblPatient where patientid = @PatientID"

"select * from tblResultedTests where accession =  @Accession"

try{
    $conn.Open()
    $conn.State

    $commGetAccessionDR = $commGetAccession.ExecuteReader()
    if ($commGetAccessionDR.Read()){
        $PatientID, $PhysicianCode = $commGetAccessionDR['PatientID', 'PhysicianCode']
    }
    else
    {
        throw "Accession not found"
    }

    $PatientID
    $PhysicianCode

    $commGetPatient.Parameters.Add([System.Data.SqlClient.SqlParameter]::new("@PatientID", $PatientID)) | Out-Null 

    $commGetPatientDR = $commGetPatient.ExecuteReader()
    while ($commGetPatientDR.Read()){
        $commGetPatientDR['ptLastName']
    } 

    

}

catch{
    $commGetPatientDR.Close()
    $conn.Close()
    Write-Error $_

}
