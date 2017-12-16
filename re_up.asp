<!--#include FILE="conn.asp"-->

<%
if session("id")="" or session("ac")="" or session("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您不具备此权限！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
sql="select pic from in_user where id="&clng(session("id"))
rs.open sql,conn,1,1
file1=rs("pic")
rs.close
sql="update in_user set pic='' where id="&clng(session("id"))
conn.execute(sql)

set rs=nothing
set conn=nothing
set objfso=server.createobject("scripting.filesystemobject")
file=server.mappath(".\")+"\"+file1
objfso.deletefile file
set objfso=nothing
response.redirect "in_uppic.asp"
%>
