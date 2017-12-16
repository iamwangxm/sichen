<!--#include file="../conn.asp"-->
<!--#include file="../unhtml.asp"-->
<!--#include file="../ubb.asp"-->

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
<title>文章管理</title>
<base target="_self">
</head>

<body bgcolor="#CAD7F7" vlink="#000000">

<table border="0" width="100%" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="209">
	<tr>
		<td background="images/admin_bg_1.gif" height="25" width="709" colspan="5">
		<p align="center"><font size="2" color="#FFFFFF"><b>站内文章管理</b></font></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="26" align="center" width="430">
					<p align="left"><b><a href="admin_add_article.asp">添加文章</a></b></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="67">
					<b>分类显示：</b></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="60">
					<a href="admin_article.asp?class=1">家教新闻</a></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="60">
					<a href="admin_article.asp?class=2">经验技巧</a></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="60">
					<a href="admin_article.asp">混合显示</a></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="100%" align="center" width="709" colspan="5">
					<%
if request("class")="1" then
sql="select * from article where class=1 order by id desc"
else
if request("class")="2" then
sql="select * from article where class=2 order by id desc"
else
sql="select * from article order by id desc"
end if
end if
rs.open sql,conn,1,1
if rs.recordcount=0 then
           response.write "暂无文章！"
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
							共有文章<font color="#FF0000"><%=rs.recordcount%></font>篇</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_article.asp?action=f&class=<%=request("class")%>">
							首页</a>&nbsp;&nbsp;
							<a href="admin_article.asp?action=p&class=<%=request("class")%>">上一页</a>&nbsp;&nbsp;
							<a href="admin_article.asp?action=n&class=<%=request("class")%>">下一页</a>&nbsp;&nbsp;
							<a href="admin_article.asp?action=l&class=<%=request("class")%>">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_article.asp?class=<%=request("class")%>">
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
		
		<table border="0" width="709" cellspacing="0" cellpadding="0" height="24">
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="65" height="25" bgcolor="#E5E5E5">
				<p align="center"><b>编号</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="262" height="25" bgcolor="#FFFFFF">
				<p align="center"><b>标题</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="85" height="25" bgcolor="#E5E5E5">
				<p align="center"><b>类别</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="160" height="25" bgcolor="#FFFFFF">
				<p align="center"><b>添加时间</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="90" align="center" height="25" colspan="3" bgcolor="#E5E5E5">
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
				　<a target="_blank" href="../show_article.asp?id=<%=rs("id")%>"><%=unhtml(rs("title"))%></a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="85" height="25" bgcolor="#E5E5E5">
				<p align="center"><%
				if rs("class")=1 then response.write "家教新闻"
				if rs("class")=2 then response.write "经验技巧"

				%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="160" height="25">
				<p align="center">　<%=rs("addtime")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="30" align="center" height="25" bgcolor="#E5E5E5">
				<a target="_blank" href="../show_article.asp?id=<%=rs("id")%>">
				查看</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="30" align="center" height="25" bgcolor="#E5E5E5">
				<a href="admin_up_article.asp?id=<%=rs("id")%>">修改</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="30" align="center" height="25" bgcolor="#E5E5E5">
				<a onClick="{if(confirm('警告：此操作将删除文章〈<%=rs("title")%>〉！继续吗？')){return true;}return false;}" href="del_article.asp?id=<%=rs("id")%>"><span style="text-decoration: none">删除</a></td>
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
							<p align="center">&lt; <a href="admin_article.asp?action=f&class=<%=request("class")%>">
							首页</a>&nbsp;&nbsp;
							<a href="admin_article.asp?action=p&class=<%=request("class")%>">上一页</a>&nbsp;&nbsp;
							<a href="admin_article.asp?action=n&class=<%=request("class")%>">下一页</a>&nbsp;&nbsp;
							<a href="admin_article.asp?action=l&class=<%=request("class")%>">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_article.asp?class=<%=request("class")%>">
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