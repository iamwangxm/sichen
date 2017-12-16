<%if Request.Cookies("vip")<>"true" then
 if date()-cdate(Request.Cookies("rdate"))>3 then
response.write "<script language=JavaScript>" & chr(13) & "alert('抱歉，本站免费『发送站内信息』普通会员免费体验时间仅3天，【VIP会员】可无限期使用，您的体验时间已到期，请使用其他联系方式联系；如果需要使用此功能，请升级成VIP会员，详见会员中心说明，咨询电话-13412380803，QQ-27229133！');" & "JavaScript:window.close();" & "</script>" 
end if
end if 
%>
<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您不具备此权限！');" & "history.back()" & "</script>" 
Response.End
end if
if request("ttype")<>"1" and request("ttype")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('系统信息！请勿回复！');" & "history.back()" & "</script>" 
end if

if request("ttype")="1" then 
sql="select name from in_user where id="&clng(request("tid"))
ttype="1"
else
sql="select name from en_user where id="&clng(request("tid"))
ttype="2"
end if
rs.open sql,conn,1,1
if rs.recordcount=0 then
rs.close
set rs=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('非法数据提交！');" & "window.close()" & "</script>" 
Response.End
end if
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>发送信息</title>
</head>

<body>
<div align="center">
	<table border="0" width="400" cellspacing="0" cellpadding="0" height="300" id="table1">
		<tr>
			<td valign="top">
			<form method="POST" action="sendmessage_db.asp">
				<table border="0" width="400" cellspacing="0" cellpadding="0" id="table2" height="278">
					<tr>
						<td height="30" background="images/jobbg1.gif" style="border: 1px solid #C0C0C0" width="398" colspan="3">
						<p align="center"><b><font color="#0A5DF6">站内信息发送</font></b></td>
					</tr>
					<tr>
						<td height="28" width="69" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2">
						<p align="center"><b>收件人：</b></td>
						<td height="28" width="331" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" colspan="2">&nbsp;<%=unhtml(rs("name"))%></td>
					</tr>
					<tr>
						<td width="69" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2">
						<p align="center"><b>主&nbsp; 题：</b></td>
						<td width="331" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" colspan="2">
						&nbsp;<input type="text" name="title" size="44" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=request("title")%>"></td>
					</tr>
					<tr>
						<td width="69" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="35">
						<p align="center"><b>验证码：</b></td>
						<td width="44" style="border-left-width: 1px; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" height="35" align="center" bgcolor="#EEFFF2">
						<input name="code" size="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px; float:right"></td>
						<td width="288" style="border-right:1px solid #C0C0C0; border-left-width: 1px; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" height="35" align="center" bgcolor="#EEFFF2">
						<p align="left"><%call getcode%></td>
					</tr>
					<tr>
						<td width="69" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="123">
						<p align="center"><b>内&nbsp; 容：</b></td>
						<td width="331" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" height="123" align="center" bgcolor="#EEFFF2" colspan="2">
						<textarea rows="8" name="content" cols="43" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><%=request("content")%></textarea></td>
					</tr>
					<tr>
						<td height="30" width="400" colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2">
						<p align="center">
						<input type="submit" value="发送" name="B1">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="清空" name="B2"></td>
					</tr>
				</table>
			<input type="hidden" name="ttype" value="<%=ttype%>">
			<input type="hidden" name="tid" value="<%=request("tid")%>">

			</form>
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