<!--#include file="conn_uppic.asp"-->
<html>
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您不具备此权限！');"&"window.location.href = 'in_uppic.asp'"&" </script>"
Response.End
end if
%>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>会员中心 - 基本资料设置 - 上传个人照片</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="760" cellspacing="0" cellpadding="0" id="table1" height="421">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD" width="760" valign="top" bgcolor="#FEFBF4">
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
						<div align="center">
							<table border="0" width="98%" cellspacing="0" cellpadding="0" id="table3" height="272">
								<tr>
									<td height="27" colspan="2">
									<p align="left">
									&nbsp;会员中心 → 上传个人照片</td>
								</tr>
								<tr>
									<td width="25%" rowspan="2" valign="top">
									<!--#include file="in_menu_uppic.asp"-->									</td>
								  <td width="72%" valign="top" align="center" style="border: 1px solid #000000"><table width="87%" border="0" align="center" cellpadding="5">
  <tr align="center" valign="middle">
    <td> <script language=vbscript>
function form1_Onsubmit()
if document.form1.file.value=""  then
	msgbox "文件路径错误，请重新填写！"
	form1_onsubmit=false
	exit function
else
    if Lcase(right(document.form1.file.value,3)) <>"jpg" and Lcase(right(document.form1.file.value,3))<>"gif" then 
     msgbox "图片类型错误，图片类型应为GIF或JPG格式！"
	 form1_onsubmit=false
	 exit function
	 else
	 document.form1.action="uppic/save.asp?id="&document.form1.id.value
	 end if
 end if 
end function
</script>
      <form  name="form1" method="post"  action="uppic/save.asp"  enctype="multipart/form-data" onSubmit="form1_Onsubmit()">
       
            <p><font color="#666699"><b>图片位置:
              <input type="file" name="file" value="" size="35">	
		</b></font></p>
        <p><font color="#666699"><b>
          <input type="hidden" name="id"  size="10" value=<%=request("id")%>>　
        </b></font><font color="#666699"><b>&nbsp;</b></font><font color="#666699"><b>&nbsp;&nbsp;&nbsp;
        <input type="submit" name="Submit" value="上传">
	
        <input type="reset" name="reset" value="重置"> 
        </b></font>
        <br>
        </p>
      </form>    </td>
  </tr>
</table>
<div align="center">
    <font color="#FF0000" size="1">图片只能是JPG或GIF格式，大小为10K内，可联系我们免费处理图片；<br>最佳效果：120[宽]*150[高]</font></div></td>
								</tr>
								<tr>
								  <td valign="top" align="center" style="border: 1px solid #000000">
                                    <p align="left">
                                      <% 
id=request("id")
sql="select num from imgdata where id="&clng(id)
rs.open sql,conn,1,1
if rs.recordcount<>0 then
response.write "<div align='center'><font color=#ff0000>你当前上传的人个照片预览：</font><br><img src=uppic/kkk.asp?id="
response.write rs("num")
response.write" width=120 height=150 /></div><br><a onClick=""{if(confirm('此操作将删除原照片，删除后即使上传同一图片仍需审核，继续吗？')){return true;}return false;}"" href=""uppic/delpic.asp?id="
response.write rs("num")
response.write """ >〓删除此照片〓</a>"
else
response.write "<div align='center'><font color=#ff0000>你还没有上传个人照片！！</font></div>"
end if 
rs.close
%>

	                                  <br>
	</p>
                                    <p align="left">说明：<br>
                                    &nbsp;&nbsp;1、本站个人照片只允许是本人真实照片（不能是艺术照、名星照、卡通漫画、动物等图片）。<br>&nbsp;&nbsp;2、本站个人照片需要经过本站审核后，才能在你的个人简历中正常显示。                                     <br>&nbsp;&nbsp;3、当你更换照片时，本站需要审核，审核前你的个人照片不能在简历中正常显示，更换后请及时联系我们审核。<br>&nbsp;&nbsp;4、本站VIP会员赠送1月免费显示时间，1月后按13元/月收取（自选服务），普通会员按15元/月收取（自选服务）。收费周期为4月，即你最少要显示4个月，并支付4月的服务费用。</br>&nbsp;&nbsp;5、用户图片服务到期或上传1月后仍未申请显示使用，系统将自动删除上传的图片。 </br>&nbsp;&nbsp;6、用户上传图片如果出现问题或有特殊要求，请联系我们，我们免费帮助上传。</p>
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
<!--#include file="base.asp"-->
</body>

</html>