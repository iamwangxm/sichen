<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE2 {font-size: 12px}
.STYLE4 {color: #FF0000; font-weight: bold; }
.STYLE6 {
	font-size: 12pt;
	color: #0033CC;
}
.STYLE7 {font-size: 12px; color: #0033CC; }
.STYLE10 {font-size: 14px; color: #00659C; }
.STYLE11 {font-size: 14px; font-weight: bold; }
.STYLE12 {font-size: 14px; color: #FF0000; }
.STYLE13 {font-size: 14px; color: #FF0000; font-weight: bold; }
.STYLE9 {font-size: 14px; color: #006699; }
.STYLE14 {	font-size: 12pt;
	font-weight: bold;
	color: #FF3399;
}
.STYLE15 {	font-size: 18pt;
	font-weight: bold;
}
-->
</style>
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('登录超时请重新登录！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3" height="272">
<tr>
<td width="75%" valign="top" align="center" ><%
sql="select name,gr_view from in_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
%>
                                    <p>学员会员 <font color=#ff0000><%=unhtml(rs("name"))%></font> 你好：</p>
                                    <p align="left" class="STYLE7">&nbsp;&nbsp;&nbsp;&nbsp;随着注册人数的增加，你的资料可能会被置后显示，这样被浏览到的机率会大大降低，从而家教成功率也会下降，本站特别为学员用户推出信息提升服务，你随时可提升你的信息显示位置【同时出现在本站首页“最新学员”和“学员信息”页面的顶部】，当你点击下面的提升信息按钮后，你的<span class="STYLE4">学员资料将会自动提升到最前面显示</span>。</p>
                                    <p align="centen" class="STYLE6">  
									<form method="POST" action="gotopdata_gr.asp">
									<input type="submit" value="提升学员信息" name="G1">
                                  </form>
								    <!--p class="STYLE15">&nbsp;</p>
							    <p class="STYLE15"><img src="images/jtou.gif" width="16" height="16"><a href="yfcb_gr.html" target="_blank"><font color=#ff0000>升级成VIP会员，享受本站超值服务！！</font></a></p-->
                                
</td>
</tr>
</table>