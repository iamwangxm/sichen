<!--#include file="conn.asp"-->
<table border="0" cellspacing="0" cellpadding="0" id="table5" height="242">
    <tr>
      <td valign="top"><table border="0" cellspacing="0" cellpadding="0" id="table6" height="564">
          <tr>
            <td height="30" colspan="3"><font color="#000000"><b>&nbsp;&nbsp;&nbsp; </b></font><b> <font color="#0A5DF6">�װ���ѧԱ�û���<%=Request.Cookies("ac")%>�����ã���ӭ����˼�������ҽ��������ǽ�Ϊ���ṩ�����еķ���</font></b></td>
          </tr>
          <tr>
            <td colspan="3"></td>
          </tr>
          <tr>
            <td height="30" colspan="3"><p align="left"><b> ����������վ�ڻ�����Ϣ�� </b><!--��<img src="images/jtou.gif" width="16" height="16"><a href="yfcb_gr.html" target="_blank">�˽���ͨ�û���VIP�û����</a>��--></td>
          </tr>
          <tr>
            <td height="30" width="130" align="left"><p align="right">�û����</td>
            <td height="30" width="12" align="left"> ��</td>
            <td height="30" width="328"><font color="#FF0000">
              <%
                if Request.Cookies("vip")="true" then
                response.write "VIP�߼�"
                else
                response.write "��ͨ����"
                end if
                %>
              </font>ѧԱ�û�&nbsp; 
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
            <td height="30" width="130" align="left"><p align="right"> ����վ����Ϣ��</td>
            <%
    sql="select id from message where ttype='"&Request.Cookies("user")&"' and tid="&clng(Request.Cookies("id"))
    rs.open sql,conn,1,1
%>
            <td height="30" width="12" align="left"> ��</td>
            <td height="30" width="328"><%=rs.recordcount%>��</td>
          </tr>
          <tr>
            <td height="30" width="130" align="left"><p align="right">���ղؽ�Ա��</td>
            <%
                rs.close
                sql="select id from indepot where inid="&clng(Request.Cookies("id"))
                rs.open sql,conn,1,1
                %>
            <td height="30" width="12" align="left"> ��</td>
            <td height="30" width="328"><%=rs.recordcount%>��</td>
          </tr>
          <tr>
            <td height="30" width="130" align="left"><p align="right"> �������ϱ��ģ�</td>
            <%
                rs.close
                sql="select clicks from in_user where id="&clng(Request.Cookies("id"))
                rs.open sql,conn,1,1
                if rs.eof or rs.bof then
rs.close 
response.redirect "nodata.html"

end if 							
                %>
            <td height="30" width="12" align="left"> ��</td>
            <td height="30" width="328"><%=rs("clicks")%>��</td>
          </tr>
          <tr>
            <td height="15" width="130" align="left"><p align="right"> ��¼�����Ľ�Ա��</td>
            <%
                rs.close
                sql="select id from endepot where inid="&clng(Request.Cookies("id"))
                rs.open sql,conn,1,1							
                %>
            <td width="12" height="18" align="left"> ��</td>
            <td width="328" height="15"><%=rs.recordcount%>��</td>
          </tr>
          <tr>
            <td height="12" align="left"><div align="right" ><font color=#ff0000>�Ƽ�����ʼʱ�䣺</font></div></td>
            <td height="12" align="left">&nbsp;</td>
            <td height="12" align="left"><%
                rs.close
                sql="select picdays,picdate,rz from in_user where id="&clng(Request.Cookies("id"))
                rs.open sql,conn,1,1							
                 if not(isnull(rs("picdate"))) then 
                 response.write rs("picdate")
                 else 
                response.write "����û�����븶���Ƽ����񣡣�"
                end if %>                                                    </td>
          </tr>
          <tr>
            <td height="12" align="left"><div align="right"><font color=#ff0000>�Ƽ�������������</font></div></td>
            <td height="12" align="left">&nbsp;</td>
            <td height="12" align="left"><%
                            
                 if not(isnull(rs("picdays"))) then 
                 response.write rs("picdays") 
                 response.write"��"
                 else 
                response.write "����û������ͼƬ���񣡣�"
                end if %></td>
          </tr>
          <tr>
            <td height="6" align="left"><div align="right"><font color=#ff0000>�Ƽ�������������</font></div></td>
            <td height="12" rowspan="2" align="left">&nbsp;</td>
            <td height="12" align="left"><% if  date()-rs("picdate")>rs("picdays")then
              response.write "�����븶�ѷ����ѵ��ڣ���"
              else
              response.write date()-rs("picdate")&"��"													  end if 
              %></td>
          </tr>
          <tr>
            <td height="6" align="left"><div align="right">�������״̬������</div></td>
            <td height="6" align="left"><% if  rs("rz")=true then
              response.write "<font color=#0033CC>�����֤��Ա���</font>"
              else
              response.write "<font color=#0033CC>������֤��Ա���</font>"
              end if 
              %>
              [��Ա��֤����ѵģ�<a href="rz.html" target="_blank">����</a>] </td>
          </tr>
          <tr>
            <td height="259" align="left" colspan="3">��<b>��ʾ��ֻ�����б�����Ϣ��д��Ϻ��������ϲſ��ܱ���Ա������</b><br>
              <!--&nbsp;&nbsp;&nbsp;<span class="STYLE2"><span class="STYLE7"><img src="images/jtou.gif" width="16" height="16"><a href="yfcb_gr.html" target="_blank"><font color=#ff0000>������VIP��Ա�����ܱ�վ��ֵ����</font></a></span></span--></td>
          </tr>
      </table></td>
    </tr>
</table>

<%
rs.close
set rs=nothing
set conn=nothing
%>