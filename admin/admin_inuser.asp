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
<title>个人用户管理</title>
<base target="_self">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#CAD7F7" vlink="#000000">

<table border="0" width="100%" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="238">
	<tr>
		<td background="images/admin_bg_1.gif" height="25" colspan="6">
		<p align="center"><font size="2" color="#FFFFFF"><b>学员用户管理</b></font></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="26" align="center" width="483">
					<form method="POST" action="admin_search_inuser.asp">
						<p align="left">学员用户搜索：<select size="1" name="how">
						<option value="1" selected>按帐号关键子</option>
						<option value="2">按姓名关键子</option>
						</select>
						<input type="text" name="what" size="15" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
						<input type="submit" value="搜索" name="B3"></p>
					</form>		</td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="122" valign="top">
					<b>分类显示：</b></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="74" valign="top">
					<a href="admin_inuser.asp?class=1">高级用户</a></td>
		<td bgcolor="#F1F3F5" align="center" width="70" valign="top"><a href="admin_inuser.asp?class=3">认证用户</a></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="79" valign="top">
					<a href="admin_inuser.asp?class=2">被锁定用户</a></td>
		<td bgcolor="#F1F3F5" height="26" align="center" width="81" valign="top">
					<a href="admin_inuser.asp">全部显示</a></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="100%" align="center" colspan="6">
					<%
if request("class")="1" then
sql="select id,ac,name,rdate,lock,vip,state from in_user where vip=true order by id desc"
else
if request("class")="3" then
sql="select id,ac,name,rdate,lock,vip,state from in_user where rz=true order by id desc"
else
if request("class")="2" then
sql="select id,ac,name,rdate,lock,vip,state from in_user where lock=true order by id desc"
else
sql="select id,ac,name,rdate,lock,vip,state from in_user order by id desc"
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
							<p align="center">&lt; <a href="admin_inuser.asp?action=f&class=<%=request("class")%>">
							首页</a>&nbsp;&nbsp;
							<a href="admin_inuser.asp?action=p&class=<%=request("class")%>">上一页</a>&nbsp;&nbsp;
							<a href="admin_inuser.asp?action=n&class=<%=request("class")%>">下一页</a>&nbsp;&nbsp;
							<a href="admin_inuser.asp?action=l&class=<%=request("class")%>">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_inuser.asp?class=<%=request("class")%>">
		<p align="center">跳转到 
		<input type="text" name="page1" size="5" style="border: 1px solid #000000"> 
		页&nbsp; 
	<input type="submit" value="提交" name="B1"></p>
</form></td>
						</tr>
					</table>					</td>
	</tr>
	<tr>
	  <td height="100%" valign="top" colspan="6">
		
		<p>&nbsp;</p>
		<table border="0" width="740" cellspacing="0" cellpadding="0" height="24">
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="41" height="25" bgcolor="#E5E5E5">
				<p align="center"><b>编号</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="72" height="25" bgcolor="#FFFFFF">
				<p align="center"><b>帐号</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="59" height="25" bgcolor="#E5E5E5">
				<p align="center"><b>姓名</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="40" height="25" bgcolor="#FFFFFF">
			  <p align="center"><b>是否VIP</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="36" height="25" bgcolor="#E5E5E5">
			  <p align="center"><b>是否锁定</b></td>
				
                <td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="108" height="25" bgcolor="#FFFFFF">
			  <p align="center"><b>安排</b></td>
                            
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="108" height="25" bgcolor="#E5E5E5">
			  <p align="center"><b>注册时间</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" align="center" height="25" colspan="5" bgcolor="#FFFFFF">
				<b>操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 作</b></td>
			</tr>
<%
rs.absolutepage=session("page")
for ii=1 to rs.pagesize
%>	
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="41" bgcolor="#E5E5E5" height="25" align="center">
				<p align="center"><%=rs("id")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="72" height="25" align="center">
				<%=rs("ac")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="59" height="25" bgcolor="#E5E5E5" align="center">
				<%
				if rs("name")<>"" then
				%>
				<a target="_blank" href="../student.asp?id=<%=rs("id")%>"><%=rs("name")%></a></td>
				<%
				else
				response.write "×"
                end if
				%>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="40" height="25" align="center">
				 <%if rs("vip")=true then response.write"<font color='#FF0000'>是</font>"%>
    	 <%if rs("vip")=false then response.write"否"%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="36" height="25" bgcolor="#E5E5E5" align="center">
			  <p align="center"><%
				if rs("lock")=true then
				response.write "<font color='#FF0000'>锁定</font>"
				else
				response.write "否"
				end if
				%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="108" height="25" align="center">
			  <p align="center"><%if rs("state")=true then response.write"已安排" else response.write"<font color='red'>未安排</font>"%></td>
                              
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="108" height="25" align="center" bgcolor="#E5E5E5">
			  <p align="center"><%=rs("rdate")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="38" align="center" height="25" >
				<a target="_blank" href="../student.asp?id=<%=rs("id")%>">
				查看</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="66" align="center" height="25">
				<a href="JavaScript:openScript('admin_sendmessage.asp?tid=<%=rs("id")%>&ttype=1',450,300)">发送信息</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="71" align="center" height="25">
				<a href="JavaScript:openScript('admin_user_ac.asp?id=<%=rs("id")%>&ttype=1',450,370)">帐户设置</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="65" align="center" height="25">
				<a target="_blank" href="gocontrol.asp?id=<%=rs("id")%>&ac=<%=rs("ac")%>&ttype=1&vip=<%=rs("vip")%>">详细修改</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="69" align="center" height="25">
				<a onClick="{if(confirm('警告：此操作将删除用户〈<%=rs("ac")%>〉在本站的所有数据！继续吗？')){return true;}return false;}" href="admin_del_user.asp?id=<%=rs("id")%>&ttype=1"><span style="text-decoration: none">删除</a></td>
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
							<p align="center">&lt; <a href="admin_inuser.asp?action=f&class=<%=request("class")%>">
							首页</a>&nbsp;&nbsp;
							<a href="admin_inuser.asp?action=p&class=<%=request("class")%>">上一页</a>&nbsp;&nbsp;
							<a href="admin_inuser.asp?action=n&class=<%=request("class")%>">下一页</a>&nbsp;&nbsp;
							<a href="admin_inuser.asp?action=l&class=<%=request("class")%>">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_inuser.asp?class=<%=request("class")%>">
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