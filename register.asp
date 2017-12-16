<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=webname%> - 用户注册</title>
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE2 {
	font-size: 14pt;
	color: #006633;
}
.STYLE4 {color: #FF0000}
.STYLE5 {color: #000000}
-->
</style>
<script language="JavaScript">
<!--
function Juge(theForm)
{
  if(theForm.agree.checked==false)
 {
  alert("您只有同意我们的服务条款,才能进行下一步的会员注册！如果同意条款，请勾选“阅读确认”。");
  theForm.agree.focus();
  return(false);
  }
 }
-->
</script>
</head>

<body>
<!--#include file="top.asp"-->


<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="518">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD" valign="top" bgcolor="#FEFBF4">
			<div align="center">
				<table border="0" width="705" cellspacing="0" cellpadding="0" id="table2" height="504">
					<tr>
						<td height="17">&nbsp;</td>
					</tr>
					<tr>
						<td>
					  <p align="center">　<span class="STYLE2">【<strong><font color=#ff0000>用户服务协议书</font></strong>】</span></td>
					</tr>
					<tr>
						<td height="150">
						<p align="center">
                        <iframe src="register1.asp" width="800" height="300" ></iframe>
					  </td>
					</tr>
					
					<tr>
					  <td height="12"><div align="center"></div></td>
				  </tr>
					<tr>
						<td height="73">
						<p align="center">
						  <form name="regsiter" action="register_sy.asp" method="post" onSubmit="return Juge(this)">
 <p align="center"> <INPUT type=checkbox value=Yes name=agree><FONT 
                  size=2></FONT><span class="STYLE4"><B>我已认真阅读，并同意遵守以上用户服务协议</B></span><br><br>
					        <div align="center">
  <INPUT name=Submit type=submit id="Submit" style="FONT-SIZE: 14px; FONT-FAMILY: 宋体; HEIGHT: 30px"  value="同 意 （继续注册） ">
  &nbsp; &nbsp; 
					          <INPUT style="FONT-SIZE: 14px; FONT-FAMILY: 宋体; HEIGHT: 30px" type=button value="不同意 （退出） " name=Reset onClick="window.location='javascript:history.back()';">
				                              </div>
					        <p align="center" class="STYLE5">你只有同意以上条款（请勾选择“阅读确认”），才能继续注册。                            </form>                            </td>
					</tr>
				</table> 
			</div>
			</td>
		</tr>
	</table>

<!--#include file="base.asp"-->
</body>

</html>