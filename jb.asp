<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请登录后，再进行虚假信息举报；如果没有注册，请先注册！');"&"window.location.href = 'JavaScript:window.close();'"&" </script>"
Response.End
end if
%>
<!--#include file="conn.asp"-->
<!--#include file="top.asp"-->
<title>虚假信息举报</title>
<table width="950" border="0" align="center" cellspacing="0" >
  <tr>
	<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD"  valign="top">
    <p align="center" style="font-weight: bold; font-size: 18px; color: #FF0000">&nbsp;</p>
      <p align="center" style="font-weight: bold; font-size: 18px; color: #FF0000">思辰教育家教网站虚假信息举报箱</p>
      <p align="center" style="font-size: 12px; color: #006699">申明：本站为维护举报人的利益，承诺不向任何第三方透露举报人个人资料[法律要求除外]</p>
      <p align="center" style="font-size: 12px; color: #006699">
	  <form name="form1""  method="POST" action="jb_save.asp">
		<table width="880" align="center" cellpadding="0"  cellspacing="0">
          <tr>
            <td height="29"><div align="right">你当前的IP地址：            </div></td>
            <td height="29" colspan="3"><%Response.Write( "<font color=#ff0000><strong>"&request.servervariables("remote_addr")) &"</strong></font>"%> 
              &nbsp;&nbsp;&nbsp;&nbsp;[你的IP信息将会被记录，你要对所举报事实负责。] </td>
          </tr>
          <tr>
            <td height="19" colspan="4"><div align="center"><span style="font-size: 16px; color: #FF0000; font-weight: bold">举报虚假信息</span></div></td>
          </tr>
          <tr>
            <td width="187" height="42" align="center"><div align="right" >被举报<span style="font-weight: bold; color: #F00;">对象</span>&nbsp; </div></td>
            <td width="74" height="42" align="center">
              
                <div align="left">
                  <input name="jname" type="text" id="jname" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="10" maxlength="30" >
            </div></td>
            <td width="452" colspan="2" align="center"><span style="font-weight: bold; color: #FF0000">* </span>请填写其会员编号，在本站信息页中会员有唯一编号，请将此编号填在这里</td>
          </tr>
          
          
          <tr>
            <td height="15" align="center"><div align="right">
              <div align="left"><span style="font-weight: bold">举报内容</span>[请说明被举报者违规现象、行为或受害人受害事实或其它违规方面，<span style="color: #FF3333">并请提供其在本站发布信息的页面地址</span>（请复制浏览器地址栏中地址并附于举报内容中）]&nbsp;如果有图片证据请同步发送到本站邮箱<span style="font-weight: bold"><a href="mailto:1677676755@qq.com">1677676755@qq.com</a></span> 标题请注明虚假信息举报图片证据。</div>
            </div></td>
            <td height="15" colspan="3" align="center"><div align="left">
              <textarea name="content" cols="65" rows="12" id="content" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></textarea>
              <br>
              <span style="font-weight: bold; color: #FF0000">&nbsp;&nbsp;&nbsp;&nbsp;* </span>1500字内，举报事实必须<span style="color: #FF0000">真实、具体</span>，必要时请附上直接证据，否则本站不予处理。</div></td>
          </tr>
          <tr>
            <td height="30" align="center"><div align="right">本站相关页面网址</div></td>
            <td height="21" align="left"><input name="x1" type="text" id="x1" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value=<%=request("url")%> size="50" maxlength="80" >
            <span style="font-weight: bold; color: #FF0000">*</span></td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="45" colspan="4" align="center"><hr></td>
          </tr>
          <tr>
            <td height="30" colspan="4" align="center"><span style="color: #FF0000">举报人应承诺对所举报的事实负责，并承担相应的法律责任和义务；举报者资料不实者，本站视为无效举报，不予处理。</span></td>
          </tr>
          <tr>
            <td height="31" colspan="4" align="center"><span style="font-weight: bold; color: #009999; font-size: 14px">举报人基本信息</span></td>
          </tr>
          <tr>
            <td height="30" align="center"><div align="right" style="color: #006666; font-weight: bold">真实姓名&nbsp;</div></td>
            <td height="30" colspan="3" align="center"><div align="left">
              <input name="name" type="text" id="name" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="20" >
              <span style="font-weight: bold; color: #FF0000">* </span></div></td>
          </tr>
          <tr>
            <td height="30" align="center"><div align="right" style="color: #006666; font-weight: bold">联系电话&nbsp;</div></td>
            <td height="30" colspan="3" align="center"><div align="left">
              <input name="phone" type="text" id="phone" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="50" >
              <span style="font-weight: bold; color: #FF0000">* </span>多个用，分开</div></td>
          </tr>
          <tr>
            <td height="30" align="center"><div align="right" style="color: #006666; font-weight: bold">QQ号码&nbsp;</div></td>
            <td height="30" colspan="3" align="center"><div align="left">
              <input name="qq" type="text" id="qq" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="50" >
            多个用，分开</div></td>
          </tr>
          <tr>
            <td height="37" align="center"><div align="right" style="color: #006666; font-weight: bold">电子邮箱&nbsp;</div></td>
            <td height="37" colspan="3" align="center"><div align="left">
              <input name="email" type="text" id="email" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="50" >
            多个用，分开</div></td>
          </tr>
          <tr>
            <td height="37" align="center"><div align="right" style="color: #006666; font-weight: bold">有效证件名称及号码&nbsp;</div></td>
            <td height="19" colspan="3" align="center"><div align="left">
                <input name="zj" type="text" id="zj" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="50" >
                <span style="font-weight: bold; color: #FF0000">*</span>如身份证、军官证等</div></td>
          </tr>
          <tr>
            <td height="37" align="center"><div align="right"><span style="color: #006666; font-weight: bold">系统验证信息</span></div></td>
            <td height="19" colspan="3" align="center"><div align="left">
              <input name="x2" type="text" id="x2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value=<%=request.Cookies("id")&Request.Cookies("user")%> size="50" maxlength="50" readonly >
            系统记录，不用填</div></td>
          </tr>
          <tr>
            <td colspan="4" align="center"><input type="submit" value="提交举报" name="B1"></td><td width="10"></p>
      <p align="center" style="font-weight: bold; font-size: 18px; color: #FF0000">&nbsp;</p>
      <p></p></td>
  </tr>
</table>
</form>
        <p align="center" style="color: #FF0000">&nbsp;</p>
</table>

<!--#include file="base.asp"-->
</body>
</html>