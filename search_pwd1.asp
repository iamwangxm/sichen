<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=webname%> - 找回密码</title>
</head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="421">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD" width="760" valign="top" bgcolor="#FEFBF4">
			<div align="center">
				<table border="0" width="705" cellspacing="0" cellpadding="0" id="table2" height="377">
					<tr>
						<td height="86" width="214">
						<img border="0" src="images/spwd.gif" width="282" height="90"></td>
						<td height="86" width="237">　</td>
						<td height="86" width="128">&nbsp;</td>
						<td height="86" width="58">　</td>
					</tr>
					<tr>
						<td width="705" colspan="4">
						<script language=javascript>
  function test()
  {
      if (document.form1.name.value==""){
	      alert("请输入用户名！")
		  document.form1.name.focus();
		  return false
		    }
	  
          if (document.form1.user.value=="0"){
	      alert("请选择会员类别！");
		  document.form1.user.focus();
		  return false
		  }
		  return true
  }
  function reset_form()
  {
   document.form1.name.value="";
   document.form1.userr.value="";
   document.form1.name.focus;
  }
</script>

						<form name="form1" method="POST" action="search_pwd2.asp" onSubmit="return test()">
							<div align="center">
								<table border="0" width="274" cellspacing="0" cellpadding="0" id="table3" height="118">
									<tr>
										<td height="25" width="274" colspan="2">
										<b>√第一步：</b></td>
									</tr>
									<tr>
										<td height="25" width="99" align="center">
										输入用户名：</td>
										<td height="25" width="175">
											<input type="text" name="name" size="16" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									</tr>
									<tr>
										<td height="25" width="99" align="center">
										请选择类型：</td>
										<td height="25" width="175">
											<select size="1" name="user">
											<option selected value="0">-请选择会员类别
											</option>
											<option value="1">学员/家长用户</option>
											<option value="2">教员/教师用户</option>
											</select></td>
									</tr>
									<tr>
										<td height="43" width="274" align="center" colspan="2">
										<input type="submit" value="下一步" name="B1"></td>
									</tr>
								</table>
							</div>
						</form>
						<p>
						
						</td>
					</tr>
					</table>
			</div>
			</td>
		</tr>
	</table>
</div>
<!--#include file="base.asp"-->
</body>

</html>