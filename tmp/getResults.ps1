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

$commGetPhysicians = [System.Data.SqlClient.SqlCommand]::new()
$commGetPhysicians.Connection = $conn
$commGetPhysicians.CommandText = "select * from tblPhysicians where PhysicianCode = @PhysicianCode"

try{
    $conn.Open()

    $commGetAccessionDR = $commGetAccession.ExecuteReader()
    if ($commGetAccessionDR.Read()){
        $PatientID, $PhysicianCode = $commGetAccessionDR['PatientID', 'PhysicianCode']
    }

    else{
        throw "Accession not found"
    }

    $out = "MSH|^~\&|lab|lab name|receiver|Lab Client Code|YYYYMMDDhhmmss||ORU^R01|ctrl ID|P|2.3`r`n"
    $commGetPatient.Parameters.Add([System.Data.SqlClient.SqlParameter]::new("@PatientID", $PatientID)) | Out-Null 

    $commGetPatientDR = $commGetPatient.ExecuteReader()
    while ($commGetPatientDR.Read()){
       $out += "PID|1|$($commGetPatientDR['PatientId'])|$($commGetPatientDR['PatientId'])||$($commGetPatientDR['ptLastName'])^$($commGetPatientDR['ptFirstName'])||$('{0:yyyyMMdd}' -f $commGetPatientDR['ptDateOfBirth'])(dob)|$($commGetPatientDR['ptSex'])|||$($commGetPatientDR['ptAddress1'])^$($commGetPatientDR['ptAddress2'])^$($commGetPatientDR['ptCity'])^$($commGetPatientDR['ptState'])^$($commGetPatientDR['ptZip'])||$($commGetPatientDR['PTContactCellPhone'])||||||$($commGetPatientDR['btSSN'])`r`n"
    } 
    $commGetPatientDR.Close()

    $commGetPhysicians.Parameters.Add([System.Data.SqlClient.SqlParameter]::new("@PhysicianCode", $PhysicianCode)) | Out-Null 

    $commGetPhysiciansDR = $commGetPhysicians.ExecuteReader()
    while ($commGetPhysiciansDR.Read()){
       $out += "PV1|1|C||R||$($commGetPhysiciansDR['NPI'])^Dr $($commGetPhysiciansDR['LastName'])^$($commGetPhysiciansDR['FirstName'])^^^^degree|||||||||||||||||||||||||||||||||Client ID^street^street^city^state^zip`r`n"
    }
    $commGetPatientDR.Close()
    $out
}

catch{
    $commGetPatientDR.Close()
    $conn.Close()
    Write-Error $_

}
