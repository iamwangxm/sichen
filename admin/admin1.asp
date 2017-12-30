<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>管理菜单</title>
<base target="main">
</head>

<body bgcolor="#799AE1" leftmargin="0">

<table border="0" width="159" cellspacing="1" cellpadding="0" height="547">
	<tr>
		<td height="39" background="images/title.gif" valign="bottom">
		<table border="0" width="100%" cellspacing="0" cellpadding="0" height="23">
			<tr>
				<td>
				<p align="center"><b><font size="2" color="#FFFFFF">控制面版</font></b></td>
			</tr>
		</table>		</td>
	</tr>
	<tr>
		<td height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_index.asp">网站管理首页</a></b></td>
  </tr>
  	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_inuser.asp">学员管理</a></b></td>
  </tr>
  
  	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_inorder.asp">&nbsp;&nbsp;&nbsp;&nbsp;学员预约教员</a></b></td>
  </tr>
  
    
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_enuser.asp">教员管理</a></b></td>
  </tr>

  	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_enorder.asp">&nbsp;&nbsp;&nbsp;&nbsp;教员预约学员</a></b></td>
  </tr>
  
	<tr>
	  <td height="25" align="center" background="images/title_bg_show.gif"><b><a href="webinfo.asp">网站信息设置</a></b></td>
  </tr>
	
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<p align="center"><b><a href="admin_up_notice.asp">网站公告管理</a></b></td>
  </tr>
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_up_service.asp?id=1&what=法律申明">系统文章管理</a></b></td>
  </tr>
	
	<tr>
	  <td height="25" align="center" background="images/title_bg_show.gif"><a href="admin_guest.asp"><strong>网站留言管理</strong></a></td>
  </tr>
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif"><b>
		<a href="../link/admin.asp">友情连接管理</a></b></td>
  </tr>
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<a href="admin_article.asp"><b>网站文章管理</b></a></td>
  </tr>
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif">
		<b><a href="admin_message.asp">站内短信管理</a></b></td>
  </tr>
  
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif"><b>
		<a href="admin_user.asp">帐号密码设置</a></b></td>
  </tr>
	
	<tr>
	  <td height="25" align="center" background="images/title_bg_show.gif"><strong><a href="jb_list.asp">虚假信息举报管理</a></strong></td>
  </tr>
  	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif"><b>
		<a target="_blank" href="/">网站首页</a></b></td>
  </tr>
  
	<tr>
		<td width="0" height="25" align="center" background="images/title_bg_show.gif"><b>
		<a target="_top" href="out.asp">安全退出</a></b></td>
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
		<td height="12" align="center" >　</td>
	</tr>
</table>

</body>

</html>
