<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="area.asp"-->
<!--#include file="unhtml.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��Ա�б� - <%=webname%></title>
<style type="text/css">
<!--
.STYLE1 {color: #006666}
.STYLE14 {color: #FF3399}
-->
</style>
</head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="106">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD"  valign="top">
			<div align="center">
				<table border="0" width="98%" cellspacing="0" cellpadding="0" id="table2" height="164">
					<tr>
						<td  valign="top">
						<div align="center">
							<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3" height="147">
								<tr>
									<td height="40" width="740" background="images/bg10.gif">
									<table border="0" width="740" cellspacing="0" cellpadding="0" id="table4" height="31">
										<tr>
											<td width="127" height="40">��</td>
											<form method="POST" action="grqz2.asp">
											<td width="587">
											&nbsp;&nbsp;&nbsp;
												<SELECT SIZE="1" NAME="job" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF">
<OPTION VALUE="0" selected>::��ѡ�񸨵���Ŀ::</OPTION>
<option value="0">����</option>
<%
call listjob("")
%>
</SELECT>  
<SELECT ID=create_date NAME=date size="1"> 
<option selected value="����">��ѡ�񷢲�ʱ��</option>
<OPTION VALUE="����">����</OPTION> <OPTION VALUE="7">һ������</OPTION> 
<OPTION VALUE="30">һ������</OPTION> <OPTION VALUE="183">��������</OPTION> 
</SELECT>
										<% if Request.Cookies("i_fullness")="ok" then %>	<input type="submit" value="ɸѡ" name="B2">
<%else
response.write "<font color=#FF0000>��¼������,����ѧԱ�û�(����������)ʹ��</font>"
end if %>
										</td>
</form>
										</tr>
										<tr>
										  <td colspan="2" bgcolor="#FFFFFF"></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td valign="top" align="center">
									<%
sql="select * from  en_user where lock=false "
if request("job")<>"0" and request("job")<>"" then sql=sql+" and enfudao like '%"&request("job")&"%'"
if request("date")<>"����" and request("date")<>"" then sql=sql+" and datediff('d',rdate,Now())<"&request("date")
sql=sql+" order by vip asc,gotop desc,id desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
rs.close
response.write "��ʱû����ؽ�Ա��" 
else
rs.pagesize=15
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
%>
								<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table5" height="92">
									<tr>
										<td width="80" height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;    padding-left:12"><strong>��Ա����</strong></td>
										<td width="100" height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>��Ա���</b></td>
										<td width="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>�Ա�</b></td>
										<td width="101" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>ʱн(Ԫ)</b></td>
										<td width="72" height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>ע������</b></td>
										<td width="64" height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>��������</b></td>
										<td width="109" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">&nbsp;</td>
										<td width="99" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">&nbsp;</td>
									</tr>
<%
for ii=1 to 20

%>	
								<tr>
										<td width="80" height="30" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;    padding-left:12"><a href="job2.asp?<%=rs("id")%>" target="_blank"></a><a target =_blank  href="teacher.asp?id=<%=rs("id")%>">
								
                                 <%if Request.Cookies("user")<>"1" and Request.Cookies("ac")<>rs("ac") then %>
								<%=left(unhtml(rs("name")),1)%>��Ա <%else%><%=unhtml(rs("name"))%><%end if%>
                                                            </a>
								<%
                                if (date()-rs("rdate"))<=10 then 

								response.write "<img  alt='���¼�����Ƹְλ' src=images/hot.gif>"
								end if %>
                                                                                            
                                        </td>
										<td width="100" height="30"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><%=unhtml(rs("trade"))%>
								        </td>
										<td width="30" height="30"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><%=unhtml(rs("sex"))%></td>
										<td width="101" height="30"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><%=unhtml(rs("fund"))%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="72" height="30" >
								  
								    <%
									  a=instr(rs("rdate"),chr(32))-1
								      response.write Mid(rs("rdate"),1,a)
								    %>
								  </td>
										<td height="30" colspan="3"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><%Call Showarea(unhtml(rs("servercity")))%></td>
								  </tr>
                                    
                                    
                                    
									<tr>
									  <td height="30" align="center"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "  background="images/bg1.gif"></td>
										<td height="30" colspan="7"   style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "  background="images/bg1.gif">�ó���Ŀ��<font color=#ff0000><%=left(unhtml(rs("enfudao")),60)%></font></td>
									</tr>
                                    
                                                                        
<%
rs.movenext
if rs.eof then exit for
next
%>
								<tr>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " height="42" align="center" colspan="7"><table width="650" border="0" cellspacing="0">
                                          <tr>
                                            <td>&nbsp;</td>
                                          </tr>
                                          <tr>
                                            <td><span class="STYLE14">����ְλ����-&gt;�����������Ա���ͣ��磺���������߿�Ӣ��������Ρ�Сѧ��ѧ���������ģ���</span></td>
                                          </tr>
                                        </table>
										<table border="0" width="504" cellspacing="0" cellpadding="0" height="31">
						<tr>
							<td width="120">
							<p align="center">��ǰҳ��:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="225">
							<p align="center">&lt; <a href="grqz2.asp?action=f&infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>">��ҳ</a>&nbsp;
							<a href="grqz2.asp?action=p&infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>">��һҳ</a>&nbsp;
							<a href="grqz2.asp?action=n&infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>">��һҳ</a>&nbsp;
							<a href="grqz2.asp?action=l&infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>">βҳ</a> &gt;</td>
							<form method="POST" action="grqz2.asp?infudao=<%=request("infudao")%>&job=<%=request("job")%>&date=<%=request("date")%>">
							<td width="159">							
		<p>��ת�� 
		<input type="text" name="page1" size="4" style="border: 1px solid #000000"> ҳ&nbsp; 
	<input type="submit" value="�ύ" name="B1"></p></td>
</form>
						</tr>
					</table></td>
									</tr>
									</table>
									<%
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
</div>
<%
set rs2=nothing
set rs=nothing
set conn=nothing
%>

<!--#include file="base.asp"-->
</body>

</html>