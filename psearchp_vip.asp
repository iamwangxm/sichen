<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="area.asp"-->
<!--#include file="unhtml.asp"-->
<%
if Request.Cookies("user")="1" then  
response.write "<script language=JavaScript>" & chr(13) & "alert('学员用户请直接搜索【教员信息】，学员搜索功能是专为教员用户提供的！');"& "JavaScript:window.close();" & " </script>"
Response.End
end if


if Request.Cookies("e_fullness")<>"ok" and request("flag")<>1 then 'flag=1表示在主页点进来搜索
response.write "<script language=JavaScript>" & chr(13) & "alert('教员用户你好，你的资料还没埴完，请完成资料后，再来搜索人才信息！');"& "JavaScript:window.close();" & " </script>"
Response.End
end if


sql="select * from in_user where name<>'' and lock=false"
if request("city")<>"0"  then sql=sql+" and city='"&request("city")&"'"
if request("town")<>"0"  then sql=sql+" and town='"&request("town")&"'"
if request("cs")<>""  then sql=sql+" and xian='"&request("cs")&"'"
if request("fw")<>"" then sql=sql+" and fdfs='"&request("fw")&"'"
if request("sex")<>"" then sql=sql+" and sex='"&request("sex")&"'"
if request("job")<>"0" and request("job")<>"" then sql=sql+" and infudao='"&request("job")&"'"
if request("date")<>"不限" and request("date")<>"" then sql=sql+" and datediff('d',rdate,Now())<"&request("date")
sql=sql+" order by vip asc,gotop desc,id desc"

rs.open sql,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>学员超级搜索 - <%=webname%></title>
<style type="text/css">
<!--
.STYLE1 {font-weight: bold}
-->
</style></head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="106">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD"  valign="top">
			<div align="center">
				<table border="0" width="98%" cellspacing="0" cellpadding="0" id="table2" height="164">
					<tr>
						<td  valign="top">
						<div align="center">
							<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3" height="147">
								<tr>
									<td height="40" width="740" background="images/bg20.gif">
									<table border="0" width="740" cellspacing="0" cellpadding="0" id="table4" height="31">
										<tr>
											<td width="127">　</td>
											<td width="587">
											<p align="center">具体地区：
   											<%Call Showarea2(request("city"),request("town"))%>
											<%
											if request("cs")="" then
											response.write "不限"
											else
											response.write request("cs")
											end if
											%> 
                                            
											辅导科目：<b>
											<%
											if request("job")="0" then
											response.write "所有科目"
											else
											response.write request("job")
											end if
											%>
											</b> 
											服务方式：<b>
											<%
											if request("fw")="" then
											response.write "不限"
											else
											response.write request("fw")
											end if
											%></b>
									       
								          性别：<b>
								          <%
											if request("sex")="" then
											response.write "不限"
											else
											response.write request("sex")
											end if
											%></b>
											 时间：<b>
								          <%
											if request("date")="" then
											response.write "不限"
											else
											response.write request("date")
											end if
											%>
								          </b> 找到记录：<b><font color=#ff0000><%=rs.recordcount%></font></b></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td valign="top" align="center">
<%
if rs.recordcount=0 then
rs.close
response.write "<br>暂时没有相关学员信息！可能有以下原因：<br>1）学员库中没有相应的学员；<br>2）你指定的条件间相互矛盾；<br><br><font color=#ff0000>建议你放宽查询条件再试！！</font>" 
else
rs.pagesize=15
if request("action")="n" then
session("page")=session("page")+1
else
if request("action")="p" then
session("page")=session("page")-1
else
if request("action")="f" then
session("page")=1
else
if request("action")="l" then
session("page")=rs.pagecount
else
if isnumeric(request("page1"))=true then
session("page")=clng(request("page1"))
else
session("page")=1
end if
end if
end if
end if
end if
if session("page")>rs.pagecount then session("page")=rs.pagecount
if session("page")<1 then session("page")=1
rs.absolutepage=session("page")
%>
									<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table5" height="132">
									<tr>
										<td width="78" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
										<b>学员姓名</b></td>
										<td width="98" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
										<b>辅导方式</b></td>
										<td height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
									    <b>所在区域</b></td>
										<td width="70" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
															<b>性别</b></td>
										<td width="102" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
															<b>时薪(元)</b></td>
										<td width="111" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">
										<b>注册日期</b></td>
									</tr>
<%
for ii=1 to 15
%>	
								<tr>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;     padding-left:12" width="78" height="30" ><a  target =_blank href="student.asp?id=<%=rs("id")%>">
                                <%if Request.Cookies("user")<>"2" and Request.Cookies("ac")<>rs("ac") then %>
								<%=left(unhtml(rs("name")),1)%>学员 <%else%><%=unhtml(rs("name"))%><%end if%>
                                        
                                        </a></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="98" height="30" align="center" >								  
										<%=unhtml(rs("fdfs"))%>
								  </td>
										<td height="30" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " ><%
                  set rss=server.createobject("adodb.recordset")
sqls="select * from city where cityNo="&int(rs("city"))
rss.open sqls,conn,1,1
if rss.eof then

end if
if rs("city") =0 then
response.write "不详"
end if
               Cityid=rss("id")
               city=rss("cityname")
                rss.close
                set rss=nothing
                %>
										  <%
                  set rss=server.createobject("adodb.recordset")
sqls="select * from town where Cityid="&Cityid&" and  TownNo="&int(rs("town"))
rss.open sqls,conn,1,1
if rss.eof then

end if

               town=rss("townname")
                rss.close
                set rss=nothing
                %>
									    <%=unhtml(city)%><%=unhtml(town)%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="70" height="30" align="center" ><%=unhtml(rs("sex"))%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="102" height="30" align="center" ><%=unhtml(rs("shixin"))%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="111" height="30" align="center" ><%
								if (date()-rs("rdate"))<=10 then 										
								a=instr(rs("rdate"),chr(32))-1
								response.write "<font color =#FF0000>" 
								response.write Mid(rs("rdate"),6,a-4)
								response.write "<img  alt='最新加入的人才' src=images/new.gif>"
								end if 										
								if (date()-rs("rdate"))>10 then 		
								a=instr(rs("rdate"),chr(32))-1
								response.write Mid(rs("rdate"),1,a)
								end if 
								%>
								  　</td>
									</tr>
								<tr>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;     padding-left:12" height="30" background="images/bg1.gif">&nbsp;</td>
								  <td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " height="30" align="center" background="images/bg1.gif">&nbsp;</td>
								  <td height="30" colspan="4" background="images/bg1.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">辅导科目：<font color=#ff0000><%=unhtml(rs("infudao"))%></font></td>
								  </tr>
<%
rs.movenext
if rs.eof then exit for
next
%>
								<tr>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " height="42" align="center" colspan="7"><table border="0" width="504" cellspacing="0" cellpadding="0" height="31">
						<tr>
							<td width="120">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="225">
							<p align="center">&lt; <a href="psearchp_vip.asp?action=f&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">首页</a>&nbsp;&nbsp;   
							<a href="psearchp_vip.asp?action=p&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">上一页</a>&nbsp;&nbsp;   
							<a href="psearchp_vip.asp?action=n&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">下一页</a>&nbsp;&nbsp;   
							<a href="psearchp_vip.asp?action=l&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">尾页</a> &gt;</td>   
							<form method="POST" action="psearchp_vip.asp?city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&fw=<%=request("fw")%>&sex=<%=request("sex")%>&job=<%=request("job")%>&date=<%=request("date")%>">
							<td width="159">							
		<p>跳转到    
		<input type="text" name="page1" size="4" style="border: 1px solid #000000"> 页&nbsp;    
	<input type="submit" value="提交" name="B1"></p>
</td>
</form>
						</tr>
					</table>
</td>
									</tr>
									</table>
									<%
										rs.close
										end if
										%>

									</td>
									</tr>
								</table>
								</div>
							</td>
						</tr>
					</table>
					</div>
				</td>
		</tr>
	</table>
</div>
<%
set rs=nothing
set conn=nothing
%>

<!--#include file="base.asp"-->
</body>

</html>