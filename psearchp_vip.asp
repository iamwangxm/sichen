<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="area.asp"-->
<!--#include file="unhtml.asp"-->
<%
if Request.Cookies("user")="1" then  
response.write "<script language=JavaScript>" & chr(13) & "alert('ѧԱ�û���ֱ����������Ա��Ϣ����ѧԱ����������רΪ��Ա�û��ṩ�ģ�');"& "JavaScript:window.close();" & " </script>"
Response.End
end if


if Request.Cookies("e_fullness")<>"ok" and request("flag")<>1 then 'flag=1��ʾ����ҳ���������
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ա�û���ã�������ϻ�û���꣬��������Ϻ����������˲���Ϣ��');"& "JavaScript:window.close();" & " </script>"
Response.End
end if


sql="select * from in_user where name<>'' and lock=false"
if request("city")<>"0"  then sql=sql+" and city='"&request("city")&"'"
if request("town")<>"0"  then sql=sql+" and town='"&request("town")&"'"
if request("cs")<>""  then sql=sql+" and xian='"&request("cs")&"'"
if request("fw")<>"" then sql=sql+" and fdfs='"&request("fw")&"'"
if request("sex")<>"" then sql=sql+" and sex='"&request("sex")&"'"
if request("job")<>"0" and request("job")<>"" then sql=sql+" and infudao='"&request("job")&"'"
if request("date")<>"����" and request("date")<>"" then sql=sql+" and datediff('d',rdate,Now())<"&request("date")
sql=sql+" order by vip asc,gotop desc,id desc"

rs.open sql,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>ѧԱ�������� - <%=webname%></title>
<style type="text/css">
<!--
.STYLE1 {font-weight: bold}
-->
</style></head>

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
									<td height="40" width="740" background="images/bg20.gif">
									<table border="0" width="740" cellspacing="0" cellpadding="0" id="table4" height="31">
										<tr>
											<td width="127">��</td>
											<td width="587">
											<p align="center">���������
   											<%Call Showarea2(request("city"),request("town"))%>
											<%
											if request("cs")="" then
											response.write "����"
											else
											response.write request("cs")
											end if
											%> 
                                            
											������Ŀ��<b>
											<%
											if request("job")="0" then
											response.write "���п�Ŀ"
											else
											response.write request("job")
											end if
											%>
											</b> 
											����ʽ��<b>
											<%
											if request("fw")="" then
											response.write "����"
											else
											response.write request("fw")
											end if
											%></b>
									       
								          �Ա�<b>
								          <%
											if request("sex")="" then
											response.write "����"
											else
											response.write request("sex")
											end if
											%></b>
											 ʱ�䣺<b>
								          <%
											if request("date")="" then
											response.write "����"
											else
											response.write request("date")
											end if
											%>
								          </b> �ҵ���¼��<b><font color=#ff0000><%=rs.recordcount%></font></b></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td valign="top" align="center">
<%
if rs.recordcount=0 then
rs.close
response.write "<br>��ʱû�����ѧԱ��Ϣ������������ԭ��<br>1��ѧԱ����û����Ӧ��ѧԱ��<br>2����ָ�����������໥ì�ܣ�<br><br><font color=#ff0000>������ſ��ѯ�������ԣ���</font>" 
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
									<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table5" height="132">
									<tr>
										<td width="78" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
										<b>ѧԱ����</b></td>
										<td width="98" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
										<b>������ʽ</b></td>
										<td height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
									    <b>��������</b></td>
										<td width="70" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
															<b>�Ա�</b></td>
										<td width="102" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
															<b>ʱн(Ԫ)</b></td>
										<td width="111" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
										<b>ע������</b></td>
									</tr>
<%
for ii=1 to 15
%>	
								<tr>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;     padding-left:12" width="78" height="30" ><a  target =_blank href="student.asp?id=<%=rs("id")%>">
                                <%if Request.Cookies("user")<>"2" and Request.Cookies("ac")<>rs("ac") then %>
								<%=left(unhtml(rs("name")),1)%>ѧԱ <%else%><%=unhtml(rs("name"))%><%end if%>
                                        
                                        </a></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="98" height="30" align="center" >								  
										<%=unhtml(rs("fdfs"))%>
								  </td>
										<td height="30" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " ><%
                  set rss=server.createobject("adodb.recordset")
sqls="select * from city where cityNo="&int(rs("city"))
rss.open sqls,conn,1,1
if rss.eof then

end if
if rs("city") =0 then
response.write "����"
end if
               Cityid=rss("id")
               city=rss("cityname")
                rss.close
                set rss=nothing
                %>
										  <%
                  set rss=server.createobject("adodb.recordset")
sqls="select * from town where Cityid="&Cityid&" and  TownNo="&int(rs("town"))
rss.open sqls,conn,1,1
if rss.eof then

end if

               town=rss("townname")
                rss.close
                set rss=nothing
                %>
									    <%=unhtml(city)%><%=unhtml(town)%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="70" height="30" align="center" ><%=unhtml(rs("sex"))%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="102" height="30" align="center" ><%=unhtml(rs("shixin"))%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="111" height="30" align="center" ><%
								if (date()-rs("rdate"))<=10 then 										
								a=instr(rs("rdate"),chr(32))-1
								response.write "<font color =#FF0000>" 
								response.write Mid(rs("rdate"),6,a-4)
								response.write "<img  alt='���¼�����˲�' src=images/new.gif>"
								end if 										
								if (date()-rs("rdate"))>10 then 		
								a=instr(rs("rdate"),chr(32))-1
								response.write Mid(rs("rdate"),1,a)
								end if 
								%>
								  ��</td>
									</tr>
								<tr>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;     padding-left:12" height="30" background="images/bg1.gif">&nbsp;</td>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " height="30" align="center" background="images/bg1.gif">&nbsp;</td>
								  <td height="30" colspan="4" background="images/bg1.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">������Ŀ��<font color=#ff0000><%=unhtml(rs("infudao"))%></font></td>
								  </tr>
<%
rs.movenext
if rs.eof then exit for
next
%>
								<tr>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " height="42" align="center" colspan="7"><table border="0" width="504" cellspacing="0" cellpadding="0" height="31">
						<tr>
							<td width="120">
							<p align="center">��ǰҳ��:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="225">
							<p align="center">&lt; <a href="psearchp_vip.asp?action=f&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">��ҳ</a>&nbsp;&nbsp;   
							<a href="psearchp_vip.asp?action=p&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">��һҳ</a>&nbsp;&nbsp;   
							<a href="psearchp_vip.asp?action=n&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">��һҳ</a>&nbsp;&nbsp;   
							<a href="psearchp_vip.asp?action=l&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">βҳ</a> &gt;</td>   
							<form method="POST" action="psearchp_vip.asp?city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">
							<td width="159">							
		<p>��ת��    
		<input type="text" name="page1" size="4" style="border: 1px solid #000000"> ҳ&nbsp;    
	<input type="submit" value="�ύ" name="B1"></p>
</td>
</form>
						</tr>
					</table>
</td>
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
set rs=nothing
set conn=nothing
%>

<!--#include file="base.asp"-->
</body>

</html>