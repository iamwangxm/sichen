<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<style type="text/css">
<!--
.STYLE4 {color: #FF0000; font-weight: bold; }
.STYLE6 {	font-size: 12pt;
	color: #0033CC;
}
.STYLE7 {font-size: 12px}
.STYLE8 {	font-size: 18pt;
	font-weight: bold;
}
-->
</style>
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½���¼��ʱ�������µ�¼���������');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>


<table border="0" width="93%" cellspacing="0" cellpadding="0" id="table5">
											<tr>
												<td height="40">
												<p align="center"><b>��Ա��Ϣ��������ǰ����</b>                                                
												<p align="left"><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE7">���Ž�Ա�����ӣ������Ϣ���ܻᱻ�ú���ʾ��������������Ļ��ʻ��󽵵ͣ��Ӷ��ҽ̳ɹ���Ҳ���½�����վ�ر�Ϊ��Ա�û��Ƴ���Ϣ������������ʱ�����������Ϣ��ʾλ�á�ͬʱ�����ڱ�վ��ҳ�����½�Ա���͡���Ա��Ϣ��ҳ��Ķ�����������������İ�ť�����<span class="STYLE4">�ҽ���Ϣ�����Զ���������ǰ����ʾ</span>��</span></span>                                                
												<p align="center"></td>
											</tr>
											<tr>
												<td height="2" valign="top">												</td>
											</tr>
											<tr>
												<td height="38" align="center">
												<table border="0" width="524" cellspacing="0" cellpadding="0" height="61">
						<tr>
							<td width="524" height="61">
							<div align="center">
                                 <form method="POST" action="gotopdata_dw.asp">
									<input type="submit" value="������Ա��Ϣ" name="G1">
                                  </form>
							</div></td>
							</tr>
					</table>

												</td>
											</tr>
									</table>
									
��
<p>&nbsp;</p>
<p><span class="STYLE8"><img src="images/jtou.gif" width="16" height="16"><a href="law.asp?id=5&what=��ͨ��Ա�û���VIP��Ա�û����" target="_blank"><font color=#ff0000>������VIP��Ա�����ܱ�վ��ֵ���񣡣�</font></a></span></p>