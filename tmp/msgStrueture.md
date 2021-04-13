# ORU^R01 Message Definition

MSH -- MESSAGE HEADER SEGMENT

`MSH|^~\&|lab|lab name|receiver|Lab Client Code|YYYYMMDDhhmmss||ORU^R01|ctrl ID|P|2.3`

PID -- PATIENT IDENTIFICATION
*tblPerson* table

`PID|1|sender patient ID|lab patient ID||last name^first name||YYYYMMDD (dob)|Sex|||street^street^city^state^zip||phone||||||ssn`

PV1 В описании нет юлия сказал что это сведения о докторе
*tblPhisicans* table

`PV1|1|C||R||NPI^Dr last name^first name^^^^degree|||||||||||||||||||||||||||||||||Client ID^street^street^city^state^zip`

ORC --COMMON ORDER SEGMENT The Common Order (ORC) segment is used to send the requesting provider.

`ORC|RE|requisition#|lab accession#||CM||||yyyymmddhhmmss (collected)|||||`

OBR -- OBSERVATION REQUEST SEGMENT At least one OBR segment should be present for each Order Code associated with any PID segment. This segment is mandatory in ORU messages.

`OBR|1|requisition#|lab accession#|Test ID^Test Description|R||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||lab ID^lab name^lab address^lab city^lab state^lab zip^lab director^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)`

OBX -- OBSERVATION/RESULT SEGMENT This is a required segment. It contains the values corresponding to the results

`OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)`
`OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)`

OBR -- OBSERVATION REQUEST SEGMENTAt 

`OBR|2|requisition#|lab accession#|PDF^Results Report|||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||||lab ID^lab name^lab address^lab city^lab state^lab zip^lab director^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)`

OBX -- OBSERVATION/RESULT SEGMENT This is a required segment. It contains the values corresponding to the results
`OBX|1|ED|PDF^PDF BASE64|1|JVBERi0xLjQKJeLjz9MKMSAwIG9iago8PC9UeXBlL1hPYmplY3QvU3VidHlwZS9JbWFnZS9X`
`FTS|1|End of File`
