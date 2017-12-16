<!--#include file="../conn.asp"-->
<!--#include file="../unhtml.asp"-->
<!--#include file="../ubb.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
%>
<script language="javascript">
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>教员用户管理</title>
<base target="_self"></head>

<body bgcolor="#CAD7F7" vlink="#000000">

<table border="0" width="100%" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="229">
	<tr>
		<td background="images/admin_bg_1.gif" height="25" colspan="6">
		<p align="center"><font size="2" color="#FFFFFF"><b>教员用户管理</b></font></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="26" align="center" width="457">
					<form method="POST" action="admin_search_enuser.asp">
						<p align="left">教员用户搜索：<select size="1" name="how">
						<option value="1" selected>按帐号关键子</option>
						<option value="2">按教员名称关键子</option>
						<option value="3">按教员编号关键子</option>						
						</select>
						<input type="text" name="what" size="15" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
						<input type="submit" value="搜索" name="B3"></p>
	  </form>		</td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="58" valign="top">
					<b>分类：</b></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="60" valign="top">
					<a href="admin_enuser.asp?class=1">高级用户</a></td>
		<td bgcolor="#F1F3F5" align="center" width="56" valign="top"><a href="admin_enuser.asp?class=3">认证用户</a></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="70" valign="top">
					<a href="admin_enuser.asp?class=2">被锁定用户</a></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="26" valign="top">
					<a href="admin_enuser.asp">全部</a></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="100%" align="center" colspan="6">
					<%
if request("class")="1" then
sql="select id,ac,name,rdate,lock,vip,tj from en_user where vip=true order by id desc"
else
if request("class")="2" then
sql="select id,ac,name,rdate,lock,vip,tj from en_user where lock=true order by id desc"
else
if request("class")="3" then
sql="select id,ac,name,rdate,lock,vip,tj from en_user where rz=true order by id desc"
else
sql="select id,ac,name,rdate,lock,vip,tj from en_user order by id desc"
end if
end if
end if 
rs.open sql,conn,1,1
if rs.recordcount=0 then
           response.write "暂时没有注册用户！"
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
							相关用户<font color="#FF0000"><%=rs.recordcount%></font>人</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_enuser.asp?action=f&class=<%=request("class")%>">
							首页</a>&nbsp;&nbsp;
							<a href="admin_enuser.asp?action=p&class=<%=request("class")%>">上一页</a>&nbsp;&nbsp;
							<a href="admin_enuser.asp?action=n&class=<%=request("class")%>">下一页</a>&nbsp;&nbsp;
							<a href="admin_enuser.asp?action=l&class=<%=request("class")%>">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_enuser.asp?class=<%=request("class")%>">
		<p align="center">跳转到 
		<input type="text" name="page1" size="5" style="border: 1px solid #000000"> 
		页&nbsp; 
	<input type="submit" value="提交" name="B1"></p>
</form></td>
						</tr>
					</table>	  </td>
	</tr>
	<tr>
		<td height="100%" valign="top" colspan="6">
		
		  <p>&nbsp;</p>
		  <table border="0" width="751" cellspacing="0" cellpadding="0" height="24">
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="51" height="25" bgcolor="#E5E5E5">
			  <p align="center"><b>编号</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="56" height="25" bgcolor="#FFFFFF">
			  <p align="center"><b>帐号</b></td>
			  <td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="87" height="25" bgcolor="#E5E5E5">
			  <p align="center"><strong>教员姓名</strong></td>
			  <td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="49" height="25" bgcolor="#E5E5E5">
			  <p align="center"><b>推荐</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="49" height="25">
			  <p align="center"><b>VIP</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="45" height="25" bgcolor="#E5E5E5">
			  <p align="center"><b>锁定</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="79" height="25" bgcolor="#FFFFFF">
			  <p align="center"><b>注册时间</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" align="center" height="25" colspan="5" bgcolor="#E5E5E5">
				<b>操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 作</b></td>
			</tr>
<%
rs.absolutepage=session("page")
for ii=1 to rs.pagesize
%>	
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="51" bgcolor="#E5E5E5" height="25" align="center">
			  <p align="center"><%=rs("id")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="56" height="25" align="center">
				<%=rs("ac")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="87" height="25" bgcolor="#E5E5E5" align="center">
				<%
				if rs("name")<>"" then
				%>
			  <a target="_blank" href="../teacher.asp?id=<%=rs("id")%>"><%=rs("name")%></a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="49" align="center">
				<%if rs("tj")=true then response.write"<font color='#FF0000'>是</font>"%>
    	 <%if rs("tj")=false then response.write"否"%></td>
                         
				<%
				else
				response.write "×"
                end if
				%>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="49" height="25" align="center">
				<%if rs("vip")=true then response.write"<font color='#FF0000'>是</font>"%>
    	 <%if rs("vip")=false then response.write"否"%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="45" height="25" bgcolor="#E5E5E5" align="center">
			  <p align="center"><%
				if rs("lock")=true then
				response.write "<font color='#FF0000'>锁定</font>"
				else
				response.write "否"
				end if
				%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="79" height="25" align="center">
			  <p align="center"><%=rs("rdate")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="45" align="center" height="25" bgcolor="#E5E5E5">
				<a target="_blank" href="../teacher.asp?id=<%=rs("id")%>">
				查看</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="67" align="center" height="25" bgcolor="#E5E5E5">
				<a href="JavaScript:openScript('admin_sendmessage.asp?tid=<%=rs("id")%>&ttype=2',450,300)">发送信息</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="65" align="center" height="25" bgcolor="#E5E5E5">
				<a href="JavaScript:openScript('admin_user_ac.asp?id=<%=rs("id")%>&ttype=2',450,370)">帐户设置</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="76" align="center" height="25" bgcolor="#E5E5E5">
				<a target="_blank" href="gocontrol.asp?id=<%=rs("id")%>&ac=<%=rs("ac")%>&ttype=2&vip=<%=rs("vip")%>">详细修改</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="69" align="center" height="25" bgcolor="#E5E5E5">
				<a onClick="{if(confirm('警告：此操作将删除用户〈<%=rs("ac")%>〉在本站的所有数据！继续吗？')){return true;}return false;}" href="admin_del_user.asp?id=<%=rs("id")%>&ttype=2"><span style="text-decoration: none">删除</a></td>
			</tr>
		<%
rs.movenext
if rs.eof then exit for
next
%>
		</table>	  </td>
	</tr>
	<tr>
		<td height="100%" align="center" colspan="6">
					<table border="0" width="650" cellspacing="0" cellpadding="0" height="25">
						<tr>
							<td width="104">
							共有用户<font color="#FF0000"><%=rs.recordcount%></font>人</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_enuser.asp?action=f&class=<%=request("class")%>">
							首页</a>&nbsp;&nbsp;
							<a href="admin_enuser.asp?action=p&class=<%=request("class")%>">上一页</a>&nbsp;&nbsp;
							<a href="admin_enuser.asp?action=n&class=<%=request("class")%>">下一页</a>&nbsp;&nbsp;
							<a href="admin_enuser.asp?action=l&class=<%=request("class")%>">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_enuser.asp?class=<%=request("class")%>">
		<p align="center">跳转到 
		<input type="text" name="page1" size="5" style="border: 1px solid #000000"> 
		页&nbsp; 
	<input type="submit" value="提交" name="B2"></p>
</form></td>
						</tr>
					</table>		</td>
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