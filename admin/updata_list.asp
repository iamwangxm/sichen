<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
if trim(request("what"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('项目不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
sql="update "&request("how")&"list set "&request("how")&"class='"&request("what")&"' where id="&clng(request("id"))
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('修改成功，请刷新后查看结果！');" & "window.close()" & "</script>" 
%>
