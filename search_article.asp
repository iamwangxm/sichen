<%
if request("class")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择文章类别！');" & "window.close()" & "</script>"
response.end
end if
if trim(request("what"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请填写关键字！');" & "window.close()" & "</script>"
response.end
end if
%>
<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>文章搜索 - <%=webname%></title>
</head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="206">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD" valign="top">
			<div align="center">
				<table border="0" width="99%" cellspacing="0" cellpadding="0" id="table2" height="205">
					<tr>
						<td width="206" valign="top" align="center">
                        <!--#include file="article_searchbox.asp"-->
                        
						<table border="0" width="87%" cellspacing="0" cellpadding="0" id="table3">
							<tr>
								<td height="2" style="border-left: 1px solid #D4D4D4; border-right: 1px solid #D4D4D4; border-top-width: 1px; border-bottom-width: 1px">
								
								</td>
							</tr>
							<tr>
								<td height="36" style="border-top:1px solid #D4D4D4; border-left:1px solid #D4D4D4; border-right:1px solid #D4D4D4; ">
								<img border="0" src="images/article2.gif" width="192" height="41"></td>
							</tr>
							<tr>
								<td height="36" style="border-left:1px solid #D4D4D4; border-right:1px solid #D4D4D4">
								<img border="0" src="images/article5.gif" width="192" height="70"></td>
							</tr>
							<tr>
								<td height="36" style="border-bottom:1px solid #D4D4D4; border-left:1px solid #D4D4D4; border-right:1px solid #D4D4D4; border-top-width: 1px; " valign="top">
										<div align="center">
											<table border="0" width="94%" cellspacing="0" cellpadding="0" id="table13" height="25">
<%
set rs1=server.createobject("adodb.recordset")
sql="select id,title from article where class="&request("class")&" order by click desc"
rs1.open sql,conn,1,1
if rs1.eof or rs1.bof then
           response.write "暂无文章！"
           rs1.close
           else
           for i1=1 to 10
title=rs1("title")
if len(title)>13 then title=left(title,11)&"..."
%>
												<tr>
													<td width="16" height="18">
													<p align="center">
													<img border="0" src="images/ls3.gif" width="13" height="22"></td>
													<td height="18">
													<a  target="_blank" href="show_article.asp?id=<%=rs1("id")%>">
								<%=title%></a></td>
												</tr>
<%
rs1.movenext
if rs1.eof then exit for
next
rs1.close
end if
if request("how")="1" then
sql="select * from article where title like '%"&request("what")&"%' and class="&request("class")&" order by id desc"
else
sql="select * from article where content like '%"&request("what")&"%' and class="&request("class")&" order by id desc"
end if
rs.open sql,conn,1,1
%>			
											
											</table>
										</div>
										</td>							</tr>
						</table>
						</td>
						<td valign="top">
						<div align="center">
							<table border="0" width="99%" cellspacing="0" cellpadding="0" id="table14" height="197">
								<tr>
									<td height="46" width="540" background="images/bg5.gif">
									<table border="0" width="537" cellspacing="0" cellpadding="0" id="table15" height="30">
										<tr>
											<td valign="bottom" width="110">
											</td>
											<td width="427">
											<p align="center">
											<font color="#000080"><b>&nbsp;<%
											if request("class")="1" then
											response.write "新闻动态"
											else
											response.write "经验技巧"
											end if
											%> </b>按<b> <%
											if request("how")="1" then
											response.write "标题"
											else
											response.write "内容"
											end if

											%> </b>关键字“<b><%=request("what")%></b>”找到<b> <%=rs.recordcount%> </b>条记录</font></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td  valign="top" align="center">
									<table border="0" width="96%" cellspacing="0" cellpadding="0" id="table16" height="20">
										<%
if rs.recordcount=0 then
rs.close
           response.write "暂无相关文章！"
           else
rs.pagesize=17
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
rs.absolutepage=session("page")
for ii=1 to rs.pagesize
%>	
										<tr>
											<td width="5%" height="25" background="images/bg1.gif">
											<p align="center">
											<img border="0" src="images/new2.gif" width="11" height="11"></td>
											<td height="25" background="images/bg1.gif" width="79%"><a target="_blank" href="show_article.asp?id=<%=rs("id")%>"><%=rs("title")%></a></td>
											<td height="25" width="16%" background="images/bg1.gif"><%
								a=instr(rs("addtime"),chr(32))-1
								response.write Mid(rs("addtime"),1,a)
								%></td>
										</tr>
<%
rs.movenext
if rs.eof then exit for
next
%>
									<tr>
											<td height="25" colspan="3" align="center">
											<p align="center">
											<table border="0" width="504" cellspacing="0" cellpadding="0" height="31">
						<tr>
							<td width="120">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="225">
							<p align="center">&lt; <a href="search_article.asp?action=f&class=<%=request("class")%>&how=<%=request("how")%>&what=<%=request("what")%>">首页</a>&nbsp;&nbsp;
							<a href="search_article.asp?action=p&class=<%=request("class")%>&how=<%=request("how")%>&what=<%=request("what")%>">上一页</a>&nbsp;&nbsp;
							<a href="search_article.asp?action=n&class=<%=request("class")%>&how=<%=request("how")%>&what=<%=request("what")%>">下一页</a>&nbsp;&nbsp;
							<a href="search_article.asp?action=l&class=<%=request("class")%>&how=<%=request("how")%>&what=<%=request("what")%>">尾页</a> &gt;</td>
							<form method="POST" action="search_article.asp?class=<%=request("class")%>&how=<%=request("how")%>&what=<%=request("what")%>">
							<td width="159">							
		<p>跳转到 
		<input type="text" name="page1" size="4" style="border: 1px solid #000000"> 页&nbsp; 
	<input type="submit" value="提交" name="B1"></p>
</td>
</form>
						</tr>
					</table>
</td>
										</tr>
										<%
										rs.close
										end if
										%>
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
set rs1=nothing
set rs=nothing
set conn=nothing
%>
<!--#include file="base.asp"-->
</body>

</html>