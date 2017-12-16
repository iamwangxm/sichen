<!--#include file="area.asp"-->
<TABLE width="99%" border=0 cellPadding=0 cellSpacing=0 >
              <TBODY>
                <TR>
                  <TD vAlign=top >
						  <%
                          sql="select top 5 id,name,sex,trade,enfudao,fund,rdate,vip,city,town,servercity,xian from en_user where trade='教师'  order by vip asc,gotop desc,id desc"
                          rs.open sql,conn,1,1
                          if rs.eof or rs.bof then
                                     response.write "暂无教员信息！"
                                     rs.close
                                     else
                          %>
                    <table width="100%"  height="75" border="0" cellpadding="0"  cellspacing="0" id="table12">
                                  
							   <%
                                for ii=1 to 5

                                %>
                                  <tr>
                                    <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;   padding-left:12" width="96" height="25"><a target =_blank  href="teacher.asp?id=<%=rs("id")%>"><%=left(unhtml(rs("name")),1)%>教员</a>
                                    </td>
                                    <td width="96" height="25" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " >
                                    专业<%=unhtml(rs("trade"))%> | <%=unhtml(rs("sex"))%></td>
                                    <td height="25" colspan="2"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">服务区域:<%Call Showarea(unhtml(rs("servercity")))%></td>
                                  </tr>
                                  <tr>
                                    <td width="96" height="25" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;   padding-left:12"    background="images/bg1.gif"></td>
                                    <td height="25" colspan="3" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "    background="images/bg1.gif">擅长科目:<font color=#ff0000><%=left(unhtml(rs("enfudao")),40)%></font></td>
                                  </tr>
                            <%
							rs.movenext
							if rs.eof then exit for
							next
							rs.close
							end if
							%>	
                          </table>
                      </TD>
                </TR>
                <TR>
                  <TD height=5></TD>
                </TR>
              </TBODY>
            </TABLE>