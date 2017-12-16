<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<style type="text/css">
<!--
.STYLE4 {color: #FF0000; font-weight: bold; }
.STYLE6 {	font-size: 12pt;
	color: #0033CC;
}
.STYLE7 {font-size: 12px}
.STYLE8 {	font-size: 18pt;
	font-weight: bold;
}
-->
</style>
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或登录超时，请重新登录后操作！！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>


<table border="0" width="93%" cellspacing="0" cellpadding="0" id="table5">
											<tr>
												<td height="40">
												<p align="center"><b>教员信息提升到最前操作</b>                                                
												<p align="left"><span class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE7">随着教员的增加，你的信息可能会被置后显示，这样被浏览到的机率会大大降低，从而家教成功率也会下降，本站特别为教员用户推出信息提升服务，你随时可提升你的信息显示位置【同时出现在本站首页“最新教员”和“教员信息”页面的顶部】，当你点击下面的按钮后，你的<span class="STYLE4">家教信息将会自动提升到最前面显示</span>。</span></span>                                                
												<p align="center"></td>
											</tr>
											<tr>
												<td height="2" valign="top">												</td>
											</tr>
											<tr>
												<td height="38" align="center">
												<table border="0" width="524" cellspacing="0" cellpadding="0" height="61">
						<tr>
							<td width="524" height="61">
							<div align="center">
                                 <form method="POST" action="gotopdata_dw.asp">
									<input type="submit" value="提升教员信息" name="G1">
                                  </form>
							</div></td>
							</tr>
					</table>

												</td>
											</tr>
									</table>
									
　
<p>&nbsp;</p>
<p><span class="STYLE8"><img src="images/jtou.gif" width="16" height="16"><a href="law.asp?id=5&what=普通教员用户与VIP教员用户差别" target="_blank"><font color=#ff0000>升级成VIP会员，享受本站超值服务！！</font></a></span></p>