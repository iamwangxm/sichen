<%
set conn=server.createobject("adodb.connection")
DBPath = Server.MapPath("count.mdb")
conn.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & DBPath
%>