<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->

<html>
<%
if session("id")="" or session("ac")="" or session("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您不具备此权限！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=webname%> - 会员中心 - 基本资料设置 - 上传个人照片</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body>
<!--#include file="top_df.asp"-->
<div align="center">
	<table border="0" width="760" cellspacing="0" cellpadding="0" id="table1" height="421">
		<tr>
			<td style="border-left: 1px solid #0086DF; border-right: 1px solid #0086DF" width="760" valign="top" bgcolor="#FEFBF4">
			<div align="center">
				<table border="0" width="705" cellspacing="0" cellpadding="0" id="table2" height="379">
					<tr>
						<td height="86" width="214">
						<img border="0" src="images/control.gif" width="282" height="90"></td>
						<td height="86" width="237">　</td>
						<td height="86" width="128">
						<img border="0" src="images/controltop1.gif" width="128" height="90"></td>
						<td height="86" width="58">　</td>
					</tr>
					<tr>
					  <td width="705" colspan="4" valign="top">
						<%
sql="select pic from in_user where id="&clng(session("id"))
rs.open sql,conn,1,1
%>
						<div align="center">
							<table border="0" width="98%" cellspacing="0" cellpadding="0" id="table3" height="272">
								<tr>
									<td height="27" colspan="2">
									<p align="left">
									&nbsp;会员中心 → 上传个人照片</td>
								</tr>
								<tr>
									<td width="4%" valign="top">&nbsp;</td>
									<td width="96%" valign="top" align="center" style="border: 1px solid #000000">
									<table border="0" width="94%" cellspacing="0" cellpadding="0" id="table4">
									<%if rs("pic")<>"" then%>	
																				<tr>
											<td height="160" align="center">
											<table border="0" width="433" cellspacing="0" cellpadding="0" id="table5" height="170">
												<tr>
													<td height="140" width="0">
													<p align="left">&nbsp;&nbsp;&nbsp; 
													您已经上传了个人照片，如果您要重新上传，原照片将被删除。</td>
													<td height="170" rowspan="2" width="152">
													<p align="center">
													<img border="0" src="<%=rs("pic")%>" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" width="120" height="150"></td>
												</tr>
												<tr>
													<td height="30" width="0">
													<p align="left"><b>
													<a onClick="{if(confirm('此操作将删除原照片，继续吗？')){return true;}return false;}" href="re_up.asp">我要重新上传/删除照片</a></b></td>
												</tr>
											</table>
											</td>
										</tr>
										<%else%>
									<tr>
										<td height="160">
										<div align="center">
											<table border="0" width="436" cellspacing="0" cellpadding="0" id="table6" height="159">
												<tr>
													<td height="102">
													<script language=javascript>
  function test()
  {
      if (document.form1.strFile1.value==""){
	      alert("请选择文件！")
		  document.form1.strFile1.focus();
		  return false
		    }
	 return true
  }
  function reset_form()
  {
   document.form1.name.value="";
   document.form1.pwd.value="";
   document.form1.userr.value="";
   document.form1.name.focus;
  }
</script>

													<form name="form1" method="POST" enctype="multipart/form-data" action="upload.asp" onSubmit="return test()" >
　<p>　</p>
<p>　</p>
<p><b>您还没有上传个人照片。</b></p>
<p>建议图片规格：120*150</p>
<p><font color="#FF0000">上传限制：</font>文件只能为*.gif、*.jpg图片文件，大小不能超过<%=upsize%>KB。</p>
<p>请选择文件&nbsp;
<input type="file" name="strFile1" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> &nbsp;&nbsp; <input type="submit" value="提交" name="B1">
</p>
<p><span class="STYLE1">如果你需要上传图片（如个人照片、获奖证书，作品照片等），请联系我们（电话18260298314（王老师），电子邮箱：583164404@qq.com[标题注明-招聘图片申请]）</span></p>
													</form>
</td>
												</tr>
											</table>
										</div>
										</td>
								     </tr>
									<%end if%>
									</table>
								  </td>
								</tr>
							</table>
						</div>
						<div align="center">
						  <%'表格%>
						</div></td>
					</tr>
					</table>
			</div>
			</td>
		</tr>
	</table>
</div>
<%
rs.close
set rs=nothing
set conn=nothing
%>
<!--#include file="base_df.asp"-->
</body>

</html>