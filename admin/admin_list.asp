<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
%>
<html>
<script language="javascript">
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>网站信息项目管理</title>
<base target="_self">
</head>

<body bgcolor="#CAD7F7" vlink="#000000">

<table border="0" width="759" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="414">
	<tr>
		<td background="images/admin_bg_1.gif" height="24" width="749">
		<p align="center"><font size="2" color="#FFFFFF"><b>职位、地区、专业、企业类别设置</b></font></td>
	</tr>
	<tr>
		<td bgcolor="#F1F3F5" height="95%" align="center" valign="top" width="740" style="border-left-width: 1px; border-top-width: 1px; border-bottom-width: 1px">
					<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table1" height="342">
						<tr>
							<td height="52"><font color="#FF0000"><b>提示</b></font><b><font color="#FF0000">：</font></b>以下项目请尽量在地一次运行系统时设置完毕，以后建议勿修改和删除（添加无妨），否则注册用户数据可能无法正常识别。</td>
						</tr>
						<tr>
							<td valign="top">
							<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table2" height="283">
								<tr>
									<td width="359" height="147" valign="top">
									<table border="1" width="95%" style="border-collapse: collapse" bordercolor="#C0C0C0" id="table3" height="59">
										<tr>
											<td height="31" colspan="3" bgcolor="#C0C0C0">
											<div align="left">
												<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table7" height="25">
													<tr>
														<td width="122"><b>职位列表</b></td>
														<form method="POST" action="adddata_list.asp?how=job">
                                                         <td>
															<p>添加：<input type="text" name="what" size="14">
															<input type="submit" value="提交" name="B1"></p>
														</td>
														</form>
													</tr>
												</table>
											</div>
											</td>
										</tr>
										<%
										sql="select * from joblist order by id desc"
										rs.open sql,conn,1,1
										for i=1 to rs.recordcount
										%>
										<tr>
											<td width="63%" height="25"><%=rs("jobclass")%></td>
											<td width="16%" align="center" height="25">
											<a href="JavaScript:openScript('admin_up_list.asp?id=<%=rs("id")%>&how=job',300,90)">修改</a></td>
											<td width="17%" align="center" height="25">
											<a onClick="{if(confirm('警告：此操作将删除项目〈<%=rs("jobclass")%>〉！继续吗？')){return true;}return false;}" href="del_list.asp?id=<%=rs("id")%>&how=job">删除</a></td>
										</tr>
										<%
										rs.movenext
                                        if rs.eof then exit for
                                        next
                                        rs.close
										%>
									</table>
									</td>
									<td height="147" valign="top">
									<table border="1" width="95%" style="border-collapse: collapse" bordercolor="#C0C0C0" id="table4" height="59">
										<tr>
											<td height="31" colspan="3" bgcolor="#C0C0C0">
											<div align="left">
												<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table7" height="25">
													<tr>
														<td width="122"><b>地区列表</b></td>
														<form method="POST" action="adddata_list.asp?how=area">
                                                         <td>
															<p>添加：<input type="text" name="what" size="14">
															<input type="submit" value="提交" name="B1"></p>
														</td>
														</form>
													</tr>
												</table>
											</div>
											</td>
										</tr>
										<%
										sql="select * from arealist order by id desc"
										rs.open sql,conn,1,1
										for i=1 to rs.recordcount
										%>
										<tr>
											<td width="63%" height="25"><%=rs("areaclass")%></td>
											<td width="16%" align="center" height="25"><a href="JavaScript:openScript('admin_up_list.asp?id=<%=rs("id")%>&how=area',300,90)">修改</a></td>
											<td width="17%" align="center" height="25"><a onClick="{if(confirm('警告：此操作将删除项目〈<%=rs("areaclass")%>〉！继续吗？')){return true;}return false;}" href="del_list.asp?id=<%=rs("id")%>&how=area">删除</a></td>
										</tr>
										<%
										rs.movenext
                                        if rs.eof then exit for
                                        next
                                        rs.close
										%>
									</table>
									</td>
								</tr>
								<tr>
									<td width="359" height="16"></td>
									<td height="16"></td>
								</tr>
								<tr>
									<td width="359" valign="top">
									<table border="1" width="95%" style="border-collapse: collapse" bordercolor="#C0C0C0" id="table5" height="59">
										<tr>
											<td height="31" colspan="3" bgcolor="#C0C0C0">
											<div align="left">
												<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table7" height="25">
													<tr>
														<td width="122"><b>专业列表</b></td>
														<form method="POST" action="adddata_list.asp?how=zhy">
                                                         <td>
															<p>添加：<input type="text" name="what" size="14">
															<input type="submit" value="提交" name="B1"></p>
														</td>
														</form>
													</tr>
												</table>
											</div>
</td>
										</tr>
										<%
										sql="select * from zhylist order by id desc"
										rs.open sql,conn,1,1
										for i=1 to rs.recordcount
										%>
										<tr>
											<td width="63%" height="25"><%=rs("zhyclass")%></td>
											<td width="16%" align="center" height="25">
											<a href="JavaScript:openScript('admin_up_list.asp?id=<%=rs("id")%>&how=zhy',300,90)">修改</a></td>
											<td width="17%" align="center" height="25">
											<a onClick="{if(confirm('警告：此操作将删除项目〈<%=rs("zhyclass")%>〉！继续吗？')){return true;}return false;}" href="del_list.asp?id=<%=rs("id")%>&how=zhy">删除</a></td>
										</tr>
										<%
										rs.movenext
                                        if rs.eof then exit for
                                        next
                                        rs.close
										%>
									</table>
									</td>
									<td valign="top">
									<table border="1" width="95%" style="border-collapse: collapse" bordercolor="#C0C0C0" id="table6" height="59">
										<tr>
											<td height="31" colspan="3" bgcolor="#C0C0C0">
											<div align="left">
												<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table7" height="25">
													<tr>
														<td width="122"><b>公司类别列表</b></td>
														<form method="POST" action="adddata_list.asp?how=company">
                                                         <td>
															<p>添加：<input type="text" name="what" size="14">
															<input type="submit" value="提交" name="B1"></p>
														</td>
														</form>
													</tr>
												</table>
											</div>
</td>
										</tr>
										<%
										sql="select * from companylist order by id desc"
										rs.open sql,conn,1,1
										for i=1 to rs.recordcount
										%>
										<tr>
											<td width="63%" height="25"><%=rs("companyclass")%></td>
											<td width="16%" align="center" height="25">
											<a href="JavaScript:openScript('admin_up_list.asp?id=<%=rs("id")%>&how=company',300,90)">修改</a></td>
											<td width="17%" align="center" height="25">
											<a onClick="{if(confirm('警告：此操作将删除项目〈<%=rs("companyclass")%>〉！继续吗？')){return true;}return false;}" href="del_list.asp?id=<%=rs("id")%>&how=company">删除</a></td>
										</tr>
										<%
										rs.movenext
                                        if rs.eof then exit for
                                        next
                                        rs.close
										%>
									</table>
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
		</td>
	</tr>
	</table>

</body>
</html>
<%
set rs=nothing
set conn=nothing
%>