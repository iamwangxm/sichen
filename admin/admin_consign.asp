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
<title>建站咨讯管理</title>
<base target="_self">
</head>

<body bgcolor="#CAD7F7" vlink="#000000">

<table border="0" width="100%" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="209">
	<tr>
		<td background="images/admin_bg_1.gif" height="25" width="709" colspan="5">
		<p align="center"><font size="2" color="#FFFFFF"><b>委过招聘管理</b></font></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="26" align="center" width="430">
					<p align="left"><b><a href="admin_add_consign.asp">添加职位</a></b> <a href="admin_add_consign_nolog.asp" target="_blank">. </a></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="67">
					　</td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="60">
					　</td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="60">
					　</td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="60">
					　</td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="100%" align="center" width="709" colspan="5">
<%
sql="select id,company,url,jtzw,addtime from consign order by id desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
           response.write "暂无委托招聘！"
           else
rs.pagesize=20
if request("action")="n" then
session("page")=session("page")+1
else
if request("action")="p" then
session("page")=session("page")-1
else
if request("action")="f" then
session("page")=1
else
if request("action")="l" then
session("page")=rs.pagecount
else
if isnumeric(request("page1"))=true then
session("page")=clng(request("page1"))
else
session("page")=1
end if
end if
end if
end if
end if
if session("page")>rs.pagecount then session("page")=rs.pagecount
if session("page")<1 then session("page")=1
%>

					<table border="0" width="650" cellspacing="0" cellpadding="0" height="25">
						<tr>
							<td width="104">
							共有职位<font color="#FF0000"><%=rs.recordcount%></font>个</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_consign.asp?action=f">
							首页</a>&nbsp;&nbsp;
							<a href="admin_consign.asp?action=p">上一页</a>&nbsp;&nbsp;
							<a href="admin_consign.asp?action=n">下一页</a>&nbsp;&nbsp;
							<a href="admin_consign.asp?action=l">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_consign.asp">
		<p align="center">跳转到 
		<input type="text" name="page1" size="5" style="border: 1px solid #000000"> 
		页&nbsp; 
	<input type="submit" value="提交" name="B1"></p>
</form>
</td>
						</tr>
					</table>
					</td>
	</tr>
	<tr>
		<td height="100%" valign="top" width="709" colspan="5">
		
		<table border="0" width="100%" cellspacing="0" cellpadding="0" height="24">
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="65" height="25" bgcolor="#E5E5E5">
				<p align="center"><b>编号</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="262" height="25" bgcolor="#FFFFFF">
				<p align="center"><b>招聘职位</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="209" height="25" bgcolor="#E5E5E5">
				<p align="center"><b>招聘公司</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="129" height="25" bgcolor="#FFFFFF">
				<p align="center"><b>添加时间</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="107" align="center" height="25" colspan="3" bgcolor="#E5E5E5">
				<b>操作</b></td>
			</tr>
<%
rs.absolutepage=session("page")
for ii=1 to rs.pagesize
%>	
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="65" bgcolor="#E5E5E5" height="25">
				<p align="center">　<%=rs("id")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="262" height="25">
				　<a target="_blank" href="../show_consign.asp?id=<%=rs("id")%>"><%=rs("jtzw")%></a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="209" height="25" bgcolor="#E5E5E5">
				<p align="center"><a target="_blank" href="<%=rs("url")%>">
				<%=rs("company")%></a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="129" height="25">
				<p align="center"><%=rs("addtime")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="28" align="center" height="25" bgcolor="#E5E5E5">
				<a target="_blank" href="../show_consign.asp?id=<%=rs("id")%>">
				查看</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="35" align="center" height="25" bgcolor="#E5E5E5">
				<a href="admin_up_consign.asp?id=<%=rs("id")%>">修改</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="28" align="center" height="25" bgcolor="#E5E5E5">
				<a onClick="{if(confirm('警告：此操作将删除委托招聘〈<%=rs("jtzw")%>〉！继续吗？')){return true;}return false;}" href="del_consign.asp?id=<%=rs("id")%>"><span style="text-decoration: none">删除</a></td>
			</tr>
		<%
rs.movenext
if rs.eof then exit for
next
%>

		</table>

		</td>
	</tr>
	<tr>
		<td height="100%" align="center" width="709" colspan="5">
					<table border="0" width="650" cellspacing="0" cellpadding="0" height="25">
						<tr>
							<td width="104">
							共有文章<font color="#FF0000"><%=rs.recordcount%></font>篇</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_consign.asp?action=f">
							首页</a>&nbsp;&nbsp;
							<a href="admin_consign.asp?action=p">上一页</a>&nbsp;&nbsp;
							<a href="admin_consign.asp?action=n">下一页</a>&nbsp;&nbsp;
							<a href="admin_consign.asp?action=l">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_consign.asp">
		<p align="center">跳转到 
		<input type="text" name="page1" size="5" style="border: 1px solid #000000"> 
		页&nbsp; 
	<input type="submit" value="提交" name="B2"></p>
</form>
</td>
						</tr>
					</table>

		</td>
	</tr>
</table>
<%

rs.close
			set rs=nothing
			set conn=nothing
end if
%>

</body>

</html>