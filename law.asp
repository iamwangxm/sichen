<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->
<!--#include file="ubb.asp"-->
<html>
<%
if not(isnumeric(request("id"))) then
response.redirect "nodata.html"
rs.close
end if
sql="select * from service where id="&clng(request("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
           response.redirect "nodata.html"
           rs.close
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=request("what")%> - <%=webname%></title>
</head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="303">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD"  valign="top">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table2" height="216">
				<tr>
					<td height="76">
					<p align="center"><b><font size="4" color=#ff0000><%=request("what")%></font></b></td>
				</tr>
				<tr>
					<td>
					<div align="center">
						<table border="0" width="97%" cellpadding="0" id="table3" height="120" >
							<tr>
								<td style="margin-top: 1; margin-bottom: 1">
								<div align="center">
									<table border="0" width="96%" cellspacing="0" cellpadding="0" id="table4" height="54">
										<tr>
											<td>　</td>
										</tr>
										<tr>
											<td height="25"><%=rs("service")%></td>
										</tr>
										<tr>
											<td height="14">&nbsp;</td>
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
			</td>
		</tr>
	</table>
</div>
<%
rs.close
set rs=nothing
set conn=nothing
%>
<!--#include file="base.asp"-->
</body>

</html>