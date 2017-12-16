<!--#include file="info.asp"-->
<HTML><HEAD><TITLE>管理员登录</TITLE>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<LINK href="../css.css" type=text/css rel=stylesheet>
<META content="MSHTML 5.00.2314.1000" name=GENERATOR>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16pt;
	font-weight: bold;
	color: #FF0000;
}
-->
</style>
</HEAD>
<BODY bgColor=#ffffff><BR><BR>
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=478>
  <TBODY>
  <TR>
    <TD width="26"><IMG border=0 height=1 src="login.files/spacer.gif" width=26></TD>
    <TD width="211"><IMG border=0 height=1 src="login.files/spacer.gif" width=211></TD>
    <TD width="210"><IMG border=0 height=1 src="login.files/spacer.gif" width=210></TD>
    <TD width="30"><IMG border=0 height=1 src="login.files/spacer.gif" width=30></TD>
    <TD width="1"><IMG border=0 height=1 src="login.files/spacer.gif" width=1></TD></TR>
  <TR>
    <TD colSpan=4 bgcolor="#FFCC00"><div align="center" class="STYLE1">管理员登录</div></TD>
    <TD width="1"><IMG border=0 height=65 src="login.files/spacer.gif" width=1></TD></TR>

  <TR>
    <TD rowSpan=2 width="26">
	<IMG border=0 height=96 name=login_r3_c1 
      src="images/login_r3_c1.jpg" width=26></TD>
    <TD bgColor=#f4f9fd colSpan=2 vAlign=center>
      <FORM  name="admininfo" action=admin.asp method=post onSubmit="return check()">
      <TABLE align=center border=0 cellPadding=0 cellSpacing=0 class=d 
      width="103%" height="59">
        <TBODY>
        <TR bgColor=#f1f9fe>
          <TD height=30 width="48%" colspan="2">
            <DIV align=left>帐&nbsp; 号：<INPUT class=kuang name=adminname size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></DIV></TD>
          <TD height=30 width="49%">
              密&nbsp; 码： 
              <INPUT class=kuang name=adminpsw 
            type=password size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></TD>
          <TD height=59 rowSpan=2 width="3%">　</TD></TR>
        <TR bgColor=#f1f9fe>
          <TD height=29 width="21%">
            <DIV align=left>
            <P>验证码：<input type="text" name="code" size="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></P></DIV></TD>
          <TD height=29 width="27%" align="left"><%call getcode()%></TD>
          <TD height=29 width="49%">
              <p align="center"><INPUT  border=0 height=17 
            name=imageField3 src="images/login.jpg" type=image width=73></TD></TR></TBODY></TABLE></FORM></TD>
    <TD rowSpan=2 width="30">
	<IMG border=0 height=96 name=login_r3_c4 
      src="images/login_r3_c4.jpg" width=30></TD>
    <TD width="1"><IMG border=0 height=91 src="login.files/spacer.gif" width=1></TD></TR>
  <TR>
    <TD colSpan=2>
	<IMG border=0 height=5 name=login_r4_c2 
      src="images/login_r4_c2.jpg" width=421></TD>
    <TD width="1"><IMG border=0 height=5 src="login.files/spacer.gif" 
  width=1></TD></TR></TBODY></TABLE></BODY></HTML><script LANGUAGE="javascript">
<!--
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function check()
{
  if(checkspace(document.admininfo.adminname.value)) {
	document.admininfo.adminname.focus();
    alert("管理员不能为空！");
	return false;
  }
  if(checkspace(document.admininfo.adminpsw.value)) {
	document.admininfo.adminpsw.focus();
    alert("密码不能为空！");
	return false;
  }
  if(checkspace(document.admininfo.code.value)) {
	document.admininfo.code.focus();
    alert("验证码不能为空！");
	return false;
  }

	document.admininfo.submit();
  }
//-->
</script> 