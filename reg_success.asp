<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=webname%> - 用户注册成功</title>
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
          <td height="41" colspan="4" bgcolor="#FFFBF7"><div align="center"><span class="STYLE11">为方便管理，请记好您的用户名和密码。</span></div></td>
        </tr>
        <tr>
          <td height="26" colspan="4" bgcolor="#FFFBF7"><div align="center">用户名：<%=request.Cookies("ac")%> 密码：<%=request.Cookies("pwd")%></div></td>
        </tr>   
        <tr>
          <td height="41" colspan="4" bgcolor="#FFFBF7"><div align="center"><span class="STYLE11">您现在想去哪里？</span></div></td>
        </tr>
        <tr>
          <td height="26" colspan="4" bgcolor="#FFFBF7">
          <div align="center">
           <%
		    if request.QueryString("ttype")="1" then %>
            您已成功注册学员会员，现在你可以进入会员中心搜索合适的教员。
           <%
		    end if          
            if request.QueryString("ttype")="2" then
		   %>
            您已成功注册教员会员，现在你可以进入会员中心搜索合适的学员。
           <%end if%>
          </div>
          
          </td>
        </tr>
        
        <tr>
          <td height="26" colspan="4" bgcolor="#FFFBF7">
             <div align="center">
               <a href="control.asp"><img src="images/bot3.gif" alt="进入会员中心" border="0"></a>     
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