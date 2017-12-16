<%
Provider = "Provider=Microsoft.Jet.OLEDB.4.0;"
Path = "Data Source=" & Server.MapPath("count.mdb")
Set conn= Server.CreateObject("ADODB.Connection")
p1=Provider&Path
conn.Open P1
%>
