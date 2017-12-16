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
sql="select * from article where id="&clng(request("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
           response.redirect "nodata.html"
           rs.close
end if 
sql1="update article set click="&rs("click")+1&" where id="&clng(request("id"))
conn.execute(sql1)
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=unHtml(rs("title"))%> -<%=webname%></title>
<!--#include file="top.asp"-->
</head>

<body>

<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="206">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD" valign="top">
			<div align="center">
				<table border="0" width="99%" cellspacing="0" cellpadding="0" id="table2" height="205">
					<tr>
						<td width="206" valign="top" align="center">
						<!--#include file="article_searchbox.asp"-->
						</td>
						<td valign="top">
						<div align="center">
							<table border="0" width="99%" cellspacing="0" cellpadding="0" id="table14" height="197">
								<tr>
									<td height="46"  style="padding-top:20; padding-bottom:20">
                                    
                                    <p align="center"><b><font size="4"  color="#006600"><% =unHtml(rs("title")) %></font></b>

									</td>
								</tr>
								<tr>
									<td  valign="top" align="center">
									<table border="0" width="96%" cellspacing="0" cellpadding="0" id="table16" height="107">
										<tr>
											<td height="25"  bgcolor="#EFEFEF"><p align="center">
								<%response.write year(rs("addtime"))&"年"&month(rs("addtime"))&"月"&day(rs("addtime"))&"日"
								%>&nbsp; 被阅：<%=rs("click")+1%>次 来源：<%=rs("comefrom")%></td>
										</tr>
										<tr>
											<td style="line-height: 180%;text-align:left;word-break:break-all;font-size:14px; padding-top:15"><% =(rs("content")) %></td>
										</tr>
										<tr>
											<td style="line-height: 150%" height="27">
											</td>
										</tr>
										<tr>
											<td style="line-height: 150%" height="26">
											<%
											if rs("comefrom")<>"" then
											%>
											<p align="center"><font color="#FF0000">申明</font>：<font color="#000000">此文章源于<%=rs("comefrom")%>，若有侵权，请与我们联系。</font>
											<%
											end if
											%>
											</td>
										</tr>
									</table>
									</td>
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
<%
rs.close
set rs=nothing
set conn=nothing
%>
<!--#include file="base.asp"-->
</body>

</html>
