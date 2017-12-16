<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="area.asp"-->
<!--#include file="unhtml.asp"-->
<%
if not(isnumeric(request("id"))) then
response.redirect "nodata.html"
rs.close
end if 
sql="select * from en_user where id="&clng(request("id"))
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
if rs("dw_view")="Y" then
	tname=rs("name")
	rs.close
	set rs=nothing
	set conn=nothing
	response.write "<script language=JavaScript>" & chr(13) & "alert('『"&tname&"』的信息已被"&tname&"设置为隐藏，系统暂时不显示！');"&"JavaScript:window.close();"&" </script>"
	response.end
end if
sql1="update en_user set clicks="&rs("clicks")+1&" where id="&rs("id")

conn.execute(sql1)
%>

                            
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>家教<%=left(rs("name"),1)%>教员简介-擅长学科：<%=left(unhtml(rs("enfudao")),20)%>会员信息来自博乐教育家教网</title>

<!--#include file="top.asp"-->
</head>
<body>

<table border="1" width="950" cellspacing="0" cellpadding="0" bordercolor="#B8D5AD" id="table9" style="border-collapse: collapse" align="center">


                          <tr>
                            <td height="30" background="imagen/web_01_05.gif"  colspan="2">&nbsp; <b>自我介绍</b></td>
                          </tr>  
                          <tr>
                          
                            <td height="20" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px; padding-left:10" colspan="2"><br><font size="4" color=#ff0000><strong>
                             <%
								if Request.Cookies("user")<>"1" and Request.Cookies("ac")<>rs("ac") then %>
								<%=left(unhtml(rs("name")),1)%>教员简介<%else%> <%=unhtml(rs("name"))%><%end if%>
									  </strong></font><br>会员编号：<strong>TE<%=rs("id")%></strong></strong></font><a href="company2.asp?<%=rs("id")%>" target="_blank">.</a>发布时间：
	                         <%
								a=instr(rs("rdate"),chr(32))-1
								response.write Mid(rs("rdate"),1,a)
							  %> 

                                  <%if rs("rz")=true  then  
							  response.write "<a href=rz.html target='_blank'><font color=#ff0000>★认证会员★</font></a>"
							  else
							  response.write "<a href=rz.html target='_blank'><font color=#0033FF>★非认证会员★</font></a>"
							  end if %>
                                    <%if rs("vip")=true  then  
							  response.write "<a href=rz.html target='blank'><font color=#ff0000>★VIP认证会员★</font></a>"
							  end if %> (被阅<font color="#FF3900"><%=rs("clicks")+1%></font>次)
                             </td>
                              
                          <tr>
                            <td height="30" background="imagen/web_01_05.gif"  colspan="2">&nbsp; <b>自我介绍</b></td>
                          </tr>                              
                          </tr>
                          <tr>
                            <td height="78" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px" colspan="2">
                            <div align="center">
                                <table border="0" width="98%" cellspacing="0" cellpadding="0" id="table7" height="64">
                                  <tr>
                                    <td><%=unhtml(rs("jianj"))%><br>
                                        <br></td>
                                  </tr>
                                </table>
                            </div>
                            </td>
                          </tr>
                          <tr>
                            <td height="12" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px" colspan="2"><div align="center"><a href="tgjt.html" target="_blank" class="STYLE3"><font color=#ff0000>提高警惕，谨防受骗！</font>查看最新公告</a> <a href="jb.asp" target="_blank"><strong><font  color=#FF00FF>我要举报此教员</font></strong></a></div></td>
                          </tr>
                          <tr>
                            <td height="25" background="imagen/web_01_05.gif" colspan="4">&nbsp; <b><font color="#000000">基本信息</font></b></td>
                          </tr>
                          <tr>
                            <td height="7" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px">&nbsp;教员姓名：<%if Request.Cookies("user")<>"1" and Request.Cookies("ac")<>rs("ac")  then%><%=left(unhtml(rs("name")),1)%>教员 [<a href="sm.html" target="_blank"><font color=#ff0000>学员才可见真实姓名</font></a>] 
                            <%else%> <%=unhtml(rs("name"))%><%end if%></td>
                            <td height="7" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom-width: 1px">&nbsp;年龄：<%if rs("birthday")<>"" then response.write(year(now())-cint(rs("birthday")))%>&nbsp;&nbsp;&nbsp;&nbsp;民族：<%=unhtml(rs("nation"))%>&nbsp;&nbsp;&nbsp;&nbsp;来自：<%=unhtml(rs("lzsf"))%></td>
                          </tr>
                          <tr>
                            <td width="50%" height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4; padding-left: 6; ">擅长科目：<font color=#ff0000><%=unhtml(rs("enfudao"))%></font></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4;padding-left: 6; ">服务区域：<font color=#ff0000><%Call Showarea(unhtml(rs("servercity")))%></font></td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;教员身份：<%=unhtml(rs("trade"))%></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;教员性别：<%=unhtml(rs("sex"))%></td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;毕业或在读学校：<%=unhtml(rs("school"))%></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;毕业或在读学历：<%=unhtml(rs("xueli"))%></td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;毕业或在读专业：<%=unhtml(rs("special"))%></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;辅导经验：<%=unhtml(rs("fdjy"))%>年</td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;每小时单价：<%=unhtml(rs("fund"))%> [元] <a href="law.asp?id=7&what=家教市场家教收费参考" target="_blank">参考价格</a></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;每次最少辅导：<%=unhtml(rs("mcsj"))%>小时</td>
                          </tr>
                          <tr>
                            <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;服务方式：<%=unhtml(rs("fwff"))%></td>
                            <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;有效期：<%=unhtml(rs("yxq"))%></td>
                          </tr>

</table>
<%if Request.Cookies("login")="yes" then '管理员登陆可以查看联系方式%>
<table border="1" align="center" cellspacing="0" bordercolor="#B8D5AD" width="950" >
  <tr>
    <td height="25" background="imagen/web_01_05.gif" colspan="4"><p align="left">&nbsp; <b><font color="#000000">联系方式(只有管理员才能查看！)</font></b></td>
  </tr>
  <tr>
    <td width="421" height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;通讯地址：<%=unhtml(rs("address"))%></td> 
    <td width="307" height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;邮政编码：<%=unhtml(rs("zip"))%></td> 
  </tr>
  <tr>
    <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;联系电话：<%=unhtml(rs("phone"))%></td>
    <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;电子信箱：<a href="mailto:<%=unhtml(rs("email"))%>"><%=unhtml(rs("email"))%></a></td> 
  </tr>
  <tr>
    <td height="25" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #D5EAF4; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;个人网站：<a target=_blank  href="<%=unhtml(rs("web"))%>"><%=unhtml(rs("web"))%></a></td>
    <td height="25" style="border-left-width: 1px; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #D5EAF4">&nbsp;QQ号码：<%=unhtml(rs("qq"))%></td>
  </tr>
</table>
<%end if%>

<% if Request.Cookies("user")="1"  then'如果学员已经登陆%>
<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td><div align="center">  
      <table border="0" width="87%" cellspacing="0" cellpadding="0" id="table17" height="55">
        <tr>
          <td align="center"><a href="add_inorder.asp?enid=<%=rs("id")%>"><img src="images/person_m6.gif" alt="预约这位教员" width="124" height="22" border="0"></a><a name="a"></a></td>
          <td align="center"><a href="add_indepot.asp?enid=<%=rs("id")%>"><img src="images/company_m4.gif" alt="添加到教员库收藏" width="124" height="22" border="0"></a></td>
          <!--td align="center"><a href="JavaScript:openScript('sendmessage.asp?tid=<%=rs("id")%>&ttype=2',450,300)"><img src="images/company_m1.gif" alt="免费发送站内短消息联系" width="124" height="22" border="0"></a></td-->
          <td align="center"><A HREF="JavaScript:window.print();"><img src="images/company_m2.gif" alt="打印本页" width="124" height="22" border="0"></a></td>
          <td align="center"><A HREF="JavaScript:window.close();"><img src="images/company_m3.gif" alt="关闭此页" width="124" height="22" border="0"></a></td>
        </tr>
      </table>

    </div></td>
  </tr>
</table>
<%else%>
<%if Request.Cookies("ac")<>rs("ac") and  (Request.Cookies("user")<>"2") then%>
<table border="1" align="center" cellspacing="0" bordercolor="#B8D5AD" width="950" >
  <tr>
    <td height="25" background="imagen/web_01_05.gif" colspan="4" style=" font-size:16px"><p align="left">&nbsp; <b><font color="#000000">想请这位教家，我该怎么做？</font></b></td>
  </tr>
</table>

<table width="950" border="1" cellspacing="0" bordercolor="#B8D5AD" align="center">
  <tr>
    <td><div align="center">  
      <table border="0" width="95%" cellspacing="0" cellpadding="0" id="table17" height="55">
        <tr>
          <td height="30">方法一：如果您已注册了本站学员会员，请先<a onClick="gologin();" style="CURSOR: hand">登录</a>后再预约。</td>
        </tr>
        <tr>
          <td height="30">方法二：如果您还没有注册本站学员会员，请先<a href="reg_gr.asp?enid=<%=rs("id")%>">注册</a>后再预约。</td>
        </tr>  
        <tr>
          <td height="30">方法三：如果您不想注册，请致电本站客服预约此教员，电话：18260298314</td>
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