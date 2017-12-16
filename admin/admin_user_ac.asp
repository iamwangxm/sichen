<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
if request("ttype")="1" then 
sql="select name,ac,question,lock,ltime,ip,email,vip,rz,tj,state from in_user where id="&clng(request("id"))
ttype="1"
else
sql="select name,ac,question,lock,ltime,ip,email,vip,rz,tj from en_user where id="&clng(request("id"))
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
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>用户帐户设置</title>
<style type="text/css">
<!--
.STYLE1 {	color: #FF0000;
	font-weight: bold;
}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body>
<div align="center">
	<table border="0" width="400" cellspacing="0" cellpadding="0" height="300" id="table1">
		<tr>
			<td valign="top">
			<form method="POST" action="updata_user_ac.asp">
				<table border="0" width="400" cellspacing="0" cellpadding="0" id="table2" height="492">
					<tr>
						<td height="30" background="images/jobbg1.gif" style="border: 1px solid #C0C0C0" width="400" colspan="2">
						<p align="center"><font color="#0A5DF6"><b>用户帐户设置</b></font></td>
					</tr>
					<tr>
						<td height="20" width="400" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2">
						<p align="center"><b>账&nbsp;&nbsp;&nbsp; 号：</b></td>
						<td height="20" width="311" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2">&nbsp;<%=rs("ac")%>(<%=rs("name")%>)</td>
					</tr>
					<tr>
						<td width="400" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="32">
						<p align="center"><b>密&nbsp;&nbsp;&nbsp; 码：</b></td>
						<td width="311" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="32">
						&nbsp;<input type="text" name="pwd" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
						<font color="#FF0000">若不更改，请勿填写</font></td>
					</tr>
					<tr>
						<td width="400" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="20">
						<p align="center"><b>密码问题：</b></td>
						<td width="311" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" height="20" bgcolor="#EEFFF2">
						&nbsp;<input type="text" name="question" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("question")%>"></td>
					</tr>
					<tr>
						<td width="400" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="32">
						<p align="center"><b>密码答案：</b></td>
						<td width="311" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" height="32" bgcolor="#EEFFF2">
						&nbsp;<input type="text" name="answer" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
						<font color="#FF0000">若不更改，请勿填写</font></td>
					</tr>
					<tr>
						<td width="400" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="26">
						  <p align="center"><b>=========</b></td>
						<td width="311" height="26" bgcolor="#EEFFF2" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0">
						&nbsp;
						<div align="center">========================</div></td>
					</tr>
					<tr>
					  <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="22"><div align="center"><b>推荐用户：</b> </div></td>
				      <td width="311" height="22" bgcolor="#EEFFF2" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0">是
                        <input type="radio" value="true" name="tj" <%if rs("tj")=true then response.write"checked"%>>
&nbsp;&nbsp; 
						否
                      <input type="radio" name="tj" value="false" <%if rs("tj")=false then response.write"checked"%>></td>
				  </tr>                    
					<tr>
					  <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="22"><div align="center"><b>认证用户：</b> </div></td>
				      <td width="311" height="22" bgcolor="#EEFFF2" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0">是
                        <input type="radio" value="true" name="rz" <%if rs("rz")=true then response.write"checked"%>>
&nbsp;&nbsp; 
						否
                      <input type="radio" name="rz" value="false" <%if rs("rz")=false then response.write"checked"%>></td>
				  </tr>
					<tr>
						<td width="400" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="22">
						<p align="center"><b>VIP用户：</b></td>
						<td width="311" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" height="22" bgcolor="#EEFFF2">
						&nbsp; 是
						<input type="radio" value="true" name="vip" <%if rs("vip")=true then response.write"checked"%>>
						&nbsp;&nbsp; 
						否
						<input type="radio" name="vip" value="false" <%if rs("vip")=false then response.write"checked"%>></td>
					</tr>
					<tr>
						<td width="400" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="22">
						<p align="center"><b>是否锁定：</b></td>
						<td width="311" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" height="22" bgcolor="#EEFFF2">
						&nbsp;&nbsp; 是<input type="radio" value="true" name="lock" <%if rs("lock")=true then response.write"checked"%>>&nbsp;&nbsp; 
						否<input type="radio" name="lock" value="false" <%if rs("lock")=false then response.write"checked"%>></td>
					</tr>
                    
                    
                    <%if request("ttype")="1" then%>
					<tr>
					  <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="22"><p align="center"><b>已安排：</b></td>
					  <td height="22" bgcolor="#EEFFF2" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0">
                      &nbsp;&nbsp; 是<input type="radio" value="true" name="state" <%if rs("state")=true then response.write"checked"%>>&nbsp;&nbsp; 
						否<input type="radio" name="state" value="false" <%if rs("state")=false then response.write"checked"%>></td>
				  </tr>
                   <%end if%>
                  
					<tr>
						<td width="400" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2" height="94">
						<p align="center"><b>其他数据：</b></td>
						<td width="311" height="94" bgcolor="#EEFFF2" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0">
						电子邮件地址：<%=rs("email")%><p>最后登陆时间：<%=rs("ltime")%><p>最后登陆&nbsp; IP：<%=rs("ip")%></td>
					</tr>
                  
					<tr>
					  <td height="26" colspan="2" bgcolor="#EEFFF2" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0"><span class="STYLE2">提示：设置好后，</span><span class="STYLE1">需要用户退出</span><span class="STYLE2">（点“退出会员中心”[不是关闭网页]）</span><span class="STYLE1">后，重新登录后，新设置才生效！</span></td>
			      </tr>
					<tr>
						<td height="30" width="400" colspan="2" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#EEFFF2">
						<p align="center">
						<input type="submit" value="修改" name="B1"></td>
					</tr>
				</table>
			<input type="hidden" name="ttype" value="<%=ttype%>">
			<input type="hidden" name="id" value="<%=request("id")%>">

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