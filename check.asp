<%
set rs8=server.createobject("adodb.recordset")
set rs9=server.createobject("adodb.recordset")
sql8="select * from en_user order by id asc "
rs8.open sql8,conn,1,1
if rs8.recordcount>100 then 
if date()-rs8("rdate")>30 then
sql9="DELETE FROM en_user WHERE id="&rs8("id")
conn.execute(sql9)
set rs19=nothing
end if 
end if
set rs8=nothing

set rs8=server.createobject("adodb.recordset")
set rs9=server.createobject("adodb.recordset")
sql8="select * from in_user order by id asc "
rs8.open sql8,conn,1,1
if rs8.recordcount>100 then 
if date()-rs8("rdate")>100 then
sql9="DELETE FROM in_user WHERE id="&rs8("id")
conn.execute(sql9)
set rs19=nothing
end if 
end if
set rs8=nothing

%>