<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½���߳�ʱ,���ص�½��');"&"window.location.href = '../'"&" </script>"
response.end
end if
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>����˵�</title>
<base target="main">
</head>

<body bgcolor="#799AE1" leftmargin="0">

<table border="0" width="159" cellspacing="1" cellpadding="0" height="547">
	<tr>
		<td height="39" background="images/title.gif" valign="bottom">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" height="23">
			<tr>
				<td>
				<p align="center"><b><font size="2" color="#FFFFFF">�������</font></b></td>
			</tr>
		</table>		</td>
	</tr>
	<tr>
		<td height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_index.asp">��վ������ҳ</a></b></td>
  </tr>
  	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_inuser.asp">ѧԱ����</a></b></td>
  </tr>
  
  	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_inorder.asp">&nbsp;&nbsp;&nbsp;&nbsp;ѧԱԤԼ��Ա</a></b></td>
  </tr>
  
    
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_enuser.asp">��Ա����</a></b></td>
  </tr>

  	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_enorder.asp">&nbsp;&nbsp;&nbsp;&nbsp;��ԱԤԼѧԱ</a></b></td>
  </tr>
  
	<tr>
	  <td height="25" align="center" background="images/title_bg_show.gif"><b><a href="webinfo.asp">��վ��Ϣ����</a></b></td>
  </tr>
	
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<p align="center"><b><a href="admin_up_notice.asp">��վ�������</a></b></td>
  </tr>
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_up_service.asp?id=1&what=��������">ϵͳ���¹���</a></b></td>
  </tr>
	
	<tr>
	  <td height="25" align="center" background="images/title_bg_show.gif"><a href="admin_guest.asp"><strong>��վ���Թ���</strong></a></td>
  </tr>
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif"><b>
		<a href="../link/admin.asp">�������ӹ���</a></b></td>
  </tr>
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<a href="admin_article.asp"><b>��վ���¹���</b></a></td>
  </tr>
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_message.asp">վ�ڶ��Ź���</a></b></td>
  </tr>
  
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif"><b>
		<a href="admin_user.asp">�ʺ���������</a></b></td>
  </tr>
	
	<tr>
	  <td height="25" align="center" background="images/title_bg_show.gif"><strong><a href="jb_list.asp">�����Ϣ�ٱ�����</a></strong></td>
  </tr>
  	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif"><b>
		<a target="_blank" href="/">��վ��ҳ</a></b></td>
  </tr>
  
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif"><b>
		<a target="_top" href="out.asp">��ȫ�˳�</a></b></td>
  </tr>
	<tr>
	  <td align="center" >&nbsp;</td>
  </tr>
	<tr>
	  <td align="center">&nbsp;</td>
  </tr>
	<tr>
	  <td align="center">&nbsp;</td>
  </tr>
	<tr>
	  <td align="center" >&nbsp;</td>
  </tr>
	<tr>
		<td height="12" align="center" >��</td>
	</tr>
</table>

</body>

</html>
