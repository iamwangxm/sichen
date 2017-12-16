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
<title>网站分类管理</title>
<base target="_self">
</head>

<body bgcolor="#CAD7F7" vlink="#000000">

<table border="0" width="73%" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="238">
	<tr>
		<td background="images/admin_bg_1.gif" height="25">
		<p align="center"><font size="2" color="#FFFFFF"><b>网站留言管理</b></font></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="26" align="center">
					<%
sql="select * from guest order by id desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
           response.write "暂无留言！"&"<td><tr>"
           else
rs.pagesize=6
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
							共有留言<font color="#FF0000"><%=rs.recordcount%></font>条</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_guest.asp?action=f">    
							首页</a>&nbsp;&nbsp;    
							<a href="admin_guest.asp?action=p">上一页</a>&nbsp;&nbsp;    
							<a href="admin_guest.asp?action=n">下一页</a>&nbsp;&nbsp;    
							<a href="admin_guest.asp?action=l">尾页</a> &gt;</td>    
							<td width="186">
							<form method="POST" action="admin_guest.asp">
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
		<td height="145" valign="top">
		<%
rs.absolutepage=session("page")
for ii=1 to rs.pagesize
%>	

		<table border="0" width="767" cellspacing="0" cellpadding="0" height="106" style="border: 1px solid #000000">
			<tr>
				<td width="43" bgcolor="#CAD7F7" height="30">
				<p align="center"><b>主题:</b></td>
				<td width="57" bgcolor="#CAD7F7" height="30"><% =unHtml(rs("title")) %></td>
				<td width="46" bgcolor="#CAD7F7" height="30">
				<p align="center"><b>时间:</b></td>
				<td width="100" bgcolor="#CAD7F7" height="30"><%=rs("addtime")%></td>
				<td width="43" bgcolor="#CAD7F7" height="30">
                  <p align="center"><b>QQ:</b></td>
				<td width="64" bgcolor="#CAD7F7" height="30"><%=rs("qq")%></td>
				<td width="73" bgcolor="#CAD7F7" height="30">
                  <p align="center"><b>email:</b></td>
				<td width="88" bgcolor="#CAD7F7" height="30"><%=rs("email")%></td>
				<td width="57" bgcolor="#CAD7F7" height="30">
                  <p align="center"><b>主页：</b></td>
				<td width="64" bgcolor="#CAD7F7" height="30"><a target="_blank" href="<%=rs("homepage")%>"><%=rs("homepage")%></a></td>
				<td width="84" bgcolor="#CAD7F7" height="30">
				<p align="center"><a href="admin_up_guest.asp?id=<%=rs("id")%>">显示/回复</a></td>
				<td width="35" bgcolor="#CAD7F7" height="30">
				<p align="center"><a onClick="{if(confirm('警告：此操作将删除留言〈<% =unHtml(rs("title")) %>〉的所有信息！继续吗？')){return true;}return false;}" href="del_guest.asp?id=<%=rs("id")%>">删除</a></td>
			</tr>
			<tr>
				<td width="43" align="center" bgcolor="#F1F3F5" height="40" valign="top"><b>内容:</b></td>
				<td width="722" colspan="11" bgcolor="#F1F3F5" height="40"><%if rs("show")=true then%>
												<% =unHtml(rs("content")) %>
												<%else%>
												 <font color=#ff0000> 此留言在审核中.....</font>
												  <%end if %><p>　</td>
			</tr>
			<tr>
				<td width="43" bgcolor="#FDFDDF" height="29" align="center" valign="top"><b>
				回复:</b></td>
				<td width="722" colspan="11" bgcolor="#FDFDDF" height="29">　<%
										if rs("reply")<>"" then response.write "<font color='#BB0000'>"&unHtml(rs("reply"))&"</font>"
										%>
</td>
			</tr>
		</table>
				<p>　</p>
				<%
rs.movenext
if rs.eof then exit for
next
%>

		</td>
	</tr>
	<tr>
		<td height="32" align="center">
					<table border="0" width="650" cellspacing="0" cellpadding="0" height="25">
						<tr>
							<td width="104">
							共有留言<font color="#FF0000"><%=rs.recordcount%></font>条</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_guest.asp?action=f">    
							首页</a>&nbsp;&nbsp;    
							<a href="admin_guest.asp?action=p">上一页</a>&nbsp;&nbsp;    
							<a href="admin_guest.asp?action=n">下一页</a>&nbsp;&nbsp;    
							<a href="admin_guest.asp?action=l">尾页</a> &gt;</td>    
							<td width="186">
							<form method="POST" action="admin_guest.asp">
		<p align="center">跳转到 
		<input type="text" name="page2" size="5" style="border: 1px solid #000000"> 
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