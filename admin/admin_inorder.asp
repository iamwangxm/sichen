<!--#include file="../conn.asp"-->
<!--#include file="../unhtml.asp"-->
<!--#include file="../ubb.asp"-->
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
<title>学员预约教员情况管理</title>
<base target="_self">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<body bgcolor="#CAD7F7" vlink="#000000">


<table border="0" width="100%" cellspacing="0" cellpadding="4" bgcolor="#FFFFFF" style="border:1px solid #000000; " height="229">
	<tr>
		<td background="images/admin_bg_1.gif" height="25" colspan="6">
		<p align="center"><font size="2" color="#FFFFFF"><b>学员预约教员情况</b></font></td>
	</tr>

											<tr>
												<td height="322" valign="top">
                                                <FORM name=alldel  method=post>                                                
												<div align="center">
													<table border="0" width="620" cellspacing="0" cellpadding="0" id="table6">
														<%
sql="select id,inid,enid,addtime from inorder"
rs.open sql,conn,1,1
if rs.recordcount=0 then
           response.write "没预约信息。"
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
															<td height="30" width="96" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>学员姓名</b></font></td>
                                                                                                                    

															<td height="30" width="96" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>教员姓名</b></font></td>
															<td height="30" width="118" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>辅导科目</b></font></td>
															<td height="30" width="136" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>辅导方式</b></font></td>
															<td height="30" width="136" align="center" bordercolor="#C0C0C0" style="border-left:1px solid #C0C0C0; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<font color="#0A5DF6">
															<b>预约时间</b></font></td>                                                            
															<td height="30" width="123" bordercolor="#C0C0C0" style="border: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#D9D9D9">
															<p align="center">
															<font color="#0A5DF6">
														  <b>操作</b></font></td>
														</tr>
														<%

													
														
set rs1=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")

for ii=1 to rs.pagesize
sql1="select * from en_user where id="&rs("enid")
rs1.open sql1,conn,1,1

sql2="select * from in_user where id="&rs("inid")
rs2.open sql2,conn,1,1



%>	
												<tr>
															<td height="30" width="96" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															<a target =_blank  href="../student.asp?id=<%=rs2("id")%>">
															<%=rs2("name")%></a></td>
                                                                                                                        
															<td height="30" width="96" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															<a target =_blank  href="../teacher.asp?id=<%=rs1("id")%>">
															<%=rs1("name")%></a></td>
															<td height="30" width="118" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
																														<%=rs1("enfudao")%></td>
															<td height="30" width="136" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><%=rs1("fwff")%></td>
															
                                                            <td height="30" width="136" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><%=rs("addtime")%></td>
                                                                                                                        
															<td height="30" width="123" align="center" bordercolor="#C0C0C0" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
															<p align="center">
															<a href="../teacher.asp?id=<%=rs1("id")%>" target="_blank">
															<img border="0" src="../images/cha_depot.gif" width="53" height="17"></a>
															<a onClick="{if(confirm('此操作将删除教员的<<%=rs1("name")%>>信息，继续吗？')){return true;}return false;}" href="../del_inorder.asp?id=<%=rs("id")%>&page=<%=page%>">
												  <img border="0" src="../images/del_depot.gif" width="53" height="17"></a></td>
													  </tr>
														<%
rs.movenext
if rs.eof then exit for
rs1.close
rs2.close
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
	alldel.action="admin_inorder.asp"
	window.event.returnvalue=false        
	alldel.submit()                           
end sub   


</SCRIPT>
</body>

</html>