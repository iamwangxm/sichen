<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE10 {font-size: 14px; color: #00659C; }
.STYLE11 {font-size: 14px; font-weight: bold; }
.STYLE12 {font-size: 14px; color: #FF0000; }
.STYLE6 {font-size: 14px; color: #FF0000; font-weight: bold; }
.STYLE9 {font-size: 14px; color: #006699; }
.STYLE13 {
	font-size: 12pt;
	font-weight: bold;
	color: #FF3399;
}
.STYLE7 {	font-size: 18pt;
	font-weight: bold;
}
-->
</style>

<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��¼��ʱ�����µ�¼��');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

                                  <p><span class="STYLE13">�ҽ�״̬����</span></p>
                                  <table width="434" border="0" align="center" cellspacing="0">
                                  <tr>
                                    <td width="404" height="85">&nbsp;&nbsp;&nbsp;&nbsp;��Ա����ӵ�����ļҽ�ҵ�񣬻���ʱ����Ӽҽ�ҵ�񣬵��ֲ�Ը��ע����Ա������£����ʹ�ñ����ܣ����ҽ�״̬����Ϊ���رա�״̬����ʱ��ļҽ���Ϣ�Ͳ�����ʾ������������Ҫ�ٴ�ʹ�üҽ̹���ʱ�������״̬Ϊ��������״̬�������Ϳ�������ʾ�ˡ�</td>
                                  </tr>
                                  <tr>
                                    <td height="114"><%
sql="select name,dw_view from en_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
%>
                                      <p>��Ա��Ա <font color=#ff0000><%=unhtml(rs("name"))%></font> ��ã�</p>
                                      <span class="STYLE1">�㵱ǰ״̬��:</span>
                                      <% if rs("dw_view")="N" then 
									 Response.Write "<font color=#ff0000><strong>����״̬</strong></font>"
									  else
									   Response.Write "<font color=#ff0000><strong>�ر�״̬</strong></font>"
									   end if 
								   %></td>
                                  </tr>
                                  <tr>
                                    <td><hr></td>
                                  </tr>
                                  <tr>
                                    <td height="28">�㽫����״̬Ϊ�������벻Ҫ���ã���</td>
                                  </tr>
                                  <tr>
                                    <td height="72"><div align="center">
                                        <form method="POST" action="dw_viewdata.asp">
                                          <INPUT TYPE="radio" <%if rs("dw_view") ="N" then Response.Write "checked"%> VALUE="N" NAME="dw_view">
                                          ����״̬
                                          <INPUT TYPE="radio" <%if rs("dw_view") ="Y" then Response.Write "checked"%> VALUE="Y" NAME="dw_view" >
                                          �ر�״̬ <br>
                                          <br>
                                          <input type="submit" value="ȷ������" name="G1">
                                        </form>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td height="76"><p>˵����
                                       ״̬Ϊ������״̬��ʱ�������Ϣ������ʾ��</br>
                                      ״̬Ϊ���ر�״̬��ʱ�������Ϣ��ʱ����ʾ��</br>
                                    ����ʱ�ɸ�����ʾ״̬��VIP��Աר�У��� </p></td>
                                  </tr>
                                </table>
                                  <p><br>
                                  </p>
                                <p><span class="STYLE7"><img src="images/jtou.gif" width="16" height="16"><a href="law.asp?id=5&what=��ͨ��Ա�û���VIP��Ա�û����" target="_blank"><font color=#ff0000>������VIP��Ա�����ܱ�վ��ֵ���񣡣�</font></a></span> </p></td>

<%
rs.close
set rs=nothing
set conn=nothing
%>  