<!--#include file="info.asp"-->
<!--#include file="../conn.asp"-->
<!--#include file="md5.asp"-->
<%
if Request.Cookies("login")<>"yes"  then
call codeistrue("")
psw=md5(request("adminpsw"))
sql="select * from gogo_admin where gogo_name='"&request("adminname")&"'"
rs.open sql,conn,1,1
if rs.eof then
response.write "<script language=JavaScript>" & chr(13) & "alert('您未登陆或帐号密码错误,请重登陆！');" & "history.back()" & "</script>" 
rs.close
response.end
else
if psw<>rs("gogo_pwd") then
response.write "<script language=JavaScript>" & chr(13) & "alert('您未登陆或帐号密码错误,请重登陆！');" & "history.back()" & "</script>" 
rs.close
response.end
end if
session("login")="yes"
session("FJfkda32KL")="fda232LKfd"
Response.Cookies("login_pic")="ok"
Response.Cookies("login_pic").expires=(now+1/24) '保存1小时
Response.Cookies("login")="yes"
Response.Cookies("login").expires=(now+1/24) '保存1小时
Response.Cookies("8686gg3xz")="780abcd#ddSD8766"
Response.Cookies("8686gg3xz").expires=(now+1/24) '保存1小时
end if
end if
set rs=nothing
set conn=nothing
%>
<html>
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<title>管理中心</title>
</head>

<frameset framespacing="0" border="0" frameborder="0" cols="170,*">
	<frame name="contents" target="main" src="admin1.asp" scrolling="auto" noresize>
	<frame name="main" src="admin_index.asp" scrolling="auto" noresize target="_self">
	<noframes>
	<body>

	<p>此网页使用了框架，但您的浏览器不支持框架。</p>

	</body>
	</noframes>
</frameset>

</html>
