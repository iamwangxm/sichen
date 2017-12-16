<!--#include file="Safety.asp"-->
<!--#include file="char.inc"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="Job 528招聘求职网=免费在线求职、免费招聘、企业招聘、人才市场、工作就业信息-杰博528免费人才招聘网">
<meta name="description" content="Job 528招聘求职网=免费在线求职、免费招聘、企业招聘、人才市场、工作就业信息-杰博528免费人才招聘网">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
td{font-size:12px;}
</style>

<script>
function checkform1(){

if(form1.linkname.value=="")
{

alert("链接名称不能为空!");
form1.linkname.focus();
return false;
}
if(form1.linkurl.value=="")
{

alert("链接路径不能为空!");
form1.linkurl.focus();
return false;
}

}
</script>
<title>Job 528招聘求职网=免费在线求职、免费招聘、企业招聘、人才市场、工作就业信息-杰博528免费人才招聘网</title></head>


<body topmargin="10">

<script language="javascript" src="/top.js"></script>

<%
	filePath = "word.xml"
	Set objXML = Server.CreateObject("Microsoft.XMLDOM")
   'Set objXML = server.CreateObject("Msxml2.DOMDocument")
        objXML.async = False
        loadResult = objXML.Load(server.MapPath(filePath))
        If Not loadResult Then
             Response.Write ("加载XML文件出错!")
               Response.End
         End If		

      id =  Request("ID")
	  	  
	  
      Set objNodes = objXML.selectSingleNode("xml/guestbook/item[id ='" & id & "']")



      if Not IsNull(objNodes) then
	  
	  linkname=objNodes.childNodes(2).text  
	  linkurl=objNodes.childNodes(3).text
	  
	  
       linkname2 = trim(Request("linkname"))
	   linkurl2=trim(request("linkurl"))
	   
       if linkname2 <> "" and linkurl2 <> "" then
	   
		objNodes.childNodes(2).text  = linkname2
		
		objNodes.childNodes(3).text  = linkurl2
		
		objXML.save(server.MapPath(filePath))
				
		Set objXML=nothing
		
		Response.Write "<script>window.alert('文字链接修改成功！');window.location='admin.asp';</script>"
		
		response.end
		
       end if
	   
      end if
	  
	  
%>


 <table width='729' border='0' align='center' cellpadding='0' cellspacing='0'>
<tr><td height='20' colspan='2' valign='middle' style='font-size:12px;color:#000000;background:#72BEFE;BORDER-RIGHT:#aaaaaa 1px solid;padding-top:3px;'>当前位置：首页 >> 友情链接</td></tr>
</table>

<table width='729' border='0' align='center' cellpadding='0' cellspacing='0'>
<tr><td height='10' colspan='2'></td></tr>
</table>

  
  
	  
<TABLE width=728 border=0 align="center" cellPadding=0 cellSpacing=0 style="BORDER: #dddddd 1px solid;">
  <!--DWLayoutTable-->
  <TBODY>
    <TR style="BACKGROUND-COLOR: #f2fdee"> 
      <TD width=172 height=36>&nbsp;</TD>
      <TD width=331>&nbsp;</TD>
      <TD width=223>&nbsp;</TD>
    </TR>
    <TR style="BACKGROUND-COLOR: #f2fdee">
      <TD height=160>&nbsp;</TD>
      <TD valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="border:#dddddd 1px solid;">
          
		  <form name="form1" action="edit1.asp" method="post" onSubmit="return checkform1()">
		  <input type="hidden" name="id" value=<%=id%>>
            <tr> 
              <td height="27" colspan="2" align="center" valign="middle" bgcolor="#f6f6f6">修改文字链接</td>
            </tr>
            <tr> 
              <td width="83" height="30" align="center" valign="middle">链接名称：</td>
              <td width="249" valign="middle"><input name="linkname" type="text" id="linkname" value="<%=linkname%>"></td>
            </tr>
            <tr> 
              <td height="31" align="center" valign="middle">链接地址：</td>
              <td valign="middle"><input name="linkurl" type="text" id="linkurl" value="<%=linkurl%>">
                不输:http</td>
            </tr>
            <tr> 
              <td height="35">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr align="center" valign="top"> 
              <td height="35" colspan="2"> <input type="submit" name="Submit" value="确定修改"></td>
            </tr>
          </form>
        </table>
		
		
		</TD>
      <TD>&nbsp;</TD>
    </TR>
    <TR style="BACKGROUND-COLOR: #f2fdee">
      <TD height=54>&nbsp;</TD>
      <TD>&nbsp;</TD>
      <TD>&nbsp;</TD>
    </TR>
  </TBODY>
</TABLE>

<script language="javascript" src="/bottom.js"></script>

</BODY></HTML>
