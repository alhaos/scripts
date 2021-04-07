# Тестовая обработка заказов
Я сделал файлы шаблонов для заказа, результата и заказа с результатом.

* [order.tmplate](https://github.com/alhaos/scripts/blob/master/tmp/order.tmplate)
* [result.template](https://github.com/alhaos/scripts/blob/master/tmp/result.template)
* [order_with_results.template](https://github.com/alhaos/scripts/blob/master/tmp/order_with_results.template)


Cкрипта [orders.ps1](https://github.com/alhaos/scripts/blob/master/tmp/orders.ps1) используя эти шаблоны, создает готовые документы, и помещает их в базу данных, проверяя уникальность. Пока обрабатываются только имя, фамилия, дата рождения и пол.

``` code
MSH|^~\&|sender|sender system|lab name|Lab Client Code|YYYYMMDDhhmmss||ORM^O01|ctrl ID|P|2.5.1
PID|1|sender patient ID|Lab patient ID||NIXONE^BARB||YYYYMMDD (19400327)|F|||street^street^city^state^zip||phone||||||ssn
RXO|medication code^description
RXO|medication code^description
PV1|||||||NPI^BARB^NIXONE^title
ORC|NW|sender order#|||||||collect date & time
SPM|1|specimen ID^description^L||result||normal
SPM|2|specimen ID^description^L||result||normal
DG1|1|IC10|diagnosis code^description
DG1|2|IC10|diagnosis code^description
IN1|1||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
IN1|2||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
GT1|1||last name^first name||street^street^city^state^zip|phone|dob|sex||relation to patient|ssn
OBR|1|sender order#||test code^test name|R||order date & time

FTS|1|End of File
----
MSH|^~\&|sender|sender system|lab name|Lab Client Code|YYYYMMDDhhmmss||ORM^O01|ctrl ID|P|2.5.1
PID|1|sender patient ID|Lab patient ID||NIXONE^BARB||YYYYMMDD (19400327)|F|||street^street^city^state^zip||phone||||||ssn
RXO|medication code^description
RXO|medication code^description
PV1|||||||NPI^NIXONE^BARB^title
ORC|NW|sender order#|||||||collect date & time
SPM|1|specimen ID^description^L||result||normal
SPM|2|specimen ID^description^L||result||normal
DG1|1|IC10|diagnosis code^description
DG1|2|IC10|diagnosis code^description
IN1|1||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
IN1|2||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
GT1|1||last name^first name||street^street^city^state^zip|phone|dob|sex||relation to patient|ssn
OBR|1|sender order#||test code^test name|R||order date & time
OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)
OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)|lab ID^^L
OBR|2|sender order#||test code^test name|R||order date & time
FTS|1|End of File
----
MSH|^~\&|lab|lab name|receiver|Lab Client Code|YYYYMMDDhhmmss||ORU^R01|ctrl ID|P|2.3
PID|1|sender patient ID|lab patient ID||NIXONE^BARB||YYYYMMDD (19400327)|F|||street^street^city^state^zip||phone||||||ssn
PV1|1|C||R||NPI^Dr last name^first name^^^^degree|||||||||||||||||||||||||||||||||Client ID^street^street^city^state^zip
ORC|RE|requisition#|lab accession#||CM||||yyyymmddhhmmss (collected)|||||
OBR|1|requisition#|lab accession#|Test ID^Test Description|R||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||lab ID^lab name^lab address^lab city^lab state^lab zip^l
ab director^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)
OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)
OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)
OBR|2|requisition#|lab accession#|PDF^Results Report|||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||||lab ID^lab name^lab address^lab city^lab state^lab zip^lab di
rector^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)
OBX|1|ED|PDF^PDF BASE64|1|JVBERi0xLjQKJeLjz9MKMSAwIG9iago8PC9UeXBlL1hPYmplY3QvU3VidHlwZS9JbWFnZS9X
FTS|1|End of File
MSH|^~\&|sender|sender system|lab name|Lab Client Code|YYYYMMDDhhmmss||ORM^O01|ctrl ID|P|2.5.1
PID|1|sender patient ID|Lab patient ID||SAN NICHOLS^SONNY BOY||YYYYMMDD (19781114)|M|||street^street^city^state^zip||phone||||||ssn
RXO|medication code^description
RXO|medication code^description
PV1|||||||NPI^SONNY BOY^SAN NICHOLS^title
ORC|NW|sender order#|||||||collect date & time
SPM|1|specimen ID^description^L||result||normal
SPM|2|specimen ID^description^L||result||normal
DG1|1|IC10|diagnosis code^description
DG1|2|IC10|diagnosis code^description
IN1|1||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
IN1|2||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
GT1|1||last name^first name||street^street^city^state^zip|phone|dob|sex||relation to patient|ssn
OBR|1|sender order#||test code^test name|R||order date & time
FTS|1|End of File
----
MSH|^~\&|sender|sender system|lab name|Lab Client Code|YYYYMMDDhhmmss||ORM^O01|ctrl ID|P|2.5.1
PID|1|sender patient ID|Lab patient ID||SAN NICHOLS^SONNY BOY||YYYYMMDD (19781114)|M|||street^street^city^state^zip||phone||||||ssn
RXO|medication code^description
RXO|medication code^description
PV1|||||||NPI^SAN NICHOLS^SONNY BOY^title
ORC|NW|sender order#|||||||collect date & time
SPM|1|specimen ID^description^L||result||normal
SPM|2|specimen ID^description^L||result||normal
DG1|1|IC10|diagnosis code^description
DG1|2|IC10|diagnosis code^description
IN1|1||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
IN1|2||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
GT1|1||last name^first name||street^street^city^state^zip|phone|dob|sex||relation to patient|ssn
OBR|1|sender order#||test code^test name|R||order date & time
OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)
OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)|lab ID^^L
OBR|2|sender order#||test code^test name|R||order date & time
FTS|1|End of File
----
MSH|^~\&|lab|lab name|receiver|Lab Client Code|YYYYMMDDhhmmss||ORU^R01|ctrl ID|P|2.3
PID|1|sender patient ID|lab patient ID||SAN NICHOLS^SONNY BOY||YYYYMMDD (19781114)|M|||street^street^city^state^zip||phone||||||ssn
PV1|1|C||R||NPI^Dr last name^first name^^^^degree|||||||||||||||||||||||||||||||||Client ID^street^street^city^state^zip
ORC|RE|requisition#|lab accession#||CM||||yyyymmddhhmmss (collected)|||||
OBR|1|requisition#|lab accession#|Test ID^Test Description|R||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||lab ID^lab name^lab address^lab city^lab state^lab zip^l
ab director^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)
OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)
OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)
OBR|2|requisition#|lab accession#|PDF^Results Report|||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||||lab ID^lab name^lab address^lab city^lab state^lab zip^lab di
rector^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)
OBX|1|ED|PDF^PDF BASE64|1|JVBERi0xLjQKJeLjz9MKMSAwIG9iago8PC9UeXBlL1hPYmplY3QvU3VidHlwZS9JbWFnZS9X
FTS|1|End of File
MSH|^~\&|sender|sender system|lab name|Lab Client Code|YYYYMMDDhhmmss||ORM^O01|ctrl ID|P|2.5.1
PID|1|sender patient ID|Lab patient ID||KOSTUN^VALENTINA||YYYYMMDD (19560422)|F|||street^street^city^state^zip||phone||||||ssn
RXO|medication code^description
RXO|medication code^description
PV1|||||||NPI^VALENTINA^KOSTUN^title
ORC|NW|sender order#|||||||collect date & time
SPM|1|specimen ID^description^L||result||normal
SPM|2|specimen ID^description^L||result||normal
DG1|1|IC10|diagnosis code^description
DG1|2|IC10|diagnosis code^description
IN1|1||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
IN1|2||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
GT1|1||last name^first name||street^street^city^state^zip|phone|dob|sex||relation to patient|ssn
OBR|1|sender order#||test code^test name|R||order date & time
FTS|1|End of File
----
MSH|^~\&|sender|sender system|lab name|Lab Client Code|YYYYMMDDhhmmss||ORM^O01|ctrl ID|P|2.5.1
PID|1|sender patient ID|Lab patient ID||KOSTUN^VALENTINA||YYYYMMDD (19560422)|F|||street^street^city^state^zip||phone||||||ssn
RXO|medication code^description
RXO|medication code^description
PV1|||||||NPI^KOSTUN^VALENTINA^title
ORC|NW|sender order#|||||||collect date & time
SPM|1|specimen ID^description^L||result||normal
SPM|2|specimen ID^description^L||result||normal
DG1|1|IC10|diagnosis code^description
DG1|2|IC10|diagnosis code^description
IN1|1||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
IN1|2||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
GT1|1||last name^first name||street^street^city^state^zip|phone|dob|sex||relation to patient|ssn
OBR|1|sender order#||test code^test name|R||order date & time
OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)
OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)|lab ID^^L
OBR|2|sender order#||test code^test name|R||order date & time
FTS|1|End of File
----
MSH|^~\&|lab|lab name|receiver|Lab Client Code|YYYYMMDDhhmmss||ORU^R01|ctrl ID|P|2.3
PID|1|sender patient ID|lab patient ID||KOSTUN^VALENTINA||YYYYMMDD (19560422)|F|||street^street^city^state^zip||phone||||||ssn
PV1|1|C||R||NPI^Dr last name^first name^^^^degree|||||||||||||||||||||||||||||||||Client ID^street^street^city^state^zip
ORC|RE|requisition#|lab accession#||CM||||yyyymmddhhmmss (collected)|||||
OBR|1|requisition#|lab accession#|Test ID^Test Description|R||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||lab ID^lab name^lab address^lab city^lab state^lab zip^l
ab director^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)
OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)
OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)
OBR|2|requisition#|lab accession#|PDF^Results Report|||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||||lab ID^lab name^lab address^lab city^lab state^lab zip^lab di
rector^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)
OBX|1|ED|PDF^PDF BASE64|1|JVBERi0xLjQKJeLjz9MKMSAwIG9iago8PC9UeXBlL1hPYmplY3QvU3VidHlwZS9JbWFnZS9X
FTS|1|End of File
MSH|^~\&|sender|sender system|lab name|Lab Client Code|YYYYMMDDhhmmss||ORM^O01|ctrl ID|P|2.5.1
PID|1|sender patient ID|Lab patient ID||KOPOSHLOVITS^MIRIAM||YYYYMMDD (19551121)|F|||street^street^city^state^zip||phone||||||ssn
RXO|medication code^description
RXO|medication code^description
PV1|||||||NPI^MIRIAM^KOPOSHLOVITS^title
ORC|NW|sender order#|||||||collect date & time
SPM|1|specimen ID^description^L||result||normal
SPM|2|specimen ID^description^L||result||normal
DG1|1|IC10|diagnosis code^description
DG1|2|IC10|diagnosis code^description
IN1|1||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
IN1|2||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
GT1|1||last name^first name||street^street^city^state^zip|phone|dob|sex||relation to patient|ssn
OBR|1|sender order#||test code^test name|R||order date & time
FTS|1|End of File
----
MSH|^~\&|sender|sender system|lab name|Lab Client Code|YYYYMMDDhhmmss||ORM^O01|ctrl ID|P|2.5.1
PID|1|sender patient ID|Lab patient ID||KOPOSHLOVITS^MIRIAM||YYYYMMDD (19551121)|F|||street^street^city^state^zip||phone||||||ssn
RXO|medication code^description
RXO|medication code^description
PV1|||||||NPI^KOPOSHLOVITS^MIRIAM^title
ORC|NW|sender order#|||||||collect date & time
SPM|1|specimen ID^description^L||result||normal
SPM|2|specimen ID^description^L||result||normal
DG1|1|IC10|diagnosis code^description
DG1|2|IC10|diagnosis code^description
IN1|1||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
IN1|2||insurance ID|insurance company name|street^street^city^state^zip||||||||||||relation to patient|||||||||||||||||||policy
GT1|1||last name^first name||street^street^city^state^zip|phone|dob|sex||relation to patient|ssn
OBR|1|sender order#||test code^test name|R||order date & time
OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)
OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)|lab ID^^L
OBR|2|sender order#||test code^test name|R||order date & time
FTS|1|End of File
----
MSH|^~\&|lab|lab name|receiver|Lab Client Code|YYYYMMDDhhmmss||ORU^R01|ctrl ID|P|2.3
PID|1|sender patient ID|lab patient ID||KOPOSHLOVITS^MIRIAM||YYYYMMDD (19551121)|F|||street^street^city^state^zip||phone||||||ssn
PV1|1|C||R||NPI^Dr last name^first name^^^^degree|||||||||||||||||||||||||||||||||Client ID^street^street^city^state^zip
ORC|RE|requisition#|lab accession#||CM||||yyyymmddhhmmss (collected)|||||
OBR|1|requisition#|lab accession#|Test ID^Test Description|R||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||lab ID^lab name^lab address^lab city^lab state^lab zip^l
ab director^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)
OBX|1|NM|lab test id^test description^L||result||normal range/cutoff|flag(H=high, L=Low, A=abnormal)|||status(F=final, P=pending)|||yyyymmddhhmmss (reported)
OBX|2|NM|lab test id^test description^L||result||normal range/cutoff|flag|||status|||yyyymmddhhmmss (reported)
OBR|2|requisition#|lab accession#|PDF^Results Report|||yyyymmddhhmmss (collected)|||||||yyyymmddhhmmss (received)|||||||||lab ID^lab name^lab address^lab city^lab state^lab zip^lab di
rector^|yyyymmddhhmmss (reported)|||status(F=final, P=pending)
OBX|1|ED|PDF^PDF BASE64|1|JVBERi0xLjQKJeLjz9MKMSAwIG9iago8PC9UeXBlL1hPYmplY3QvU3VidHlwZS9JbWFnZS9X
FTS|1|End of File

```
