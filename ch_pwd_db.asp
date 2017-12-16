<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
if request("pwd1")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('密码没有填写！');" & "history.back()" & "</script>" 
Response.End
end if
if request("pwd1")<>request("pwd2") then
response.write "<script language=JavaScript>" & chr(13) & "alert('两次密码输入不正确！');" & "history.back()" & "</script>" 
Response.End
end if
pwd=request("pwd1")
if Request.Cookies("user")="1" then
sql1="select pwd from in_user where id="&clng(Request.Cookies("id"))
sql2="update in_user set pwd='"&md5(pwd)&"' where id="&clng(Request.Cookies("id"))
end if
if Request.Cookies("user")="2" then
sql1="select pwd from en_user where id="&clng(Request.Cookies("id"))
sql2="update en_user set pwd='"&md5(pwd)&"' where id="&clng(Request.Cookies("id"))
end if
rs.open sql1,conn,1,1
if rs("pwd")<>md5(request("ypwd")) then
response.write "<script language=JavaScript>" & chr(13) & "alert('原密码错误！');" & "history.back()" & "</script>" 
rs.close
set rs=nothing
set conn=nothing
Response.End
else
rs.close
conn.execute(sql2)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('密码修改成功！');"&"window.location.href = 'control.asp'"&" </script>"
end if
%>