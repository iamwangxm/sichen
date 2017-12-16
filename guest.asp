<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->

<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>网站留言 -<%=webname%></title>
<style type="text/css">
<!--
.STYLE1 {font-size: 12pt}
.STYLE5 {font-size: 16px}
.STYLE6 {color: #CC0099; font-size: 10pt;}
-->
</style>
</head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="106">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD" width="950" valign="top">
			<div align="center">
				<table border="0" width="98%" cellspacing="0" cellpadding="0" id="table2" height="164">
					<tr>
						<td  valign="top">
						<div align="center">
							<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3" height="147">
								<tr>
									<td height="40" width="740" background="images/bg17.gif">
									<table border="0" width="740" cellspacing="0" cellpadding="0" id="table4" height="31">
										<tr>
											<td width="127">　</td>
											
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td valign="top" align="center">
									<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table5" height="92">
														<tr>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "  height="42" align="center" valign="top">
										<div align="center">
											<table border="0" width="90%" cellspacing="0" cellpadding="0" id="table7" height="87">
												<tr>
													<td height="21">
													<p align="center"><b><img src="images/03.gif" width="50" height="50">
													<a href="add_guest.asp"><span class="STYLE5">点此处<font color=#FF0000>签写留言</font><font color=#FF0000></font></span></a></b></td>
												</tr>
												<tr>
												  <td height="25" class="STYLE6"><div align="center">提示：请家教-做家教信息/AD信息请不要发在留言本中，否则无条件删除！！谢谢合作！！！<br>
												      请大家遵守网络公德，本留言本启用审核功能！违规内容将移送相应机关处理！</div></td>
											  </tr>
											</table>
										</div>
<%
sql="select * from guest  order by id desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
           response.write "暂无留言！"
           else
rs.pagesize=10
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

										
						<table border="0" width="662" cellspacing="0" cellpadding="0" height="214">
						<tr>
							<td height="28" width="91" bgcolor="#B8D5AD" style="border-left: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD">
							<p align="center"><font color="#FF0000"><b>主题：</b></font></td>
							<td height="28" width="302" bgcolor="#B8D5AD" style="border-left: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD">
							<font color="#FF0000"><b>
							<% =unHtml(rs("title")) %></b></font></td>
							<td height="28" width="84" bgcolor="#B8D5AD" style="border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD">
							<font color="#000000">　<b>留言时间：</b></font></td>
							<td width="185" height="28" bgcolor="#B8D5AD" style="border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD">
							<font color="#000000"><%=rs("addtime")%></font>							</td>
							</tr>
						<tr>
							<td colspan="4" style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-bottom: 1px solid #B8D5AD" align="center">
							<table border="0" width="98%" height="141">
								<tr>
									<td width="114" rowspan="2" align="center" valign="top">
									<table border="0" width="100%" cellspacing="0" cellpadding="0" height="128">
										<tr>
											<td height="98" style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD; border-bottom-width: 1px ">
											<p align="center">
											<%
											if rs("sex")=true then
											qq="mqq"
											sex="先生"
											else
											qq="wqq"
											sex="女士"
											end if
											%>
											<img border="0" src="images/<%=qq%>.jpg" width="80" height="80"></td>
										</tr>
										<tr>
											<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-bottom: 1px solid #B8D5AD">
											<p align="center"><%=unHtml(rs("username"))%><br><%="『"&sex&"』"%>										</tr>
									</table>									</td>
									<td style="line-height: 150%"><br><%if rs("show")=true then%>
												<% =unHtml(rs("content")) %>
												<%else%>
												 <font color=#ff0000> 此留言在审核中.....</font>
												  <%end if %></td>
								</tr>
								<tr>
								  <td style="line-height: 150%"><div align="right">留言IP：<font color=#ff0000><strong><%=rs("ip")%></strong></font></div></td>
								  </tr>
							</table>							</td>
						</tr>
						<tr>
							<td colspan="4" height="33" style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-bottom: 1px solid #B8D5AD" bgcolor="#F7F3F7">
							<div align="center">
								<table border="0" width="644" cellspacing="0" cellpadding="0" height="15">
									<tr>
										<td height="15" width="105">
										<%
										if rs("reply")<>"" then response.write "<font color='#ff0000'>〖家教网回复〗</font>"
										%>										</td>
										<td height="15" width="539" style="line-height: 150%">
                                        <%
										if rs("reply")<>"" then response.write "<font color='#BB0000'>"&unHtml(rs("reply"))&"</font><br>" & "【回复时间："&rs("rtime")&"】"
										%>										</td>
									</tr>
								</table>
							</div>							</td>
						</tr>
						<tr>
							<td colspan="4" height="10" background="images/yy.gif">							</td>
						</tr>
					</table>
					<%
rs.movenext
if rs.eof then exit for
next
%>
						<table border="0" width="504" cellspacing="0" cellpadding="0" height="31">
						<tr>
							<td width="120">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="225">
							<p align="center">&lt; <a href="guest.asp?action=f&infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>&what=<%=request("what")%>">首页</a>&nbsp;
							<a href="guest.asp?action=p&infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>&what=<%=request("what")%>">上一页</a>&nbsp;
							<a href="guest.asp?action=n&infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>&what=<%=request("what")%>">下一页</a>&nbsp;
							<a href="guest.asp?action=l&infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>&what=<%=request("what")%>">尾页</a> &gt;</td>
							<form method="POST" action="guest.asp?infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>&what=<%=request("what")%>">
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
									</table>									<%
										rs.close
										end if
										%>

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
    	</table>
</div>

<%
set rs2=nothing
set rs=nothing
set conn=nothing
%>

<!--#include file="base.asp"-->
</body>

</html>