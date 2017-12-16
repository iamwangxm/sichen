<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE10 {font-size: 14px; color: #00659C; }
.STYLE11 {font-size: 14px; font-weight: bold; }
.STYLE12 {font-size: 14px; color: #FF0000; }
.STYLE6 {font-size: 14px; color: #FF0000; font-weight: bold; }
.STYLE9 {font-size: 14px; color: #006699; }
.STYLE13 {
	font-size: 12pt;
	font-weight: bold;
	color: #FF3399;
}
.STYLE7 {	font-size: 18pt;
	font-weight: bold;
}
-->
</style>

<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('登录超时请重新登录！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

                                  <p><span class="STYLE13">家教状态更改</span></p>
                                  <table width="434" border="0" align="center" cellspacing="0">
                                  <tr>
                                    <td width="404" height="85">&nbsp;&nbsp;&nbsp;&nbsp;教员如果接到满意的家教业务，或暂时不想接家教业务，但又不愿意注销会员的情况下，你可使用本功能，将家教状态设置为“关闭”状态，这时你的家教信息就不会显示出来；当您需要再次使用家教功能时，请更改状态为“开启”状态，这样就可正常显示了。</td>
                                  </tr>
                                  <tr>
                                    <td height="114"><%
sql="select name,dw_view from en_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
%>
                                      <p>教员会员 <font color=#ff0000><%=unhtml(rs("name"))%></font> 你好：</p>
                                      <span class="STYLE1">你当前状态是:</span>
                                      <% if rs("dw_view")="N" then 
									 Response.Write "<font color=#ff0000><strong>开启状态</strong></font>"
									  else
									   Response.Write "<font color=#ff0000><strong>关闭状态</strong></font>"
									   end if 
								   %></td>
                                  </tr>
                                  <tr>
                                    <td><hr></td>
                                  </tr>
                                  <tr>
                                    <td height="28">你将更改状态为（不变请不要设置）：</td>
                                  </tr>
                                  <tr>
                                    <td height="72"><div align="center">
                                        <form method="POST" action="dw_viewdata.asp">
                                          <INPUT TYPE="radio" <%if rs("dw_view") ="N" then Response.Write "checked"%> VALUE="N" NAME="dw_view">
                                          开启状态
                                          <INPUT TYPE="radio" <%if rs("dw_view") ="Y" then Response.Write "checked"%> VALUE="Y" NAME="dw_view" >
                                          关闭状态 <br>
                                          <br>
                                          <input type="submit" value="确定更改" name="G1">
                                        </form>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td height="76"><p>说明：
                                       状态为“开启状态”时，你的信息正常显示；</br>
                                      状态为“关闭状态”时，你的信息暂时不显示；</br>
                                    你随时可更改显示状态（VIP会员专有）。 </p></td>
                                  </tr>
                                </table>
                                  <p><br>
                                  </p>
                                <p><span class="STYLE7"><img src="images/jtou.gif" width="16" height="16"><a href="law.asp?id=5&what=普通教员用户与VIP教员用户差别" target="_blank"><font color=#ff0000>升级成VIP会员，享受本站超值服务！！</font></a></span> </p></td>

<%
rs.close
set rs=nothing
set conn=nothing
%>  