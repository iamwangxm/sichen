<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=webname%> - �û�ע��ɹ�</title>
<style type="text/css">
<!--
.STYLE11 {
	color: #FF0000;
	font-weight: bold;
	font-size: 14pt;
}
-->
</style>
</head>

<body>
<!--#include file="top.asp"-->

			
<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td height="295" bgcolor="#FFFBF7">
      <table width="760" border="0" align="center" cellspacing="0">
        <tr>
          <td height="41" colspan="4" bgcolor="#FFFBF7"><div align="center"><span class="STYLE11">Ϊ���������Ǻ������û��������롣</span></div></td>
        </tr>
        <tr>
          <td height="26" colspan="4" bgcolor="#FFFBF7"><div align="center">�û�����<%=request.Cookies("ac")%> ���룺<%=request.Cookies("pwd")%></div></td>
        </tr>   
        <tr>
          <td height="41" colspan="4" bgcolor="#FFFBF7"><div align="center"><span class="STYLE11">��������ȥ���</span></div></td>
        </tr>
        <tr>
          <td height="26" colspan="4" bgcolor="#FFFBF7">
          <div align="center">
           <%
		    if request.QueryString("ttype")="1" then %>
            ���ѳɹ�ע��ѧԱ��Ա����������Խ����Ա�����������ʵĽ�Ա��
           <%
		    end if          
            if request.QueryString("ttype")="2" then
		   %>
            ���ѳɹ�ע���Ա��Ա����������Խ����Ա�����������ʵ�ѧԱ��
           <%end if%>
          </div>
          
          </td>
        </tr>
        
        <tr>
          <td height="26" colspan="4" bgcolor="#FFFBF7">
             <div align="center">
               <a href="control.asp"><img src="images/bot3.gif" alt="�����Ա����" border="0"></a>     
               <% url=""
			      if request.Cookies("enid")<>"" then url="teacher.asp?id="&request.Cookies("enid")
				  if request.Cookies("inid")<>"" then url="student.asp?id="&request.Cookies("inid")
				  if url<>"" then
			   %>
                  <a href="<%=url%>"><img src="images/bot4.gif" border="0"></a>
               <%
			      end if
			   %>
             </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<!--#include file="base.asp"-->
</body>

</html>