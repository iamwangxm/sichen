<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="area.asp"-->
<!--#include file="unhtml.asp"-->
<%
if not(isnumeric(request("id"))) then
response.redirect "nodata.html"
rs.close
end if 
sql="select * from en_user where id="&clng(request("id"))
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
if rs("dw_view")="Y" then
	tname=rs("name")
	rs.close
	set rs=nothing
	set conn=nothing
	response.write "<script language=JavaScript>" & chr(13) & "alert('��"&tname&"������Ϣ�ѱ�"&tname&"����Ϊ���أ�ϵͳ��ʱ����ʾ��');"&"JavaScript:window.close();"&" </script>"
	response.end
end if
sql1="update en_user set clicks="&rs("clicks")+1&" where id="&rs("id")

conn.execute(sql1)
%>

                            
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>�ҽ�<%=left(rs("name"),1)%>��Ա���-�ó�ѧ�ƣ�<%=left(unhtml(rs("enfudao")),20)%>��Ա��Ϣ���Բ��ֽ����ҽ���</title>

<!--#include file="top.asp"-->
</head>
<body>

<table border="1" width="950" cellspacing="0" cellpadding="0" bordercolor="#B8D5AD" id="table9" style="border-collapse: collapse" align="center">


                          <tr>
                            <td height="30" background="imagen/web_01_05.gif"  colspan="2">&nbsp; <b>���ҽ���</b></td>
                          </tr>  
                          <tr>
                          
                            <td height="20" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px; padding-left:10" colspan="2"><br><font size="4" color=#ff0000><strong>
                             <%
								if Request.Cookies("user")<>"1" and Request.Cookies("ac")<>rs("ac") then %>
								<%=left(unhtml(rs("name")),1)%>��Ա���<%else%> <%=unhtml(rs("name"))%><%end if%>
									  </strong></font><br>��Ա��ţ�<strong>TE<%=rs("id")%></strong></strong></font><a href="company2.asp?<%=rs("id")%>" target="_blank">.</a>����ʱ�䣺
	                         <%
								a=instr(rs("rdate"),chr(32))-1
								response.write Mid(rs("rdate"),1,a)
							  %> 

                                  <%if rs("rz")=true  then  
							  response.write "<a href=rz.html target='_blank'><font color=#ff0000>����֤��Ա��</font></a>"
							  else
							  response.write "<a href=rz.html target='_blank'><font color=#0033FF>�����֤��Ա��</font></a>"
							  end if %>
                                    <%if rs("vip")=true  then  
							  response.write "<a href=rz.html target='blank'><font color=#ff0000>��VIP��֤��Ա��</font></a>"
							  end if %> (����<font color="#FF3900"><%=rs("clicks")+1%></font>��)
                             </td>
                              
                          <tr>
                            <td height="30" background="imagen/web_01_05.gif"  colspan="2">&nbsp; <b>���ҽ���</b></td>
                          </tr>                              
                          </tr>
                          <tr>
                            <td height="78" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px" colspan="2">
                            <div align="center">
                                <table border="0" width="98%" cellspacing="0" cellpadding="0" id="table7" height="64">
                                  <tr>
                                    <td><%=unhtml(rs("jianj"))%><br>
                                        <br></td>
                                  </tr>
                                </table>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td height="12" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px" colspan="2"><div align="center"><a href="tgjt.html" target="_blank" class="STYLE3"><font color=#ff0000>��߾��裬������ƭ��</font>�鿴���¹���</a> <a href="jb.asp" target="_blank"><strong><font  color=#FF00FF>��Ҫ�ٱ��˽�Ա</font></strong></a></div></td>
                          </tr>
                          <tr>
                            <td height="25" background="imagen/web_01_05.gif" colspan="4">&nbsp; <b><font color="#000000">������Ϣ</font></b></td>
                          </tr>
                          <tr>
                            <td height="7" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px">&nbsp;��Ա������<%if Request.Cookies("user")<>"1" and Request.Cookies("ac")<>rs("ac")  then%><%=left(unhtml(rs("name")),1)%>��Ա [<a href="sm.html" target="_blank"><font color=#ff0000>ѧԱ�ſɼ���ʵ����</font></a>] 
                            <%else%> <%=unhtml(rs("name"))%><%end if%></td>
                            <td height="7" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px">&nbsp;���䣺<%if rs("birthday")<>"" then response.write(year(now())-cint(rs("birthday")))%>&nbsp;&nbsp;&nbsp;&nbsp;���壺<%=unhtml(rs("nation"))%>&nbsp;&nbsp;&nbsp;&nbsp;���ԣ�<%=unhtml(rs("lzsf"))%></td>
                          </tr>
                          <tr>
                            <td width="50%" height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4; padding-left: 6; ">�ó���Ŀ��<font color=#ff0000><%=unhtml(rs("enfudao"))%></font></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4;padding-left: 6; ">��������<font color=#ff0000><%Call Showarea(unhtml(rs("servercity")))%></font></td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;��Ա��ݣ�<%=unhtml(rs("trade"))%></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;��Ա�Ա�<%=unhtml(rs("sex"))%></td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;��ҵ���ڶ�ѧУ��<%=unhtml(rs("school"))%></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;��ҵ���ڶ�ѧ����<%=unhtml(rs("xueli"))%></td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;��ҵ���ڶ�רҵ��<%=unhtml(rs("special"))%></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;�������飺<%=unhtml(rs("fdjy"))%>��</td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;ÿСʱ���ۣ�<%=unhtml(rs("fund"))%> [Ԫ] <a href="law.asp?id=7&what=�ҽ��г��ҽ��շѲο�" target="_blank">�ο��۸�</a></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;ÿ�����ٸ�����<%=unhtml(rs("mcsj"))%>Сʱ</td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;����ʽ��<%=unhtml(rs("fwff"))%></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;��Ч�ڣ�<%=unhtml(rs("yxq"))%></td>
                          </tr>

</table>
<%if Request.Cookies("login")="yes" then '����Ա��½���Բ鿴��ϵ��ʽ%>
<table border="1" align="center" cellspacing="0" bordercolor="#B8D5AD" width="950" >
  <tr>
    <td height="25" background="imagen/web_01_05.gif" colspan="4"><p align="left">&nbsp; <b><font color="#000000">��ϵ��ʽ(ֻ�й���Ա���ܲ鿴��)</font></b></td>
  </tr>
  <tr>
    <td width="421" height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;ͨѶ��ַ��<%=unhtml(rs("address"))%></td> 
    <td width="307" height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;�������룺<%=unhtml(rs("zip"))%></td> 
  </tr>
  <tr>
    <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;��ϵ�绰��<%=unhtml(rs("phone"))%></td>
    <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;�������䣺<a href="mailto:<%=unhtml(rs("email"))%>"><%=unhtml(rs("email"))%></a></td> 
  </tr>
  <tr>
    <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;������վ��<a target=_blank  href="<%=unhtml(rs("web"))%>"><%=unhtml(rs("web"))%></a></td>
    <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;QQ���룺<%=unhtml(rs("qq"))%></td>
  </tr>
</table>
<%end if%>

<% if Request.Cookies("user")="1"  then'���ѧԱ�Ѿ���½%>
<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td><div align="center">  
      <table border="0" width="87%" cellspacing="0" cellpadding="0" id="table17" height="55">
        <tr>
          <td align="center"><a href="add_inorder.asp?enid=<%=rs("id")%>"><img src="images/person_m6.gif" alt="ԤԼ��λ��Ա" width="124" height="22" border="0"></a><a name="a"></a></td>
          <td align="center"><a href="add_indepot.asp?enid=<%=rs("id")%>"><img src="images/company_m4.gif" alt="��ӵ���Ա���ղ�" width="124" height="22" border="0"></a></td>
          <!--td align="center"><a href="JavaScript:openScript('sendmessage.asp?tid=<%=rs("id")%>&ttype=2',450,300)"><img src="images/company_m1.gif" alt="��ѷ���վ�ڶ���Ϣ��ϵ" width="124" height="22" border="0"></a></td-->
          <td align="center"><A HREF="JavaScript:window.print();"><img src="images/company_m2.gif" alt="��ӡ��ҳ" width="124" height="22" border="0"></a></td>
          <td align="center"><A HREF="JavaScript:window.close();"><img src="images/company_m3.gif" alt="�رմ�ҳ" width="124" height="22" border="0"></a></td>
        </tr>
      </table>

    </div></td>
  </tr>
</table>
<%else%>
<%if Request.Cookies("ac")<>rs("ac") and  (Request.Cookies("user")<>"2") then%>
<table border="1" align="center" cellspacing="0" bordercolor="#B8D5AD" width="950" >
  <tr>
    <td height="25" background="imagen/web_01_05.gif" colspan="4" style=" font-size:16px"><p align="left">&nbsp; <b><font color="#000000">������λ�̼ң��Ҹ���ô����</font></b></td>
  </tr>
</table>

<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td><div align="center">  
      <table border="0" width="95%" cellspacing="0" cellpadding="0" id="table17" height="55">
        <tr>
          <td height="30">����һ���������ע���˱�վѧԱ��Ա������<a onClick="gologin();" style="CURSOR: hand">��¼</a>����ԤԼ��</td>
        </tr>
        <tr>
          <td height="30">���������������û��ע�᱾վѧԱ��Ա������<a href="reg_gr.asp?enid=<%=rs("id")%>">ע��</a>����ԤԼ��</td>
        </tr>  
        <tr>
          <td height="30">�����������������ע�ᣬ���µ籾վ�ͷ�ԤԼ�˽�Ա���绰��18260298314</td>
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