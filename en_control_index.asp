<!--#include file="conn.asp"-->
<table width="90%" height="242" border="0" cellpadding="0" cellspacing="0" id="table5">
                                            <tr>
                                              <td align="center" valign="top"><table height="629" border="0" cellpadding="0" cellspacing="0" id="table6">
                                                  <tr>
                                                    <td height="30" colspan="3"><font color="#000000"><b>&nbsp;&nbsp;&nbsp; </b></font><b> <font color="#0A5DF6">�װ��Ľ�Ա�û���<%=Request.Cookies("ac")%>�����ã���ӭ����˼�������ҽ��������ǽ�Ϊ���ṩ�����еķ���</font></b></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="30" colspan="3"><p align="left"><b> ����������վ�ڻ�����Ϣ��</b>��<img src="images/jtou.gif" width="16" height="16"><a href="law.asp?id=5&what=��ͨ��Ա�û���VIP��Ա�û����" target="_blank">�˽���ͨ�û���VIP�û����</a>��</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="29" width="156" align="left">�û����</td>
                                                    <td height="29" width="18" align="left"> ��</td>
                                                    <td height="29" width="296"><font color="#FF0000">
                                                      <%
														if Request.Cookies("vip")="true" then
														response.write "VIP�߼�"
														else
														response.write "��ͨ����"
                                                        end if
														%>
                                                      </font>��Ա�û�&nbsp; 
                                                      ��Ա��ţ�<font color=#ff0000><strong>
                                                                    <%
														if Request.Cookies("user")="1" then
														response.write "ST"&Request.Cookies("id")
														else
														response.write "TE"&Request.Cookies("id")
														end if
														%>
                                                      </strong></font></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="29" width="156" align="left">����վ����Ϣ��</td>
                                                    <%
											         sql="select id from message where ttype='"&Request.Cookies("user")&"' and tid="&clng(Request.Cookies("id"))
											         rs.open sql,conn,1,1
										            %>
                                                    <td height="29" width="18" align="left"> ��</td>
                                                    <td height="29" width="296"><%=rs.recordcount%>��</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="31" width="156" align="left">����ѧԱ�ղأ�</td>
                                                    <%
														rs.close
														sql="select id from endepot where enid="&clng(Request.Cookies("id"))
														rs.open sql,conn,1,1
														%>
                                                    <td height="31" width="18" align="left"> ��</td>
                                                    <td height="31" width="296"><%=rs.recordcount%>��</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="30" width="156" align="left"> �������ϱ��ģ�</td>
                                                    <%
														rs.close
														sql="select clicks from en_user where id="&clng(Request.Cookies("id"))
														rs.open sql,conn,1,1
														if rs.eof or rs.bof then
														rs.close 
														response.redirect "nodata.html"
											            end if 							
														%>
                                                    <td height="30" width="18" align="left"> ��</td>
                                                    <td height="30" width="296"><%=rs("clicks")%>��</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="12" align="left"><font color=#ff00000>�Ƽ�����ʼʱ�䣺</font></td>
                                                    <td height="12" align="left">&nbsp;</td>
                                                    <td height="12" align="left"><%
														rs.close
														sql="select picdays,picdate,rz from en_user where id="&clng(Request.Cookies("id"))
														rs.open sql,conn,1,1							
														 if not(isnull(rs("picdate"))) then 
														 response.write rs("picdate")
														 else 
														response.write "����û�������Ƽ�/ͼƬ���񣡣�"
														end if %>
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <td height="12" align="left"><font color=#ff00000>�Ƽ�������������</font></td>
                                                    <td height="12" align="left">&nbsp;</td>
                                                    <td height="12" align="left"><%
																	
														 if not(isnull(rs("picdays"))) then 
														 response.write rs("picdays") 
													     response.write"��"
														 else 
														response.write "����û�����븶�ѷ��񣡣�"
														end if %></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="6" align="left"><font color=#ff00000>���ṩ����������</font></td>
                                                    <td height="12" rowspan="3" align="left">&nbsp;</td>
                                                    <td height="12" align="left"><% if  date()-rs("picdate")>rs("picdays")then
													  response.write "�����븶�ѷ����ѵ��ڣ���"
													  else
													  response.write date()-rs("picdate")&"��"													  end if 
													  %></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="6" rowspan="2" align="left">�������״̬������</td>
                                                    <td height="12" align="left"><% if  rs("rz")=true then
													  response.write "<font color=#0033CC>�����֤��Ա���</font>"
													  else
													  response.write "<font color=#0033CC>������֤��Ա���</font>"
													  end if 
													  %>
                                                      [��Ա��֤����ѵģ�<a href="rz.html" target="_blank">����</a>] </td>
                                                  </tr>
                                                  <tr>
                                                    <td height="12" align="left"><div align="center"><strong>��<a href="en_uppic.asp">�����ύ֤�����</a>��</strong></div></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="36" align="left" colspan="3">��
                                                      <p><b>��ʾ��ֻ�����б�����Ϣ��д����������ϲſ��ܱ�ѧԱ������</b></p>
                                                      <p align="center" class="STYLE7"><img src="images/jtou.gif" width="16" height="16"><a href="law.asp?id=5&what=��ͨ��Ա�û���VIP��Ա�û����" target="_blank"><font color=#ff0000>������VIP��Ա�����ܱ�վ��ֵ���񣡣�</font></a></p>
                                                       </td>
                                                  </tr>
                                              </table></td>
                                            </tr>
                                          </table>
<%
rs.close
set rs=nothing
set conn=nothing
%>