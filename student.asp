<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->
<html>
<%
if not(isnumeric(request("id"))) then
response.redirect "nodata.html"
rs.close
end if
sql="select * from in_user where id="&clng(request("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
if rs("lock")=true then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('���û��ѱ�����Ա������');"&"window.location.href = 'index.asp'"&" </script>"
response.end
end if
if rs("gr_view")="Y" then
tname=rs("name")
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('"&tname&"  ��ѧԱ��Ϣ�ѱ�"&tname&"����Ϊ���أ�ϵͳ��ʱ����ʾ��');"&"JavaScript:window.close();"&" </script>"
response.end
end if
sql1="update in_user set clicks="&rs("clicks")+1&" where id="&rs("id")

conn.execute(sql1)

%>
<%
                  set rss=server.createobject("adodb.recordset")
sqls="select * from en_city where id="&int(rs("city"))
rss.open sqls,conn,1,1
if rss.eof then

end if
if rs("city") =0 then
response.write "����"
end if
               Cityid=rss("id")
               city=rss("shiName")
                rss.close
                set rss=nothing
                %>
                                <%
                  set rssx=server.createobject("adodb.recordset")
sqlsx="select * from en_city where   id="&int(rs("town"))
rssx.open sqlsx,conn,1,1
if rssx.eof then

end if

               town=rssx("shiName")
                rssx.close
                set rssx=nothing
                %>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%if trim(town)<>trim(city) then response.write city&town else response.write town end if%><%=left(rs("name"),1)%>ѧԱ�ҽ�����-�踨��ѧ�ƣ�<%=left(unhtml(rs("infudao")),20)%>��Ա��Ϣ���Բ��ֽ����ҽ���</title>
<style type="text/css">
<!--
.STYLE1 {color: #006633}
.STYLE6 {color: #0066CC}
.STYLE8 {color: #FF0000}
.STYLE9 {color: #0066FF}
-->
</style>
<!--#include file="top.asp"-->
</head>

<body>

<table border="1" width="950" cellspacing="0" cellpadding="0" bordercolor="#B8D5AD" id="table9" style="border-collapse: collapse" align="center">
  <tr>
    <td height="30" background="imagen/web_01_05.gif" >&nbsp; <b>���ҽ���</b></td>
  </tr>  
  <tr>
    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px; padding-left:10"><br>
      <font size="4"color=#ff0000><strong>
        <%if Request.Cookies("user")<>"2" and Request.Cookies("ac")<>rs("ac")  then%>
		<%=left(unhtml(rs("name")),1)%>ѧԱ��� 
        <%else%>
        <%=unhtml(rs("name"))%>
		<%end if%>
        
      </strong></font><br>��Ա��ţ�<strong>ST<%=rs("id")%></strong><a href="student2.asp?<%=rs("id")%>" target="_blank">.</a>
       <%if rs("rz")=true  then  
							  response.write "<a href=rz.html target='blank'><font color=#ff0000>����֤��Ա��</font></a>"
							  else
							  response.write "<a href=rz.html target='blank'><font color=#0033FF>�����֤��Ա��</font></a>"
							  end if %>
	   <%if rs("vip")=true  then  
							  response.write "<a href=rz.html target='blank'><font color=#ff0000>��VIP��֤��Ա��</font></a>"
							  end if %>������<%
	a=instr(rs("rdate"),chr(32))-1
	response.write Mid(rs("rdate"),1,a) %>&nbsp;(����<font color="#FF3900"><%=rs("clicks")+1%></font>��)
	  <a href="jb.asp" target="_blank"><strong><font  color=#FF00FF>��Ҫ�ٱ���ѧԱ</font></strong></a></td>
  </tr>
</table>
<table border="1" width="950" cellspacing="0" cellpadding="0" bordercolor="#B8D5AD" id="table9" style="border-collapse: collapse" align="center">
  <tr>
    <td height="30" colspan="2" background="imagen/web_01_05.gif">&nbsp; <b>���ҽ��ܻ򸨵�Ҫ��</b></td>
  </tr>
  <tr>
    <td width="600" height="118" valign="top" >
    <div align="center">
      <table border="0" width="100%" cellspacing="0" cellpadding="0" id="table15" height="23">
        <tr>
          <td style="padding-left: 6;"><%=unhtml(rs("xyjj"))%></td>
        </tr>
      </table>
    </div></td>
    <td align="right"><!--#include file="studenttimes.asp"--></td>
  </tr>
</table>
<table border="1" width="950" cellspacing="0" cellpadding="0" bordercolor="#B8D5AD" id="table2" style="border-collapse: collapse" align="center">
  <tr>
    <td height="30" background="imagen/web_01_05.gif" colspan="4">&nbsp; <b>ѧԱ������Ϣ</b></td>
  </tr>
  <tr>
    <td height="25" width="130" bgcolor="#FEFBF4">&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp; ����</td>
    <td width="205"> ��<%if Request.Cookies("user")<>"2" and Request.Cookies("ac")<>rs("ac")  then%><%=left(unhtml(rs("name")),1)%>ѧԱ [<a href="sm.html" target="_blank"><font color=#ff0000>��Ա�ſɼ���ʵ����</font></a>] 
    <%else%>
	<%=unhtml(rs("name"))%>
	<%end if%>
    </td>
    <td height="26" width="101" align="center" bgcolor="#FEFBF4"> ��&nbsp;&nbsp;&nbsp; ��</td>
    <td> ��<%=unhtml(rs("sex"))%></td>
  </tr>
  
  <tr>
    <td height="25" width="130" bgcolor="#FEFBF4">&nbsp;&nbsp;���ڵ�����</td>
    <td width="205"> ��<%=unhtml(city)%><%=unhtml(town)%><%=unhtml(rs("xian"))%></td>
    <td height="25" width="101" align="center" bgcolor="#FEFBF4">��&nbsp;&nbsp;&nbsp; �䣺</td>
    <td> ��<%=unhtml(rs("age"))%></td>
  </tr>
  <tr>
    <td height="25" width="130" bgcolor="#FEFBF4">&nbsp;&nbsp;�����꼶��</td>
    <td width="205"> ��<%=unhtml(rs("zxnj"))%></td>
    <td width="101" height="0" align="center" bgcolor="#FEFBF4"> �ֶ�ѧУ��</td>
    <td width="205"> ��<%=unhtml(rs("school"))%></td>
  </tr>
  <tr>
    <td width="130" height="25" bgcolor="#FEFBF4">&nbsp;&nbsp;��Ҫ������Ŀ��</td>
    <td width="205">��<font color=#ff0000><%=unhtml(rs("infudao"))%></font></td>
    <td width="101" height="0" align="center" bgcolor="#FEFBF4">������ʽ��</td>
    <td width="205">��<%=unhtml(rs("fdfs"))%></td>
  </tr>
  <tr>
    <td width="130" height="25" bgcolor="#FEFBF4">&nbsp;&nbsp;ÿСʱ��֧����</td>
    <td width="205">��<%=unhtml(rs("shixin"))%> [Ԫ] <a href="law.asp?id=7&what=�ҽ��г��ҽ��շѲο�" target="_blank">�ο��۸�</a></td>
    <td width="101" height="0" align="center" bgcolor="#FEFBF4">��Ϣ��Ч�ڣ�</td>
    <td width="205">��<%=unhtml(rs("yxq"))%></td>
  </tr>

</table>

<%if Request.Cookies("login")="yes" then '����Ա��½���Բ鿴��ϵ��ʽ%>
<table border="1" align="center" cellspacing="0" bordercolor="#B8D5AD" width="950">
  <tr>
    <td height="25" background="imagen/web_01_05.gif" colspan="4"><p align="left">&nbsp; <b><font color="#000000">��ϵ��ʽ(ֻ�й���Ա���ܲ鿴��)</font></b></td>
  </tr>
  <tr>
    <td width="421" height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;ͨѶ��ַ��<%=unhtml(rs("address"))%></td> 
    <td width="307" height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;�������룺<%=unhtml(rs("posts"))%></td> 
  </tr>
  <tr>
    <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;��ϵ�绰��<%=unhtml(rs("phone"))%></td>
    <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;�������䣺<a href="mailto:<%=unhtml(rs("email"))%>"><%=unhtml(rs("email"))%></a></td> 
  </tr>
  <tr>
    <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;QQ���룺<%=unhtml(rs("oicq"))%></td>
    <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4"></td>

  </tr>
</table>
<%end if%>


<%if Request.Cookies("user")="2" then'�����Ա�Ѿ���½%>
<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td><div align="center">
      <table border="0" width="87%" cellspacing="0" cellpadding="0" id="table17" height="55">
        <tr>
          <td align="center"><a href="add_enorder.asp?inid=<%=rs("id")%>"><img src="images/person_m5.gif" alt="ԤԼ��ݼҽ�" width="124" height="22" border="0"></a></td>
          <td align="center"><a href="add_endepot.asp?inid=<%=rs("id")%>"> <img src="images/person_m1.gif" alt="��ӵ�ѧԱ�����ղ�" width="124" height="22" border="0"></a></td>
          <td align="center"><A HREF="JavaScript:window.print();"><img src="images/company_m2.gif" alt="��ӡ��ҳ" width="124" height="22" border="0"></A></td>
          <td align="center"><A HREF="JavaScript:window.close();"><img src="images/company_m3.gif" alt="�رմ�ҳ" width="124" height="22" border="0"></A></td>
        </tr>
      </table>
    </div></td>
  </tr>
</table>
<%else%>
<%if Request.Cookies("ac")<>rs("ac") and  (Request.Cookies("user")<>"1") then%>
<table border="1" align="center" cellspacing="0" bordercolor="#B8D5AD" width="950" >
  <tr>
    <td height="25" background="imagen/web_01_05.gif" colspan="4" style=" font-size:16px"><p align="left">&nbsp; <b><font color="#000000">������ݽ̼ң��Ҹ���ô���룿</font></b></td>
  </tr>
</table>

<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td><div align="center">  
      <table border="0" width="95%" cellspacing="0" cellpadding="0" id="table17" height="55">
        <tr>
          <td height="30">����һ���������ע���˱�վ��Ա��Ա������<a onClick="gologin();" style="CURSOR: hand">��¼</a>����ԤԼ��</td>
        </tr>
        <tr>
          <td height="30">���������������û��ע�᱾վ��Ա��Ա������<a href="/reg_dw.asp?inid=<%=rs("id")%>">ע��</a>����ԤԼ��</td>
        </tr>  
        <tr>
          <td height="30">�����������������ע�ᣬ���µ籾վ�ͷ�ԤԼ��ѧԱ���绰��0769-83188360��</td>
        </tr>                
      </table>

    </div></td>
  </tr>
</table>
<%end if%>
<%end if%>
      
<%
rs.close
set rs=nothing
set conn=nothing
%>

<script language="JavaScript"> 
function gologin() { 
login_form.name.focus()
var t=document.getElementById("li"); 
	  t.height=500;

} 
</SCRIPT>
<!--#include file="base.asp"-->
</body>

</html>