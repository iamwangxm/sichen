<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
sql="select * from "&request("how")&"list where id="&clng(request("id"))
rs.open sql,conn,1,1
if request("how")="job" then what=rs("jobclass")
if request("how")="area" then what=rs("areaclass")
if request("how")="zhy" then what=rs("zhyclass")
if request("how")="company" then what=rs("companyclass")
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>网站信息项目修改</title>
</head>
<body>
<div align="center">
	<table border="0" width="249" cellspacing="0" cellpadding="0" height="109" id="table1">
		<tr>
			<td valign="top" height="109">
				<table border="0" width="258" cellspacing="0" cellpadding="0" id="table2">
					<form method="POST" action="updata_list.asp?id=<%=rs("id")%>&how=<%=request("how")%>">
					<tr>
						<td height="30" background="images/jobbg1.gif" style="border: 1px solid #C0C0C0" width="256" colspan="2">
						<p align="center"><font color="#0000FF"><b>网站信息项目修改</b></font></td>
					</tr>
					<tr>
						<td height="30" width="86" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" align="center">
						<b>项目内容：</b></td>
						<td height="30" width="169" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2">
						&nbsp;<input name="what" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=what%>"></td>
					</tr>
					<tr>
						<td height="30" width="256" colspan="2" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2">
						<p align="center">
						<input type="submit" value="修改" name="B1"></td>
					</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
<%
rs.close
set rs=nothing
set conn=nothing
%>