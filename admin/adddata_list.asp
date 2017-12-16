<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您未登陆或帐号密码错误,请重登陆！');" & "history.back()" & "</script>" 
response.end
end if
if trim(request("what"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('项目不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
sql="select id from "&request("how")&"list where "&request("how")&"class='"&request("what")&"'"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('此项目已经！');" & "history.back()" & "</script>" 
Response.End
else
rs.close
sql="insert into "&request("how")&"list("&request("how")&"class) values('"&request("what")&"')"
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('项目添加成功！');"&"window.location.href = 'admin_list.asp'"&" </script>"
end if
%>
