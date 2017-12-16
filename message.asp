<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->

<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

<table border="0" width="93%" cellspacing="0" cellpadding="0" id="table5">
											<tr>
												<td height="40">
												<p align="center"><b>站内信息</b></td>
											</tr>
											<tr>
												<td height="322" valign="top">
                                                <FORM name=alldel  method=post>                                                
												<div align="center">
													<table border="0" width="517" cellspacing="0" cellpadding="0" id="table6" height="118">
<%
sql="select * from message where ttype='"&Request.Cookies("user")&"' and tid="&clng(Request.Cookies("id"))&" order by id desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
           response.write "您还没有任何信息！"
           else
	rs.pagesize=10
	page=request("page")       
	if page="" then page=1       
	if page<1 then page=1         
	page=clng(page)                  
	if page>rs.pagecount then page=rs.pagecount                  
	rs.absolutepage=page
														%>
														<tr>
															<td height="30" width="26" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<p align="center">
															<font color="#0A5DF6">
															<b>已读</b></font></td>
															<td height="30" width="217" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>主题</b></font></td>
															<td height="30" width="123" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>发信人</b></font></td>
															<td height="30" width="114" bordercolor="#C0C0C0" style="border: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<p align="center">
															<font color="#0A5DF6">
															<b>操作</b></font></td>
														</tr>
<%
set rs1=server.createobject("adodb.recordset")
for ii=1 to rs.pagesize
if rs("ftype")="1" then
sql1="select name from in_user where id="&rs("fid")
rs1.open sql1,conn,1,1
name="<a target='_blank' href='student.asp?id="&rs("fid")&"'>"&rs1("name")&"</a>"
rs1.close
end if
if rs("ftype")="2" then
sql1="select name from en_user where id="&rs("fid")
rs1.open sql1,conn,1,1
name="<a target='_blank' href='teacher.asp?id="&rs("fid")&"'>"&rs1("name")&"</a>"
rs1.close
end if
if rs("ftype")="0" then name="<font color='#FF0000'>"&"系统信息"&"</font>"
%>	
												
												<tr>
															<td height="30" width="26" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															<img border="0" src="<%
															if rs("new")=true then
															response.write "images/m_news.gif"
															else
															response.write "images/m_olds.gif"
                                                            end if
															%>" width="21" height="14"></td>
															<td height="30" width="217" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
<a href="JavaScript:openScript('showmessage.asp?id=<%=rs("id")%>',450,300)"><%if rs("new")=true then response.write "<b>"%><%=rs("title")%><%if rs("new")=true then response.write "</b>"%></a></td>
															<td height="30" width="123" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
<%=name%></td>
															<td height="30" width="114" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															<p align="center">
															<a href="JavaScript:openScript('showmessage.asp?id=<%=rs("id")%>',450,300)"><img border="0" src="images/cha_depot.gif" width="53" height="17"></a>
															<!--a onClick="{if(confirm('此操作将删除信息<<%=rs("title")%>>，继续吗？')){return true;}return false;}" href="del_message.asp?id=<%=rs("id")%>&page=<%=page%>">
															<img border="0" src="images/del_depot.gif" width="53" height="17"></a--></td>
													  </tr>
														<%
rs.movenext
if rs.eof then exit for
next
%>
	<tr>
															<td height="30" width="480" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="4" bgcolor="#E3E3E3">
															<!--为节省空间，请及时删除无用的信息！<a onClick="{if(confirm('此操作将删除您的所有站内消息，继续吗？')){return true;}return false;}" href="del_message.asp?id=all"><img border="0" src="images/all_del.gif" width="80" height="17"></a--></td>
													  </tr>
	<tr>
	  <td height="15" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="4">提示：本站站内信息<span class="STYLE2">最长保存时间为两个月</span>，到期后，不管是否阅读，都将被系统自动删除！</td>
	  </tr>
	</table>
												</div>
												</td>
											</tr>
											<tr>
												<td height="38" align="center">
												<table border="0" width="524" cellspacing="0" cellpadding="0" height="29">
						<tr>
							<td width="524" height="29">
                            
							<%if rs.pagecount>1 then
                                    str="<div align='right'>"                                        
                                    str=str & "<center>"                                        
                                    str=str & "<table border='0' cellpadding='0' cellspacing='0' width='98%' height=25>"                                        
                                    str=str & "<tr>"                                        
                                    str=str & "<td width='100%' align='right' height='25'>"                                     
                                    if page<>1 then                                     
                                        str=str & "[<A href='#' onclick=nextpage('1')><font color='#0000FF'>首页</font></A>]"                                        
                                        str=str & "[<A href='#' onclick=nextpage('"&page-1&"')><font color='#0000FF'>上页</font></A>]"                                        
                                    end if                                        
                                    if page<>rs.pagecount then                                     
                                        str=str & "[<A href='#' onclick=nextpage('"&page+1&"')><font color='#0000FF'>下页</font></A>]"                                        
                                        str=str & "[<A href='#' onclick=nextpage('"&rs.pagecount&"')><font color='#0000FF'>尾页</font></A>]"                                        
                                    end if 
                                    str=str & "</td>"                                     
                                    str=str & "</tr>"                                     
                                    str=str & "</table>"                                     
                                    str=str & "</center>"                                     
                                    str=str & "</div>"
                                response.write str
                                end if   
                            %>
             <INPUT type=hidden name=page>
             </form> 
                            
                            </td>
						</tr>
					</table>

												</td>
											</tr>
											<%end if%>
</table>

<%
set rs1=nothing
rs.close
set rs=nothing
set conn=nothing
%>


<SCRIPT language=vbscript>                               
sub nextpage(x)      
	alldel.page.value=x        
	alldel.action="control.asp?file=message.asp"
	window.event.returnvalue=false        
	alldel.submit()                           
end sub   


</SCRIPT>