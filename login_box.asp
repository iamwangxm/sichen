<script language=javascript>
  function login_test()
  {
      if (document.login_form.name.value==""){
	      alert("请输入用户名！")
		  document.login_form.name.focus();
		  return false
		    }
	  if (document.login_form.pwd.value==""){
	      alert("请输入密码！");
		  document.login_form.pwd.focus();
		  return false
		  } 
		  if (document.login_form.code.value==""){
	      alert("请输入验证码！");
		  document.login_form.code.focus();
		  return false
		  } 
		   if (document.login_form.user.value=="0"){
	      alert("请选择会员类别！");
		  document.login_form.user.focus();
		  return false
		  }
		  return true
  }
  function reset_form()
  {
   document.login_form.name.value="";
   document.login_form.pwd.value="";
   document.login_form.user.value="";
   document.login_form.name.focus;
  }
</script>

<%
if Request.Cookies("ggval")<>"81528686528" then 
Response.Cookies("id")=""
Response.Cookies("ac")=""
Response.Cookies("user")="" 
end if 
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
%>
<style type="text/css">
<!--
.STYLE2 {color: #B8D5AD}
-->
</style>
<form method="POST" name="login_form" action="login.asp" onSubmit="return login_test()">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0  id="li">
        <TBODY>
          <TR>
            <TD align="right">用户名:            
            </TD>
            <TD><input name="name" size="10" style="float: left" /></TD>

             <TD align="right">密&nbsp; 码: </TD>

             <TD><input type="password" name="pwd" size="10" style="float: left" />
             
            </TD>
             <TD align="right">验证码:
             
             </TD>
             <TD><input name="code" size="4" style="float: left; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" />
             <%call getcode()%>
            </TD>
 
             <TD>
             <select size="1" name="user" size="10">
               <option selected="selected" value="0">-会员类别</option>
               <option value="1">学员/家长用户</option>
               <option value="2">教员/教师用户</option>
             </select>
             
             </TD>

             <TD><input type="image" src="images/dl.gif" alt="登录" name="dl2" />
             
            </TD>

             <TD><a href="register.asp"><img border="0" src="images/reg2.gif" alt="会员注册" width="77" height="21" /></a>
             
             </TD>
             
             <TD><a href="search_pwd1.asp"><img border="0" src="images/pass.gif" alt="忘记密码" width="77" height="21" /></a>
             
             </TD>

          </TR>
        </TBODY>
</TABLE>    
</form>
<%else%>
<form method="POST" name="login_form" action="login.asp" onSubmit="return login_test()">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
          <TR>
            <TD><font color="#FF0000"><%=Request.Cookies("ac")%></font> <%
			      if Request.Cookies("user")="1" then response.write"学员/家长用户"
				  if Request.Cookies("user")="2" then response.write"教员/教师用户"						
				%>，欢迎您！
             </TD>
             <TD><a href="control.asp"><b><font color=#ff0000>进入会员中心</font></b></a></TD>

             <TD>
				<%
				set mrs=server.createobject("adodb.recordset")
				sql="select id from message where ttype='"&Request.Cookies("user")&"' and tid="&clng(Request.Cookies("id"))&" and new=true"
                mrs.open sql,conn,1,1
				
                %>
                    <a href="control.asp?file=message.asp">消息管理</a></b> (<font color="#FF0000"><%=mrs.recordcount%></font>条新信息)</td>           
             </TD>

             <TD><b><a href="exit.asp">退出登陆</a></b></TD>
             <TD width="300">&nbsp;</TD>
             <TD>&nbsp;</TD>

             <TD>&nbsp;</TD>

             <TD>&nbsp;</TD>

             <TD>&nbsp;</TD>

          </TR>
        </TBODY>
</TABLE>    
</form>
<%	
mrs.close					
end if
%>
