<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->

<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或登录超时，请重新登录后操作！！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

<script language=javascript>
  function test()
  {
     
	  if (document.form1.pwd1.value==""){
	      alert("请输入新密码！");
		  document.form1.pwd1.focus();
		  return false
		  } 
		  if (document.form1.pwd1.value!=document.form1.pwd2.value){
	      alert("两次密码输入不一致！");
		  document.form1.pwd1.focus();
		  return false
		  } 
		  return true
  }
  function reset_form()
  {
      document.form1.pwd1.value="";
     }
</script>


<form name="form1" method="POST" action="kill_db.asp" onSubmit="return test()">
										<table border="0" width="93%" cellspacing="0" cellpadding="0" id="table5">
											<tr>
												<td height="40" colspan="3">
												<p align="center">　</p>
												<p align="center"><b>用户帐户注销</b></p>
												<p align="center">　</td>
											</tr>
											<tr>
												<td height="40" width="100%" align="right" colspan="3">
												<p align="left">&nbsp;&nbsp;&nbsp;
												  
												注销后您在本站的所有数据将被删除，这个<span class="STYLE2"><font color="#FF0000">操作是不可恢复的</font></span>，请谨慎使用。</td>
											</tr>
											<tr>
												<td height="40" width="33%" align="right">
												输入户密码：</td>
												<td height="40" width="35%">
												<input type="password" name="pwd" size="22" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
												<td height="40" width="32%">
												<font color="#FF0000">*</font></td>
											</tr>
											<tr>
												<td height="40" width="33%" align="right">
												输入验证码：</td>
												<td height="40" width="35%">
												<input name="code" size="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">&nbsp;<%call getcode()%></td>
												<td height="40" width="32%">
												<font color="#FF0000">*</font></td>
											</tr>
											<tr>
												<td height="40" width="33%">　</td>
												<td height="40" width="35%">
												<p align="center">
												<input type="submit" value="确认注销" name="b1"></td>
												<td height="40" width="32%">　</td>
											</tr>
											</table>
									</form>