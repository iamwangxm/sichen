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
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('登录超时请重新登录！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>



                                
                                <table width="370" border="0" align="center" cellspacing="0">
                                  <tr>
                                    <td width="368"><%
sql="select name,gr_view from in_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
%>
                                        <p>学员会员 <font color=#ff0000><%=unhtml(rs("name"))%></font> 你好：</p>
                                      <span class="STYLE1">你当前状态是:</span>
                                        <% if rs("gr_view")="N" then 
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
                                    <td>你将更改状态为（不变请不要设置）：</td>
                                  </tr>
                                  <tr>
                                    <td><div align="center">
                                        <form method="POST" action="gr_viewdata.asp">
                                          <INPUT TYPE="radio"<%if rs("gr_view") ="N" then Response.Write "checked"%> VALUE="N" NAME="gr_view">
                                          开启状态
                                          <INPUT TYPE="radio" <%if rs("gr_view") ="Y" then Response.Write "checked"%> VALUE="Y" NAME="gr_view" >
                                          关闭状态 <br>
                                          <br>
                                          <input type="submit" value="确定更改" name="G1">
                                        </form>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td><p>说明：
                                       状态为“开启状态”时，你的信息正常显示；</br>
                                      状态为“关闭状态”时，你的信息暂时不显示；</br>
                                      你随时可更改显示状态（VIP会员专有）。 </p></td>
                                  </tr>
                                </table>
                                  <!--p><br>
                                </p>
                                <p><span class="STYLE7"><img src="images/jtou.gif" width="16" height="16"><a href="yfcb_gr.html" target="_blank"><font color=#ff0000>升级成VIP会员，享受本站超值服务！！</font></a></span></p-->