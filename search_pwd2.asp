<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<%
if instr(request("name"),"'")<>0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('非法数据提交！');" & "history.back()" & "</script>" 
Response.End
end if
name=request("name")
if request("user")="1" then
sql="select question from in_user where ac='"&name&"'"
rs.open sql,conn,1,1
if rs.recordcount=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('此用户不存在！');" & "history.back()" & "</script>" 
rs.close
set rs=nothing
set conn=nothing
Response.End
end if
else
if request("user")="2" then
sql="select question from en_user where ac='"&name&"'"
rs.open sql,conn,1,1
if rs.recordcount=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('此用户不存在！');" & "history.back()" & "</script>" 
rs.close
set rs=nothing
set conn=nothing
Response.End
end if
end if
end if
%>
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
      if (document.form1.answer.value==""){
	      alert("请输入密码答案！")
		  document.form1.answer.focus();
		  return false
		    }
	 if (document.form1.code.value==""){
	      alert("请输入验证码！")
		  document.form1.code.focus();
		  return false
		    }
 
          return true
  }
  function reset_form()
  {
   document.form1.code.value="";
      document.form1.code.focus;
  }
</script>

						<form name="form1" method="POST" action="search_pwd3.asp" onSubmit="return test()">
							<div align="center">
								<table border="0" width="300" cellspacing="0" cellpadding="0" id="table3" height="118">
									<tr>
										<td height="25" width="300" colspan="3">
										<b>√第二步：</b></td>
									</tr>
									<tr>
										<td height="30" width="99" align="center">
										您的密码问题：</td>
										<td height="30" width="201" colspan="2">
										<font color="#FF0000"><%=rs("question")%></font></td>
									</tr>
									<tr>
										<td height="30" width="99" align="center">
										您的密码答案：</td>
										<td height="30" width="201" colspan="2">
											<input type="text" name="answer" size="25" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									</tr>
									<tr>
										<td height="30" width="99" align="center">
										请输入验证码：</td>
										<td height="30" width="44" align="left">
										<input type="text" name="code" size="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
										<td height="30" width="157" align="left"><%call getcode()%></td>
									</tr>
									<tr>
										<td height="60" width="300" align="center" colspan="3">
										<input type="hidden" name="name" value="<%=name%>">
                                        <input type="hidden" name="user" value="<%=request("user")%>">

										<input type="button" value="上一步" onclick='history.back()' name="B2">&nbsp;&nbsp;

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
	<%
	rs.close
	set rs=nothing
	set conn=nothing
	%>
</div>
<!--#include file="base.asp"-->
</body>

</html>