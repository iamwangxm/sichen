<!--#include file="conn.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
sql="DELETE FROM message WHERE id="&clng(request("id"))&"and tid="&clng(Request.Cookies("id"))&" and ttype='"&Request.Cookies("user")&"'"
conn.execute(sql)
set rs=nothing
set conn=nothing
Response.Cookies("newinfo")=""
response.write "<script language=JavaScript>" & chr(13) & "alert('信息已删除！');" & "window.close()" & "</script>" 

%>
