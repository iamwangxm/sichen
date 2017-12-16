<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->


<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或登录超时，请重新登录后操作！！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

<table width="90%" height="242" border="0" cellpadding="0" cellspacing="0" id="table5">
											<tr>
												<td height="40">
												<p align="center"><b>我的学员库</b></td>
											</tr>
											<tr>
												<td height="322" valign="top">
                                                <FORM name=alldel  method=post>
												<div align="center">
													<table border="0" width="498" cellspacing="0" cellpadding="0" id="table6">
														<%
														sql="select id,inid from endepot where enid="&clng(Request.Cookies("id"))&" order by id desc"
rs.open sql,conn,1,1



if rs.recordcount=0 then
           response.write "您暂时没有学员信息！<br>添加方法：找到需要的学员，在联系方式中点[添加到学员库]，即可收藏指定的学员信息。"
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
															<td height="30" width="45" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<p align="center">
															<font color="#0A5DF6">
														  <b>编号</b></font></td>
															<td height="30" width="77" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>姓名</b></font></td>
															<td height="30" width="99" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9"><strong><font color="#0A5DF6">辅导科目</font></strong></td>
															<td height="30" width="47" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>性别</b></font></td>
															<td height="30" width="101" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>单价[元/小时]</b></font></td>
															<td height="30" width="129" bordercolor="#C0C0C0" style="border: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<p align="center">
															<font color="#0A5DF6">
														  <b>操作</b></font></td>
														</tr>
														<%
set rs1=server.createobject("adodb.recordset")
for ii=1 to rs.pagesize
sql1="select * from in_user where id="&rs("inid")
rs1.open sql1,conn,1,1
%>	
												<tr>
															<td height="30" width="45" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><%=rs("id")%></td>
															<td height="30" width="77" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															<a target =_blank  href="student.asp?id=<%=rs1("id")%>">
															<%=rs1("name")%></a></td>
															<td height="30" width="99" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
						<%=rs1("infudao")%></td>
															<td height="30" width="47" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															[<%=rs1("sex")%>]</td>
															<td height="30" width="101" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															[<%=rs1("shixin")%>]</td>
															<td height="30" width="129" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															<p align="center">
															<a target="_blank" href="student.asp?id=<%=rs1("id")%>">
															<img border="0" src="images/cha_depot.gif" width="53" height="17"></a>
															<a onClick="{if(confirm('此操作将删除<<%=rs1("name")%>>的学员收录，继续吗？')){return true;}return false;}" href="del_endepot.asp?id=<%=rs("id")%>&page=<%=page%>">
												  <img border="0" src="images/del_depot.gif" width="53" height="17"></a></td>
													  </tr>
														<%
rs.movenext
if rs.eof then exit for
rs1.close
next
%>
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
rs.close
set rs1=nothing
set rs=nothing
set conn=nothing


%>                                        

      <SCRIPT language=vbscript>                               
sub nextpage(x)      
	alldel.page.value=x        
	alldel.action="control.asp?file=endepot.asp"
	window.event.returnvalue=false        
	alldel.submit()                           
end sub   


</SCRIPT>