<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE2 {font-size: 12px}
.STYLE4 {color: #FF0000; font-weight: bold; }
.STYLE6 {
	font-size: 12pt;
	color: #0033CC;
}
.STYLE7 {font-size: 12px; color: #0033CC; }
.STYLE10 {font-size: 14px; color: #00659C; }
.STYLE11 {font-size: 14px; font-weight: bold; }
.STYLE12 {font-size: 14px; color: #FF0000; }
.STYLE13 {font-size: 14px; color: #FF0000; font-weight: bold; }
.STYLE9 {font-size: 14px; color: #006699; }
.STYLE14 {	font-size: 12pt;
	font-weight: bold;
	color: #FF3399;
}
.STYLE15 {	font-size: 18pt;
	font-weight: bold;
}
-->
</style>
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��¼��ʱ�����µ�¼��');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3" height="272">
<tr>
<td width="75%" valign="top" align="center" ><%
sql="select name,gr_view from in_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
%>
                                    <p>ѧԱ��Ա <font color=#ff0000><%=unhtml(rs("name"))%></font> ��ã�</p>
                                    <p align="left" class="STYLE7">&nbsp;&nbsp;&nbsp;&nbsp;����ע�����������ӣ�������Ͽ��ܻᱻ�ú���ʾ��������������Ļ��ʻ��󽵵ͣ��Ӷ��ҽ̳ɹ���Ҳ���½�����վ�ر�ΪѧԱ�û��Ƴ���Ϣ������������ʱ�����������Ϣ��ʾλ�á�ͬʱ�����ڱ�վ��ҳ������ѧԱ���͡�ѧԱ��Ϣ��ҳ��Ķ������������������������Ϣ��ť�����<span class="STYLE4">ѧԱ���Ͻ����Զ���������ǰ����ʾ</span>��</p>
                                    <p align="centen" class="STYLE6">  
									<form method="POST" action="gotopdata_gr.asp">
									<input type="submit" value="����ѧԱ��Ϣ" name="G1">
                                  </form>
								    <!--p class="STYLE15">&nbsp;</p>
							    <p class="STYLE15"><img src="images/jtou.gif" width="16" height="16"><a href="yfcb_gr.html" target="_blank"><font color=#ff0000>������VIP��Ա�����ܱ�վ��ֵ���񣡣�</font></a></p-->
                                
</td>
</tr>
</table>