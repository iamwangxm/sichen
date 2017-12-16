<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<html>




<%
if Request.Cookies("ggval")<>"81528686528" then 
Response.Cookies("id")=""
Response.Cookies("ac")=""
Response.Cookies("user")="" 
end if 
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或登录超时，请重新登录后操作！！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if

%>
 <head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=webname%> - 会员中心</title>
<style type="text/css">
<!--
.STYLE2 {font-size: 12px}
.STYLE5 {
	color: #006666;
	font-weight: bold;
}
.STYLE6 {
	font-size: 16pt;
	color: #CC33CC;
}
.STYLE7 {
	font-size: 18pt;
	font-weight: bold;
}
.STYLE10 {
	font-size: 14px;
	color: #003366;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="421">
		<tr>
			<td align="left" valign="top" width="100%"  bgcolor="#FEFBF4" style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD;border-top: 1px solid #B8D5AD">
			<div>
			  <table border="0" width="90%" cellspacing="0" cellpadding="0" id="table2" height="379">
			       <tr>
						<td height="120" width="349" align="center"><img border="0" src="images/control.gif" width="282" height="90"></td>
						<td height="86"  width="318"></td>
						<td height="86"  width="128"></td>
						<td height="86"  width="58"></td>
					</tr>
					<tr>
						<td colspan="4" valign="top">
						<div align="center">
							<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3" height="272">

								<tr>
									<td width="26%" rowspan="2" valign="top">
                                    <%
					             	if Request.Cookies("user")="1" then
						             %>
									<!--#include file="in_menu.asp"-->
                                    <%else%>
                                    	<!--#include file="en_menu.asp"-->									
                                        <%end if%>
                                    </td>
									<td width="74%" valign="top" bgcolor="#FEFBF4">
									<div align="center">
									  <table border="1" cellspacing="0" bordercolor="#993333" width="100%" style="margin-top:7">
                                        <tr>
                                          <td align="center">
											  <%
                                              file1=request("file")
											  
                                              if file1="" then
 											     if Request.Cookies("user")="1" then
											        file1="in_control_index.asp"
											     else
												    file1="en_control_index.asp"
												 end if
											  end if
											  
                                              if right(file1,3)="asp" then
                                                 Server.Execute(file1)
                                              end if
                                              %>
                                          
                                          </td>
                                        </tr>
                                      </table>
								     </div>
                                    </td>
								</tr>
								<tr>
								  <td valign="top" align="center" bgcolor="#FEFBF4">&nbsp;</td>
								</tr>
							</table>
						</div>

						</td>
					</tr>
			  </table>
			</div>
			</td>
		</tr>
	</table>
</div>

<!--#include file="base.asp"-->
</body>

</html>