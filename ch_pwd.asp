<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½��');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

<script language=javascript>
  function test()
  {
     
	  if (document.form1.pwd1.value==""){
	      alert("�����������룡");
		  document.form1.pwd1.focus();
		  return false
		  } 
		  if (document.form1.pwd1.value!=document.form1.pwd2.value){
	      alert("�����������벻һ�£�");
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

<form name="form1" method="POST" action="ch_pwd_db.asp" onSubmit="return test()">
										<table border="0" width="93%" cellspacing="0" cellpadding="0" id="table5">
											<tr>
												<td height="40" colspan="3">
												<p align="center">��</p>
												<p align="center"><b>��Ա�����޸�</b></p>
												<p align="center">��</td>
											</tr>
											<tr>
												<td height="40" width="33%" align="right">
												����ԭ�ܣ�</td>
												<td height="40" width="35%">
												<input type="password" name="ypwd" size="22" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
												<td height="40" width="32%">
												<font color="#FF0000">*</font></td>
											</tr>
											<tr>
												<td height="40" width="33%" align="right">
												���������룺</td>
												<td height="40" width="35%">
												<input type="password" name="pwd1" size="22" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
												<td height="40" width="32%">
												<font color="#FF0000">*</font></td>
											</tr>
											<tr>
												<td height="40" width="33%" align="right">
												ȷ�������룺</td>
												<td height="40" width="35%">
												<input type="password" name="pwd2" size="22" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
												<td height="40" width="32%">
												<font color="#FF0000">*</font></td>
											</tr>
											<tr>
												<td height="40" width="33%">��</td>
												<td height="40" width="35%">
												<p align="center">
												<input type="submit" value="�޸�" name="b1"></td>
												<td height="40" width="32%">��</td>
											</tr>
											</table>
									</form>