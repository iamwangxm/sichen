<!--#include file="conn.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您不具备此权限！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
sql="DELETE FROM imgdata WHERE num="&clng(request("id"))
conn.execute(sql)
set rs2=nothing
set conn2=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('删除成功,即将返回！');"&"window.location.href = '../en_uppic.asp'"&" </script>"

%>