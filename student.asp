<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->
<html>
<%
if not(isnumeric(request("id"))) then
response.redirect "nodata.html"
rs.close
end if
sql="select * from in_user where id="&clng(request("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
if rs("lock")=true then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('此用户已被管理员锁定！');"&"window.location.href = 'index.asp'"&" </script>"
response.end
end if
if rs("gr_view")="Y" then
tname=rs("name")
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('"&tname&"  的学员信息已被"&tname&"设置为隐藏，系统暂时不显示！');"&"JavaScript:window.close();"&" </script>"
response.end
end if
sql1="update in_user set clicks="&rs("clicks")+1&" where id="&rs("id")

conn.execute(sql1)

%>
<%
                  set rss=server.createobject("adodb.recordset")
sqls="select * from en_city where id="&int(rs("city"))
rss.open sqls,conn,1,1
if rss.eof then

end if
if rs("city") =0 then
response.write "不详"
end if
               Cityid=rss("id")
               city=rss("shiName")
                rss.close
                set rss=nothing
                %>
                                <%
                  set rssx=server.createobject("adodb.recordset")
sqlsx="select * from en_city where   id="&int(rs("town"))
rssx.open sqlsx,conn,1,1
if rssx.eof then

end if

               town=rssx("shiName")
                rssx.close
                set rssx=nothing
                %>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%if trim(town)<>trim(city) then response.write city&town else response.write town end if%><%=left(rs("name"),1)%>学员家教需求-需辅导学科：<%=left(unhtml(rs("infudao")),20)%>会员信息来自博乐教育家教网</title>
<style type="text/css">
<!--
.STYLE1 {color: #006633}
.STYLE6 {color: #0066CC}
.STYLE8 {color: #FF0000}
.STYLE9 {color: #0066FF}
-->
</style>
<!--#include file="top.asp"-->
</head>

<body>

<table border="1" width="950" cellspacing="0" cellpadding="0" bordercolor="#B8D5AD" id="table9" style="border-collapse: collapse" align="center">
  <tr>
    <td height="30" background="imagen/web_01_05.gif" >&nbsp; <b>自我介绍</b></td>
  </tr>  
  <tr>
    <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px; padding-left:10"><br>
      <font size="4"color=#ff0000><strong>
        <%if Request.Cookies("user")<>"2" and Request.Cookies("ac")<>rs("ac")  then%>
		<%=left(unhtml(rs("name")),1)%>学员简介 
        <%else%>
        <%=unhtml(rs("name"))%>
		<%end if%>
        
      </strong></font><br>会员编号：<strong>ST<%=rs("id")%></strong><a href="student2.asp?<%=rs("id")%>" target="_blank">.</a>
       <%if rs("rz")=true  then  
							  response.write "<a href=rz.html target='blank'><font color=#ff0000>★认证会员★</font></a>"
							  else
							  response.write "<a href=rz.html target='blank'><font color=#0033FF>★非认证会员★</font></a>"
							  end if %>
	   <%if rs("vip")=true  then  
							  response.write "<a href=rz.html target='blank'><font color=#ff0000>★VIP认证会员★</font></a>"
							  end if %>发布：<%
	a=instr(rs("rdate"),chr(32))-1
	response.write Mid(rs("rdate"),1,a) %>&nbsp;(被阅<font color="#FF3900"><%=rs("clicks")+1%></font>次)
	  <a href="jb.asp" target="_blank"><strong><font  color=#FF00FF>我要举报此学员</font></strong></a></td>
  </tr>
</table>
<table border="1" width="950" cellspacing="0" cellpadding="0" bordercolor="#B8D5AD" id="table9" style="border-collapse: collapse" align="center">
  <tr>
    <td height="30" colspan="2" background="imagen/web_01_05.gif">&nbsp; <b>自我介绍或辅导要求</b></td>
  </tr>
  <tr>
    <td width="600" height="118" valign="top" >
    <div align="center">
      <table border="0" width="100%" cellspacing="0" cellpadding="0" id="table15" height="23">
        <tr>
          <td style="padding-left: 6;"><%=unhtml(rs("xyjj"))%></td>
        </tr>
      </table>
    </div></td>
    <td align="right"><!--#include file="studenttimes.asp"--></td>
  </tr>
</table>
<table border="1" width="950" cellspacing="0" cellpadding="0" bordercolor="#B8D5AD" id="table2" style="border-collapse: collapse" align="center">
  <tr>
    <td height="30" background="imagen/web_01_05.gif" colspan="4">&nbsp; <b>学员基本信息</b></td>
  </tr>
  <tr>
    <td height="25" width="130" bgcolor="#FEFBF4">&nbsp;&nbsp;姓&nbsp;&nbsp;&nbsp; 名：</td>
    <td width="205"> 　<%if Request.Cookies("user")<>"2" and Request.Cookies("ac")<>rs("ac")  then%><%=left(unhtml(rs("name")),1)%>学员 [<a href="sm.html" target="_blank"><font color=#ff0000>教员才可见真实姓名</font></a>] 
    <%else%>
	<%=unhtml(rs("name"))%>
	<%end if%>
    </td>
    <td height="26" width="101" align="center" bgcolor="#FEFBF4"> 性&nbsp;&nbsp;&nbsp; 别：</td>
    <td> 　<%=unhtml(rs("sex"))%></td>
  </tr>
  
  <tr>
    <td height="25" width="130" bgcolor="#FEFBF4">&nbsp;&nbsp;所在地区：</td>
    <td width="205"> 　<%=unhtml(city)%><%=unhtml(town)%><%=unhtml(rs("xian"))%></td>
    <td height="25" width="101" align="center" bgcolor="#FEFBF4">年&nbsp;&nbsp;&nbsp; 龄：</td>
    <td> 　<%=unhtml(rs("age"))%></td>
  </tr>
  <tr>
    <td height="25" width="130" bgcolor="#FEFBF4">&nbsp;&nbsp;所在年级：</td>
    <td width="205"> 　<%=unhtml(rs("zxnj"))%></td>
    <td width="101" height="0" align="center" bgcolor="#FEFBF4"> 现读学校：</td>
    <td width="205"> 　<%=unhtml(rs("school"))%></td>
  </tr>
  <tr>
    <td width="130" height="25" bgcolor="#FEFBF4">&nbsp;&nbsp;需要辅导科目：</td>
    <td width="205">　<font color=#ff0000><%=unhtml(rs("infudao"))%></font></td>
    <td width="101" height="0" align="center" bgcolor="#FEFBF4">辅导方式：</td>
    <td width="205">　<%=unhtml(rs("fdfs"))%></td>
  </tr>
  <tr>
    <td width="130" height="25" bgcolor="#FEFBF4">&nbsp;&nbsp;每小时可支付：</td>
    <td width="205">　<%=unhtml(rs("shixin"))%> [元] <a href="law.asp?id=7&what=家教市场家教收费参考" target="_blank">参考价格</a></td>
    <td width="101" height="0" align="center" bgcolor="#FEFBF4">信息有效期：</td>
    <td width="205">　<%=unhtml(rs("yxq"))%></td>
  </tr>

</table>

<%if Request.Cookies("login")="yes" then '管理员登陆可以查看联系方式%>
<table border="1" align="center" cellspacing="0" bordercolor="#B8D5AD" width="950">
  <tr>
    <td height="25" background="imagen/web_01_05.gif" colspan="4"><p align="left">&nbsp; <b><font color="#000000">联系方式(只有管理员才能查看！)</font></b></td>
  </tr>
  <tr>
    <td width="421" height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;通讯地址：<%=unhtml(rs("address"))%></td> 
    <td width="307" height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;邮政编码：<%=unhtml(rs("posts"))%></td> 
  </tr>
  <tr>
    <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;联系电话：<%=unhtml(rs("phone"))%></td>
    <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;电子信箱：<a href="mailto:<%=unhtml(rs("email"))%>"><%=unhtml(rs("email"))%></a></td> 
  </tr>
  <tr>
    <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;QQ号码：<%=unhtml(rs("oicq"))%></td>
    <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4"></td>

  </tr>
</table>
<%end if%>


<%if Request.Cookies("user")="2" then'如果教员已经登陆%>
<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td><div align="center">
      <table border="0" width="87%" cellspacing="0" cellpadding="0" id="table17" height="55">
        <tr>
          <td align="center"><a href="add_enorder.asp?inid=<%=rs("id")%>"><img src="images/person_m5.gif" alt="预约这份家教" width="124" height="22" border="0"></a></td>
          <td align="center"><a href="add_endepot.asp?inid=<%=rs("id")%>"> <img src="images/person_m1.gif" alt="添加到学员库中收藏" width="124" height="22" border="0"></a></td>
          <td align="center"><A HREF="JavaScript:window.print();"><img src="images/company_m2.gif" alt="打印此页" width="124" height="22" border="0"></A></td>
          <td align="center"><A HREF="JavaScript:window.close();"><img src="images/company_m3.gif" alt="关闭此页" width="124" height="22" border="0"></A></td>
        </tr>
      </table>
    </div></td>
  </tr>
</table>
<%else%>
<%if Request.Cookies("ac")<>rs("ac") and  (Request.Cookies("user")<>"1") then%>
<table border="1" align="center" cellspacing="0" bordercolor="#B8D5AD" width="950" >
  <tr>
    <td height="25" background="imagen/web_01_05.gif" colspan="4" style=" font-size:16px"><p align="left">&nbsp; <b><font color="#000000">想做这份教家，我该怎么申请？</font></b></td>
  </tr>
</table>

<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td><div align="center">  
      <table border="0" width="95%" cellspacing="0" cellpadding="0" id="table17" height="55">
        <tr>
          <td height="30">方法一：如果您已注册了本站教员会员，请先<a onClick="gologin();" style="CURSOR: hand">登录</a>后再预约。</td>
        </tr>
        <tr>
          <td height="30">方法二：如果您还没有注册本站教员会员，请先<a href="/reg_dw.asp?inid=<%=rs("id")%>">注册</a>后再预约。</td>
        </tr>  
        <tr>
          <td height="30">方法三：如果您不想注册，请致电本站客服预约此学员，电话：0769-83188360。</td>
        </tr>                
      </table>

    </div></td>
  </tr>
</table>
<%end if%>
<%end if%>
      
<%
rs.close
set rs=nothing
set conn=nothing
%>

<script language="JavaScript"> 
function gologin() { 
login_form.name.focus()
var t=document.getElementById("li"); 
	  t.height=500;

} 
</SCRIPT>
<!--#include file="base.asp"-->
</body>

</html>