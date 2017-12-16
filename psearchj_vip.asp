<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="area.asp"-->
<!--#include file="unhtml.asp"-->
<%
if Request.Cookies("user")="2" then  
response.write "<script language=JavaScript>" & chr(13) & "alert('教员用户请直接搜索【学员信息】，教员搜索功能是专为学员用户提供的！');"& "JavaScript:window.close();" & " </script>"
Response.End
end if

if Request.Cookies("i_fullness")<>"ok" and request("flag")<>1 then 'flag=1表示在主页点进来搜索
response.write "<script language=JavaScript>" & chr(13) & "alert('学员用户你好，你还未填写完你的基本信息，请完成你的基本信息后【免费的】，再来搜索教员信息！');"& "JavaScript:window.close();" & " </script>"
Response.End
end if

sql="select * from en_user where lock=false and name<>''"


if request("city")<>"0"  and  request("city")<>""  then
   if request("town")<>"0" and  request("town")<>"" then
      servercity=request("town")&"|"&request("city")&","
      sql=sql+" and servercity like '%"&request("town")&"|"&request("city")&",%'"
   else
      servercity="|"&request("city")&","
      sql=sql+" and servercity like '%|"&request("city")&",%'"
   end if
end if


if request("job")<>"0" and request("job")<>"" then sql=sql+" and enfudao like '%"&request("job")&"%'"
if Trim(request("cs"))<>"" then sql=sql+" and xian like '%"&request("cs")&"%'"
if request("sex")<>"" then sql=sql+"and sex = '"&request("sex")&"'"
if request("date")<>"不限" and request("date")<>"" then sql=sql+" and datediff('d',rdate,Now())<"&request("date")
sql=sql+" order by vip asc,gotop desc,id desc"
'response.write sql
rs.open sql,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>教员超级搜索 - <%=webname%></title>
</head>

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
									<td height="40" width="740" background="images/bg21.gif">
									<table border="0" width="740" cellspacing="0" cellpadding="0" id="table4" height="31">
										<tr>
											<td width="127">　</td>
											<td width="587">
											<p align="center">具体镇区：
											<%Call Showarea(servercity)%>
                                              <%
											if request("cs")="" then
											response.write "不限"
											else
											response.write request("cs")
											end if
											
											%> 
                                            
                                            
                                            
                                            
											  科目类别：<b><%
											if request("job")="0" then
											response.write "所有类别"
											else
											response.write request("job")
											end if
											%></b> 
										  性别：<b><%
											if request("sex")="" then
											response.write "不限"
											else
											response.write request("sex")
											end if
											%>
											</b>
											时间：<b><%
											if request("date")="" then
											response.write "不限"
											else
											response.write request("date")
											end if
											%> </b>找到记录：<b><font color=#ff0000><%=rs.recordcount%></font></b></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td valign="top" align="center">
<%
if rs.recordcount=0 then
rs.close
response.write "<br>暂时没有相关教员信息！可能有以下原因：<br>1）教员库中没有相应的教员；<br>2）你指定的条件间相互矛盾；<br><br><font color=#ff0000>建议你放宽查询条件再试！！</font>" 
else
rs.pagesize=20
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
								<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table5" height="92">
									<tr>
										<td width="80" height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;    padding-left:12"><strong>教员姓名</strong></td>
										<td width="100" height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>教员身份</b></td>
										<td width="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>性别</b></td>
										<td width="101" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>每小时价格[元]</b></td>
										<td width="72" height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>注册日期</b></td>
										<td width="64" height="30" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><b>服务区域</b></td>
										<td width="109" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">&nbsp;</td>
										<td width="99" height="30" align="center" background="imagen/web_01_05.gif" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; ">&nbsp;</td>
									</tr>
<%
for ii=1 to 20

%>	
								<tr>
										<td width="80" height="30" style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;    padding-left:12"><a href="job2.asp?<%=rs("id")%>" target="_blank"></a><a target =_blank  href="teacher.asp?id=<%=rs("id")%>">

                                <%if Request.Cookies("user")<>"1" and Request.Cookies("ac")<>rs("ac") then %>
								<%=left(unhtml(rs("name")),1)%>教员 <%else%><%=unhtml(rs("name"))%><%end if%>
                                                            
                                                            </a>
								<%
                                if (date()-rs("rdate"))<=10 then 

								response.write "<img  alt='最新加入招聘职位' src=images/hot.gif>"
								end if
								
	
								 %>
                                
                                                                                            
                                        </td>
										<td width="100" height="30"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><%=unhtml(rs("trade"))%>
								        </td>
										<td width="30" height="30"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><%=unhtml(rs("sex"))%></td>
										<td width="101" height="30"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><%=unhtml(rs("fund"))%></td>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="72" height="30" >
								  
								    <%
									  a=instr(rs("rdate"),chr(32))-1
								      response.write Mid(rs("rdate"),1,a)
								    %>
								  </td>
										<td height="30" colspan="3"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "><%Call Showarea(unhtml(rs("servercity")))%></td>
								  </tr>
                                    
                                    
                                    
									<tr>
									  <td height="30" align="center"  style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "   background="images/bg1.gif"></td>
										<td height="30" colspan="7"   style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; "   background="images/bg1.gif">擅长科目：<font color=#ff0000><%=left(unhtml(rs("enfudao")),40)%></font></td>
									</tr>
                                    
                                                                        
<%
rs.movenext
if rs.eof then exit for
next
%>
								<tr>
										<td style="border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; " width="734" height="42" align="center" colspan="6"><table border="0" width="504" cellspacing="0" cellpadding="0" height="31">
						<tr>
							<td width="120">
							<p align="center">当前页码:<font color="#FF0000"><%=session("page")%></font>/<%=rs.pagecount%></td>
							<td width="225">
							<p align="center">&lt; <a href="psearchj_vip.asp?action=f&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&job=<%=request("job")%>&sex=<%=request("sex")%>&date=<%=request("date")%>">首页</a>&nbsp;
							<a href="psearchj_vip.asp?action=p&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&job=<%=request("job")%>&sex=<%=request("sex")%>&date=<%=request("date")%>">上一页</a>&nbsp;
							<a href="psearchj_vip.asp?action=n&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&job=<%=request("job")%>&sex=<%=request("sex")%>&date=<%=request("date")%>">下一页</a>&nbsp;
							<a href="psearchj_vip.asp?action=l&city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&job=<%=request("job")%>&sex=<%=request("sex")%>&date=<%=request("date")%>">尾页</a> &gt;</td>
							<form method="POST" action="psearchj_vip.asp?city=<%=request("city")%>&town=<%=request("town")%>&cs=<%=request("cs")%>&job=<%=request("job")%>&sex=<%=request("sex")%>&date=<%=request("date")%>">
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
set rs2=nothing
set rs=nothing
set conn=nothing
%>

<!--#include file="base.asp"-->
</body>

</html>