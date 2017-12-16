<%@ Language="VBScript" %>

<%

Option Explicit

Response.Buffer = True

Dim bCookies ' T/F indicating Cookies enabled.

bCookies = Request.QueryString("Cookies")

Select Case LCase(bCookies)

   Case "true", "false"

      ' We got a valid response.

      bCookies = CBool(bCookies)

   Case Else

        Response.Cookies("Cookie_test") = "true"

        Response.Redirect "Cookie_detect.asp"

End Select

%>

<html>

<head>

<title>检测浏览器是否能正常访问本站所有功能</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
</head>
<% if bCookies ="True" then
 response.write "<br><br><br><br><br><div align='center'><strong><font color=#009966><image src=imagen/succ.gif /><br><br><br>恭喜你！您的浏览器正常，您能得到本站正常的服务！！</font></strong></div>"
else
response.write "<div align='center'><strong><font color=#ff0000><br><image src=imagen/err.gif /><br>抱歉，本站需要使用SESSION参数，您的浏览器当前不支持此功能，您将不能正常访问本站！！<br>请设置好后再来注册[即还原隐私设置为默认值]。<br><br></font></strong></div>【设置方法】（以IE6为例）：打开IE ；选择“工具”中的“Internet 选项（O）”；打开显项卡后选择“隐私”子项；在设置中单击“默认”按钮（下面两图之一，或根据浏览器不同有所差别），并“确定”。<br><div align='center'><image src=imagen/err1.jpg /> <image src=imagen/err2.jpg />  <image src=imagen/err3.jpg /></div>"
end if %>

</body>

</html>

