<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('���¼���ٽ��������Ϣ�ٱ������û��ע�ᣬ����ע�ᣡ');"&"window.location.href = 'JavaScript:window.close();'"&" </script>"
Response.End
end if
%>
<!--#include file="conn.asp"-->
<!--#include file="top.asp"-->
<title>�����Ϣ�ٱ�</title>
<table width="950" border="0" align="center" cellspacing="0" >
  <tr>
	<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD"  valign="top">
    <p align="center" style="font-weight: bold; font-size: 18px; color: #FF0000">&nbsp;</p>
      <p align="center" style="font-weight: bold; font-size: 18px; color: #FF0000">˼�������ҽ���վ�����Ϣ�ٱ���</p>
      <p align="center" style="font-size: 12px; color: #006699">��������վΪά���ٱ��˵����棬��ŵ�����κε�����͸¶�ٱ��˸�������[����Ҫ�����]</p>
      <p align="center" style="font-size: 12px; color: #006699">
	  <form name="form1""  method="POST" action="jb_save.asp">
		<table width="880" align="center" cellpadding="0"  cellspacing="0">
          <tr>
            <td height="29"><div align="right">�㵱ǰ��IP��ַ��            </div></td>
            <td height="29" colspan="3"><%Response.Write( "<font color=#ff0000><strong>"&request.servervariables("remote_addr")) &"</strong></font>"%> 
              &nbsp;&nbsp;&nbsp;&nbsp;[���IP��Ϣ���ᱻ��¼����Ҫ�����ٱ���ʵ����] </td>
          </tr>
          <tr>
            <td height="19" colspan="4"><div align="center"><span style="font-size: 16px; color: #FF0000; font-weight: bold">�ٱ������Ϣ</span></div></td>
          </tr>
          <tr>
            <td width="187" height="42" align="center"><div align="right" >���ٱ�<span style="font-weight: bold; color: #F00;">����</span>&nbsp; </div></td>
            <td width="74" height="42" align="center">
              
                <div align="left">
                  <input name="jname" type="text" id="jname" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="10" maxlength="30" >
            </div></td>
            <td width="452" colspan="2" align="center"><span style="font-weight: bold; color: #FF0000">* </span>����д���Ա��ţ��ڱ�վ��Ϣҳ�л�Ա��Ψһ��ţ��뽫�˱����������</td>
          </tr>
          
          
          <tr>
            <td height="15" align="center"><div align="right">
              <div align="left"><span style="font-weight: bold">�ٱ�����</span>[��˵�����ٱ���Υ��������Ϊ���ܺ����ܺ���ʵ������Υ�淽�棬<span style="color: #FF3333">�����ṩ���ڱ�վ������Ϣ��ҳ���ַ</span>���븴���������ַ���е�ַ�����ھٱ������У�]&nbsp;�����ͼƬ֤����ͬ�����͵���վ����<span style="font-weight: bold"><a href="mailto:1677676755@qq.com">1677676755@qq.com</a></span> ������ע�������Ϣ�ٱ�ͼƬ֤�ݡ�</div>
            </div></td>
            <td height="15" colspan="3" align="center"><div align="left">
              <textarea name="content" cols="65" rows="12" id="content" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></textarea>
              <br>
              <span style="font-weight: bold; color: #FF0000">&nbsp;&nbsp;&nbsp;&nbsp;* </span>1500���ڣ��ٱ���ʵ����<span style="color: #FF0000">��ʵ������</span>����Ҫʱ�븽��ֱ��֤�ݣ�����վ���账��</div></td>
          </tr>
          <tr>
            <td height="30" align="center"><div align="right">��վ���ҳ����ַ</div></td>
            <td height="21" align="left"><input name="x1" type="text" id="x1" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value=<%=request("url")%> size="50" maxlength="80" >
            <span style="font-weight: bold; color: #FF0000">*</span></td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr>
            <td height="45" colspan="4" align="center"><hr></td>
          </tr>
          <tr>
            <td height="30" colspan="4" align="center"><span style="color: #FF0000">�ٱ���Ӧ��ŵ�����ٱ�����ʵ���𣬲��е���Ӧ�ķ������κ����񣻾ٱ������ϲ�ʵ�ߣ���վ��Ϊ��Ч�ٱ������账��</span></td>
          </tr>
          <tr>
            <td height="31" colspan="4" align="center"><span style="font-weight: bold; color: #009999; font-size: 14px">�ٱ��˻�����Ϣ</span></td>
          </tr>
          <tr>
            <td height="30" align="center"><div align="right" style="color: #006666; font-weight: bold">��ʵ����&nbsp;</div></td>
            <td height="30" colspan="3" align="center"><div align="left">
              <input name="name" type="text" id="name" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="20" >
              <span style="font-weight: bold; color: #FF0000">* </span></div></td>
          </tr>
          <tr>
            <td height="30" align="center"><div align="right" style="color: #006666; font-weight: bold">��ϵ�绰&nbsp;</div></td>
            <td height="30" colspan="3" align="center"><div align="left">
              <input name="phone" type="text" id="phone" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="50" >
              <span style="font-weight: bold; color: #FF0000">* </span>����ã��ֿ�</div></td>
          </tr>
          <tr>
            <td height="30" align="center"><div align="right" style="color: #006666; font-weight: bold">QQ����&nbsp;</div></td>
            <td height="30" colspan="3" align="center"><div align="left">
              <input name="qq" type="text" id="qq" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="50" >
            ����ã��ֿ�</div></td>
          </tr>
          <tr>
            <td height="37" align="center"><div align="right" style="color: #006666; font-weight: bold">��������&nbsp;</div></td>
            <td height="37" colspan="3" align="center"><div align="left">
              <input name="email" type="text" id="email" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="50" >
            ����ã��ֿ�</div></td>
          </tr>
          <tr>
            <td height="37" align="center"><div align="right" style="color: #006666; font-weight: bold">��Ч֤�����Ƽ�����&nbsp;</div></td>
            <td height="19" colspan="3" align="center"><div align="left">
                <input name="zj" type="text" id="zj" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="50" maxlength="50" >
                <span style="font-weight: bold; color: #FF0000">*</span>�����֤������֤��</div></td>
          </tr>
          <tr>
            <td height="37" align="center"><div align="right"><span style="color: #006666; font-weight: bold">ϵͳ��֤��Ϣ</span></div></td>
            <td height="19" colspan="3" align="center"><div align="left">
              <input name="x2" type="text" id="x2" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value=<%=request.Cookies("id")&Request.Cookies("user")%> size="50" maxlength="50" readonly >
            ϵͳ��¼��������</div></td>
          </tr>
          <tr>
            <td colspan="4" align="center"><input type="submit" value="�ύ�ٱ�" name="B1"></td><td width="10"></p>
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