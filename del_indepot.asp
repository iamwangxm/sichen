<!--#include file="conn.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½��');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
sql="DELETE FROM indepot WHERE id="&clng(request("id"))&"and inid="&clng(Request.Cookies("id"))
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('ɾ���ɹ�,�������أ�');"&"window.location.href = 'control.asp?file=indepot.asp&page="&request("page")&"'"&" </script>"

%>
