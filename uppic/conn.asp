<% '数据库连接页
dim connstr
dim conn,conn2
connstr="DBQ="+server.mappath("image.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"       
set conn=server.createobject("ADODB.CONNECTION")
conn.open connstr
set rs2=server.createobject("adodb.recordset")
conn2 = "DBQ="&server.mappath("image.mdb")&";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
%>
