<!--#include file="../conn.asp"-->
<!--#include file="../unhtml.asp"-->
<!--#include file="../ubb.asp"-->

<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
session("what")=request("what")
session("about")=request("about")
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>建站咨讯管理</title>
<base target="_self">
</head>

<body bgcolor="#CAD7F7" vlink="#000000">

<table border="0" width="100%" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="238">
	<tr>
		<td background="images/admin_bg_1.gif" height="25">
		<p align="center"><font size="2" color="#FFFFFF"><b>上传文件管理</b></font></td>
	</tr>
	<tr>
		<td bgcolor="#FFFFFF" height="26" align="center">
<%
if session("what")="" and session("about")="" then
%>					
<form method="POST" action="admin_upfiles.asp">
	<p align="center"><b>上传新文件</b>&nbsp;&nbsp;&nbsp; 类型[<input type="radio" value="1" checked name="what">图片 
	<input type="radio" name="what" value="0">其他]&nbsp;&nbsp;&nbsp; 文件说明<input type="text" name="about" size="27" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="下一步" name="B3">&nbsp;&nbsp;&nbsp; <input type="reset" value="重置" name="B4"></p>
</form>
<%
else
%>
<script language=javascript>
  function test()
  {
      if (document.form1.strFile1.value==""){
	      alert("请选择文件！")
		  document.form1.strFile1.focus();
		  return false
		    }
	 return true
  }
  function reset_form()
  {
   document.form1.name.value="";
   document.form1.pwd.value="";
   document.form1.userr.value="";
   document.form1.name.focus;
  }
</script>
<form name="form1" method="POST" enctype="multipart/form-data" action="upload.asp" onSubmit="return test()">
请选择文件&nbsp;
<input type="file" name="strFile1" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> &nbsp;&nbsp; <input type="submit" value="提交" name="B1">
</form>
<%
end if
%>					
</td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="100%" align="center">
					<%
sql="select * from files order by id desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
           response.write "暂无文件！"
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
							共有文件<font color="#FF0000"><%=rs.recordcount%></font>个</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_upfiles.asp?action=f">
							首页</a>&nbsp;&nbsp;
							<a href="admin_upfiles.asp?action=p">上一页</a>&nbsp;&nbsp;
							<a href="admin_upfiles.asp?action=n">下一页</a>&nbsp;&nbsp;
							<a href="admin_upfiles.asp?action=l">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_upfiles.asp">
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
		<td height="100%" valign="top">
		
		<table border="0" width="709" cellspacing="0" cellpadding="0" height="24">
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="32" bgcolor="#E5E5E5" height="25" align="center">
				<p align="center"><b>编号</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="266" height="25" align="center">
				<p align="center"><b>相对当前页面路径</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="158" bgcolor="#E5E5E5" height="25" align="center">
				<p align="center"><b>说明</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="155" bgcolor="#FFFFFF" height="25" align="center">
				<p align="center"><b>上传时间</b></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="50" align="center" height="25" colspan="2" bgcolor="#E5E5E5">
				<b>操作</b></td>
			</tr>
<%
rs.absolutepage=session("page")
for ii=1 to rs.pagesize
%>	
			
			<tr>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="32" bgcolor="#E5E5E5" height="25">
				<p align="center"><%=rs("id")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="266" height="25">
				　<a target="_blank" href="<%=rs("address")%>"><%=rs("address")%></a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="158" bgcolor="#E5E5E5" height="25">
				<p align="center"><%=rs("about")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="155" bgcolor="#FFFFFF" height="25">
				<p align="center"><%=rs("addtime")%></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="25" align="center" height="25" bgcolor="#E5E5E5">
				<a target="_blank" href="<%=rs("address")%>">查看</a></td>
				<td style="border-bottom: 1px dotted #000000; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="25" align="center" height="25" bgcolor="#E5E5E5">
								<a onClick="{if(confirm('警告：此操作将删除文件(ID=<%=rs("id")%>)！继续吗？')){return true;}return false;}" href="del_file.asp?file=<%=rs("address")%>"><span style="text-decoration: none"><font color="#000000">删除</font></span></a></td>
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
		<td height="100%" align="center">
					<table border="0" width="650" cellspacing="0" cellpadding="0" height="25">
						<tr>
							<td width="104">
							共有文件<font color="#FF0000"><%=rs.recordcount%></font>个</td>
							<td width="112">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="248">
							<p align="center">&lt; <a href="admin_upfiles.asp?action=f">
							首页</a>&nbsp;&nbsp;
							<a href="admin_upfiles.asp?action=p">上一页</a>&nbsp;&nbsp;
							<a href="admin_upfiles.asp?action=n">下一页</a>&nbsp;&nbsp;
							<a href="admin_upfiles.asp?action=l">尾页</a> &gt;</td>
							<td width="186">
							<form method="POST" action="admin_upfiles.asp">
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