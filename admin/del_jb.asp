<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
%>

<%
dim id ,rs
id=request("id")
sql="DELETE FROM jb WHERE id="&clng(request("id"))
conn.execute(sql)
set rs=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('删除成功,即将返回！');"&"window.location.href = 'jb_list.asp'"&" </script>"
 
%>