<!--#include file="conn.asp"-->
<%
go=trim(request.querystring("go"))
user_name=trim(request.form("user_name"))
pass_word=cstr(Request.form("pass_word"))

if go="go" then
if user_name=""&username&"" and pass_word=""&password&"" then
   session("FJfkda32KL")="fda232LKfd"
   response.redirect "admin.asp"
else
   response.write"<SCRIPT language=JavaScript>alert('密码错误');javascript:history.go(-1);</SCRIPT>"
end if
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="Job 528招聘求职网=免费在线求职、免费招聘、企业招聘、人才市场、工作就业信息-杰博528免费人才招聘网">
<meta name="description" content="Job 528招聘求职网=免费在线求职、免费招聘、企业招聘、人才市场、工作就业信息-杰博528免费人才招聘网">
<style>
<!--
td           { font-size: 12px; font-family: 宋体 }
input        { border: 1px solid #000080 }
-->
</style>
<script language="javascript">
<!--
if (top.location !== self.location) {
top.location=self.location;
}
-->
</script>
<title>Job 528招聘求职网=免费在线求职、免费招聘、企业招聘、人才市场、工作就业信息-杰博528免费人才招聘网</title></head>

<body topMargin=10>
 <table width='729' border='0' align='center' cellpadding='0' cellspacing='0'>
<tr><td height='20' colspan='2' valign='middle' style='font-size:12px;color:#000000;background:#72BEFE;BORDER-RIGHT:#aaaaaa 1px solid;padding-top:3px;'>当前位置：首页 >> 友情链接</td></tr>
</table>

<table width='729' border='0' align='center' cellpadding='0' cellspacing='0'>
<tr><td height='10' colspan='2'></td></tr>
</table>



<div align="center">
<form method="POST" action="?go=go">
<table border="1" width="300" cellspacing="0" cellpadding="5" style="border-collapse: collapse">
	<tr>
		<td colspan="2" align="center">友情链接后台管理登陆</td>
	</tr>
	<tr>
		<td align="center">帐号：</td>
		<td>&nbsp;<input type="text" name="user_name" size="20"></td>
	</tr>
	<tr>
		<td align="center">密码：</td>
		<td>&nbsp;<input type="password" name="pass_word" size="20"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><p>
		<INPUT style="BORDER-RIGHT: #D399FF 2px solid; BORDER-TOP: #ffffff 2px solid; FONT-SIZE: 14px; BACKGROUND: #D3EDFF; BORDER-LEFT: #ffffff 2px solid; WIDTH: 80px; BORDER-BOTTOM: #D399FF 2px solid; HEIGHT: 22px" type="submit" value="登 录" name="submit"></p></td>
	</tr>
</table>
</form>
</div>
</body>

</html>