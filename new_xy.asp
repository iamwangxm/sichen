<%
sql="select top 5 id,name,sex,rdate,zxnj,fdfs,infudao,shixin,city,town,xian,vip,state,rdate from in_user where lock=false and name<>''   order by rdate desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
rs.close
response.write "��ʱû��ѧԱ�û���" 
else
%>
 <table width="99%" height="75" border="0" cellpadding="0"   cellspacing="0" id="table12">
	<tr>
										<td height="25"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;   padding-left:12" width="82"   background="images/bg1.gif">
										
									  <b>ѧԱ����</b></td>
										<td height="25"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="38"   background="images/bg1.gif">
										
									  <b>�Ա�</b></td>
	  <td height="25"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="68"  background="images/bg1.gif"><span style="font-weight: bold">������ʽ</span></td>
	  <td height="25"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "   background="images/bg1.gif"><strong>���ڵ���</strong></td>
	  <td height="25"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="100"   background="images/bg1.gif"><STRONG>ʱн(Ԫ)</STRONG></td>
      <td  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="100"   background="images/bg1.gif"><STRONG>״̬</STRONG></td>
									</tr>
<%
'rs.movelast
for ii=1 to 10
%>	
								<tr>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;   padding-left:12" width="82" height="25" ><a  target =_blank href="student.asp?id=<%=rs("id")%>"><%=left(unhtml(rs("name")),1)%>ѧԱ</a></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="38" height="25" >
										<%=unhtml(rs("sex"))%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="68" height="25" >
										<%=unhtml(rs("fdfs"))%></td>
										<td height="25" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " ><%
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
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="100" height="25" ><%=unhtml(rs("shixin"))%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="100" ><%if rs("state")=true then response.write"�Ѱ���" else response.write"<font color='red'>�ȴ�����</font>"%></td>
								  </tr>
								<tr>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;   padding-left:12" height="25"   background="images/bg1.gif">&nbsp;</td>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " height="25"   background="images/bg1.gif">&nbsp;</td>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " height="25"   background="images/bg1.gif">&nbsp;</td>
								  <td height="25" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "   background="images/bg1.gif">������Ŀ��<font color=#ff0000><%=unhtml(rs("infudao"))%></font></td>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " height="25"   background="images/bg1.gif">&nbsp;</td>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "   background="images/bg1.gif">&nbsp;</td>
   </tr>
<%
rs.movenext
if rs.eof then exit for
next
rs.close
%>
								</table>
<%
end if
%>