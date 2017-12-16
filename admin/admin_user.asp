<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
sql="select gogo_name from gogo_admin where id=1"
rs.open sql,conn,1,1

%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理员帐号密码</title>
</head>

<body bgcolor="#CAD7F7">

<form method="POST" action="updata_user.asp">
	<div align="center">
		　<p>　</p>
		<p>　</p>
		<table border="0" width="368" cellspacing="0" cellpadding="4" bgcolor="#F1F3F5" style="border: 1px solid #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
			<tr>
				<td height="25" background="images/admin_bg_1.gif" width="358" colspan="2">
				<p align="center"><b><font size="2" color="#FFFFFF">管理员帐号密码</font></b></td>
			</tr>
			<tr>
				<td style="border-left-width: 1px; border-right-width: 1px; border-top: 1px dotted #C0C0C0; border-bottom: 1px dotted #C0C0C0" width="64" align="center">
				<font size="2">帐号：</font></td>
				<td style="border-left-width: 1px; border-right-width: 1px; border-top: 1px dotted #C0C0C0; border-bottom: 1px dotted #C0C0C0" width="286">
				<input type="text" name="name" size="20" value="<%=rs("gogo_name")%>"></td>
			</tr>
			<tr>
				<td style="border-left-width: 1px; border-right-width: 1px; border-top: 1px dotted #C0C0C0; border-bottom: 1px dotted #C0C0C0" width="64" align="center">
				<font size="2">密码：</font></td>
				<td style="border-left-width: 1px; border-right-width: 1px; border-top: 1px dotted #C0C0C0; border-bottom: 1px dotted #C0C0C0" width="286">
				<input type="text" name="psw" size="20"><font size="2" color="#FF0000">若不修改请勿填写</font></td>
			</tr>
		</table>
		<p><input type="submit" value="修改" name="B1"></div>
</form>
<%
rs.close
set rs=nothing
%>
</body>

</html>