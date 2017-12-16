<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
sql="update link set ok=true where id="&clng(request("id"))
conn.execute(sql)
response.write "<script language=JavaScript>" & chr(13) & "alert('操作成功，即将返回！');" & "history.back()" & "</script>" 
set rs=nothing
%>
