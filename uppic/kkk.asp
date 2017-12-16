<!--#include file="conn.asp"--> 
<% 'ÏÔÊ¾ÏàÆ¬Ò³
dim rs
dim adr
dim sql

dim id 
id = request("id")


set rs=server.CreateObject("adodb.recordset")
sql="SELECT * FROM imgdata WHERE num ="&id
rs.Open sql,conn,3,1

response.contenttype="image/*"
Response.BinaryWrite rs("imagedata")
rs.Close
conn.close

%>