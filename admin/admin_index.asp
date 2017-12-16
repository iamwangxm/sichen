<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>网站分类管理</title>
<base target="_self">
</head>

<body bgcolor="#CAD7F7" vlink="#000000">

<table border="0" width="398" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="528">
	<tr>
		<td background="images/admin_bg_1.gif" height="24" colspan="2">
	  <p align="center"><font size="2" color="#FFFFFF"><b>网 站 管 理 首 页</b></font></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="504" align="center" valign="top" width="278" style="border-left-width: 1px; border-right: 1px solid #000000; border-top-width: 1px; border-bottom-width: 1px">
					<div align="center">
						<table border="1" width="90%" cellspacing="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#C0C0C0" id="table1">
							<tr>
								<td height="25" colspan="2" bgcolor="#C0C0C0">
								<p align="center"><b>网站数据统计</b></td>
							</tr>
							<tr>
								<td width="48%" height="25" align="center">
								今日新增学员：</td>
								<%
								sql="select id from in_user where datediff('d',rdate,Now())=0"
								rs.open sql,conn,1,1
								%>
								<td height="25" width="49%" align="center"><%=rs.recordcount%></td>
							</tr>
							<tr>
								<td width="48%" height="25" align="center">
								今日新增教员：</td>
								<%
								rs.close
								sql="select id from en_user where datediff('d',rdate,Now())=0"
								rs.open sql,conn,1,1
								%>
								<td height="25" width="49%" align="center"><%=rs.recordcount%></td>
							</tr>
							<tr>
								<td width="48%" height="25" align="center">
								学员用户数量：</td>
								<%
								rs.close
								sql="select id from in_user"
								rs.open sql,conn,1,1
								%>
								<td height="25" width="49%" align="center"><%=rs.recordcount%></td>
							</tr>
							<tr>
								<td width="48%" height="25" align="center">
								教员用户数量：</td>
								<%
								rs.close
								sql="select id from en_user"
								rs.open sql,conn,1,1
								%>
								<td height="25" width="49%" align="center"><%=rs.recordcount%></td>
							</tr>
							<tr>
								<td width="48%" height="25" align="center">
								教员库数据量：</td>
								<%
								rs.close
								sql="select id from indepot"
								rs.open sql,conn,1,1
								%>
								<td height="25" width="49%" align="center"><%=rs.recordcount%></td>
							</tr>
							<tr>
								<td width="48%" height="25" align="center">
								学员库数据量：</td>
								<%
								rs.close
								sql="select id from endepot"
								rs.open sql,conn,1,1
								%>
								<td height="25" width="49%" align="center"><%=rs.recordcount%></td>
							</tr>
							<tr>
								<td width="48%" height="25" align="center">
								站内短信数量：</td>
								<%
								rs.close
								sql="select id from message"
								rs.open sql,conn,1,1
								%>
								<td height="25" width="49%" align="center"><%=rs.recordcount%></td>
							</tr>
							<tr>
								<td width="48%" height="25" align="center">
								站内文章数量：</td>
								<%
								rs.close
								sql="select id from article"
								rs.open sql,conn,1,1
								%>
								<td height="25" width="49%" align="center"><%=rs.recordcount%></td>
							</tr>
						</table>
					</div>
		　<p align="left"><b>提示：</b><p align="left">为保证数据的完整性，建议不要手动操作数据库。<p align="left">
					<b>技术支持：</b>
		<p align="left">QQ：1647706725
		<p align="left">电子邮件：1647706725@qq.com
	  </td>
	  <td bgcolor="#F1F3F5" height="504" align="center" valign="top" width="102">&nbsp;</td>
	</tr>
</table>

</body>
</html>
<%
rs.close
set rs=nothing
set conn=nothing
%>