<!--#include file="conn.asp"-->
<table width="90%" height="242" border="0" cellpadding="0" cellspacing="0" id="table5">
                                            <tr>
                                              <td align="center" valign="top"><table height="629" border="0" cellpadding="0" cellspacing="0" id="table6">
                                                  <tr>
                                                    <td height="30" colspan="3"><font color="#000000"><b>&nbsp;&nbsp;&nbsp; </b></font><b> <font color="#0A5DF6">亲爱的教员用户：<%=Request.Cookies("ac")%>，您好！欢迎加入思辰教育家教网，我们将为您提供最贴切的服务！</font></b></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="30" colspan="3"><p align="left"><b> 以下是您的站内基本信息：</b>【<img src="images/jtou.gif" width="16" height="16"><a href="law.asp?id=5&what=普通教员用户与VIP教员用户差别" target="_blank">了解普通用户与VIP用户差别</a>】</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="29" width="156" align="left">用户类别：</td>
                                                    <td height="29" width="18" align="left"> 　</td>
                                                    <td height="29" width="296"><font color="#FF0000">
                                                      <%
														if Request.Cookies("vip")="true" then
														response.write "VIP高级"
														else
														response.write "普通级别"
                                                        end if
														%>
                                                      </font>教员用户&nbsp; 
                                                      会员编号：<font color=#ff0000><strong>
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
                                                    <td height="29" width="156" align="left">您的站内信息：</td>
                                                    <%
											         sql="select id from message where ttype='"&Request.Cookies("user")&"' and tid="&clng(Request.Cookies("id"))
											         rs.open sql,conn,1,1
										            %>
                                                    <td height="29" width="18" align="left"> 　</td>
                                                    <td height="29" width="296"><%=rs.recordcount%>条</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="31" width="156" align="left">您的学员收藏：</td>
                                                    <%
														rs.close
														sql="select id from endepot where enid="&clng(Request.Cookies("id"))
														rs.open sql,conn,1,1
														%>
                                                    <td height="31" width="18" align="left"> 　</td>
                                                    <td height="31" width="296"><%=rs.recordcount%>个</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="30" width="156" align="left"> 您的资料被阅：</td>
                                                    <%
														rs.close
														sql="select clicks from en_user where id="&clng(Request.Cookies("id"))
														rs.open sql,conn,1,1
														if rs.eof or rs.bof then
														rs.close 
														response.redirect "nodata.html"
											            end if 							
														%>
                                                    <td height="30" width="18" align="left"> 　</td>
                                                    <td height="30" width="296"><%=rs("clicks")%>次</td>
                                                  </tr>
                                                  <tr>
                                                    <td height="12" align="left"><font color=#ff00000>推荐服务开始时间：</font></td>
                                                    <td height="12" align="left">&nbsp;</td>
                                                    <td height="12" align="left"><%
														rs.close
														sql="select picdays,picdate,rz from en_user where id="&clng(Request.Cookies("id"))
														rs.open sql,conn,1,1							
														 if not(isnull(rs("picdate"))) then 
														 response.write rs("picdate")
														 else 
														response.write "你暂没有申请推荐/图片服务！！"
														end if %>
                                                    </td>
                                                  </tr>
                                                  <tr>
                                                    <td height="12" align="left"><font color=#ff00000>推荐服务总天数：</font></td>
                                                    <td height="12" align="left">&nbsp;</td>
                                                    <td height="12" align="left"><%
																	
														 if not(isnull(rs("picdays"))) then 
														 response.write rs("picdays") 
													     response.write"天"
														 else 
														response.write "你暂没有申请付费服务！！"
														end if %></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="6" align="left"><font color=#ff00000>已提供服务天数：</font></td>
                                                    <td height="12" rowspan="3" align="left">&nbsp;</td>
                                                    <td height="12" align="left"><% if  date()-rs("picdate")>rs("picdays")then
													  response.write "你申请付费服务已到期！！"
													  else
													  response.write date()-rs("picdate")&"天"													  end if 
													  %></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="6" rowspan="2" align="left">◆◆身份状态◆◆：</td>
                                                    <td height="12" align="left"><% if  rs("rz")=true then
													  response.write "<font color=#0033CC>★★认证会员★★</font>"
													  else
													  response.write "<font color=#0033CC>●●非认证会员●●</font>"
													  end if 
													  %>
                                                      [会员认证是免费的，<a href="rz.html" target="_blank">详情</a>] </td>
                                                  </tr>
                                                  <tr>
                                                    <td height="12" align="left"><div align="center"><strong>【<a href="en_uppic.asp">在线提交证照审核</a>】</strong></div></td>
                                                  </tr>
                                                  <tr>
                                                    <td height="36" align="left" colspan="3">　
                                                      <p><b>提示：只有所有必填信息填写完毕您的资料才可能被学员所搜索</b></p>
                                                      <p align="center" class="STYLE7"><img src="images/jtou.gif" width="16" height="16"><a href="law.asp?id=5&what=普通教员用户与VIP教员用户差别" target="_blank"><font color=#ff0000>升级成VIP会员，享受本站超值服务！！</font></a></p>
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