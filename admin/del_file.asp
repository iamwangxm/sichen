<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
sql="DELETE FROM files WHERE address='"&request("file")&"'"
conn.execute(sql)
set rs=nothing
set conn=nothing
set objfso=server.createobject("scripting.filesystemobject")
file=server.mappath(".\")+"\"+request("file")
objfso.deletefile file
set objfso=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('删除成功,即将返回！');"&"window.location.href = 'admin_upfiles.asp'"&" </script>"
%>