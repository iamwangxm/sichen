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
<title>网站公告修改</title>
<base target="_self">
<style>
<!--
.tableBorder
{
	border: 1px #6595D6 solid; 
	background-color: #FFFFFF;
}
TD{
	font-family:宋体; font-size: 12px; line-height: 15px;
}
td.txlRow
{
	background-color:#DEE5FA;
}

-->
</style>
</head>

<body bgcolor="#CAD7F7" style="text-align: center">
						<table border="0" width="605" cellspacing="0" cellpadding="0" height="86">
							<tr>
								<td height="24" background="images/admin_bg_1.gif" width="1134" style="border-left: 1px solid #000000; border-right: 1px solid #000000; border-top: 1px solid #000000; border-bottom-width: 1px" align="center">
								<font color="#FFFFFF"><b>用户短信管理</b></font></td>
							</tr>
<form method="POST" name="form1" action="admin_sendmessages_db.asp">
		</form>
									<tr>
            <td height="23" width="603" bgcolor="#F0F0F0" style="border-left: 1px solid #000000; border-right: 1px solid #000000; border-top-width: 1px; border-bottom: 1px solid #000000">
			　</td>
          					</tr>
							<tr>
            <td height="39" width="603" bgcolor="#F0F0F0" style="border-left: 1px solid #000000; border-right: 1px solid #000000; border-top-width: 1px; border-bottom: 1px solid #000000">
			<form method="POST" action="admin_del_message.asp">
				<p>批量删除用户指定日期内短消息（默认为删除已读信息）：</p>
				<select size="1" name="delDate" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px">
				<option value="7" selected>一个星期前</option>
				<option value="30">一个月前</option>
				<option value="60">两个月前</option>
				<option value="180">半年前</option>
				<option value="all">所有信息</option>
				</select> &nbsp;<input type="checkbox" value="yes" name="isread" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px">包括未读信息 
				<input type="submit" value="删 除" name="Submit" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px"> 
			</form>								</td>
          					</tr>
						</table>
</body>

					
</html>