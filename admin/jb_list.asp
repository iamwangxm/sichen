<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
%>

<p align="center"><font color="#FF0000"><strong><font size="4">虚假信息举报管理中心</font></strong></font></p>
<table width="98%" height="164" border="0" align="center" cellpadding="0" cellspacing="0" id="table2">
					<tr>
<td style="border: 1px solid #C0C0C0" valign="top">
 
  <% dim rs, icount,ipagesize,maxpage,page,x,i,action,rs2
set rs=server.createobject("adodb.recordset")
rs.open "select * from jb order by date desc",conn,1,1
if err.number<>0 then
response.write "数据库中无“虚假信息举报”相关数据"
end if

'------------------------------------------分页开始
if rs.recordcount=0 then 
response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=#ff0000>数据库中暂无“虚假信息举报”相关数据<font>"
else
rs.PageSize =10 '每页记录条数
iCount=rs.RecordCount '记录总数
iPageSize=rs.PageSize
maxpage=rs.PageCount 
page=request("page")

if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if

if page<1 then
page=1
elseif page>maxpage then
page=maxpage
end if

rs.AbsolutePage=Page

if page=maxpage then
x=iCount-(maxpage-1)*iPageSize
else
x=iPageSize
end if

					For i=1 To x	%>	  
								
								 &nbsp;<font color=#ff0000>〓</font><strong>【
								 举报ID:<%=rs("id")%> 】</strong>&nbsp;&nbsp;举报日期：<%=rs("date")%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF66FF"><a href="del_jb.asp?id=<%=rs("id")%>">删除</a></font><br>
								 &nbsp;&nbsp;被举报单位/个人名称：<%=rs("jname")%><br>
&nbsp;&nbsp;举报内容：<%=rs("content")%><br>
<br>--------------------举报者信息------------------------<br>
&nbsp;&nbsp;举报者姓名:<%=rs("name")%><br>
&nbsp;&nbsp;举报者电话:<%=rs("phone")%><br>
&nbsp;&nbsp;举报者QQ：<%=rs("qq")%><br>
&nbsp;&nbsp;举报者邮箱：<%=rs("email")%><br>
&nbsp;&nbsp;举报者证件：<%=rs("zj")%><br>
&nbsp;&nbsp;举报者IP：<%=rs("ip")%><br>
&nbsp;&nbsp;举报者用户ID：<% if isnull(rs("x2")) then %> <%else%><% len1=len(rs("x2"))-1 
if right(rs("x2"),1)="1" then%> <a href=../student.asp?id=<%=left(rs("x2"),len1)%> target="_blank"><%=rs("x2")%></a>
<%else%>
<a href=../teacher.asp?id=<%=left(rs("x2"),len1)%> target="_blank"><%=rs("x2")%></a>
<%end if %>
<%end if %>
【末位为<font color="#FF0000"><strong>1</strong></font>表示学员用户，<strong><font color="#FF0000">2</font></strong>为教员用户】<br> 																																		
<%
response.write "<hr width=100% color=777777 size=1>"
rs.movenext
next
call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
end if
rs.close
set rs=nothing

Sub PageControl(iCount,pagecount,page,table_style,font_style)
'生成链接
Dim query, a, x, temp
action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")

query = Split(Request.ServerVariables("QUERY_STRING"), "&")
For Each x In query
a = Split(x, "=")
If StrComp(a(0), "page", vbTextCompare) <> 0 Then
temp = temp & a(0) & "=" & a(1) & "&"
End If
Next

Response.Write("<table width=100% border=0 cellpadding=0 cellspacing=0 bgcolor=#f1f1f1>" & vbCrLf ) 
Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & temp & "Page='+ this.page.value;return false;""><TR bgcolor=#f1f1f1>" & vbCrLf )
Response.Write("<TD align=center height=35>" & vbCrLf )
Response.Write(font_style & vbCrLf ) 

if page<=1 then
Response.Write ("首 页 " & vbCrLf) 
Response.Write (" " & vbCrLf)
else 
Response.Write("<A HREF=" & action & "?" & temp & "Page=1>首 页</A> " & vbCrLf)
Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & "></A> " & vbCrLf)
end if

if page>=pagecount then
Response.Write (" " & vbCrLf)
Response.Write ("尾 页 " & vbCrLf) 
else
Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">上一页</A> " & vbCrLf)
Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">下一页</A> " & vbCrLf)
Response.Write("<A HREF=" & action & "?" & temp & "Page=" & pagecount & ">尾 页</A> " & vbCrLf) 
end if

Response.Write(" 页次：" & page & "/" & pageCount & "页" & vbCrLf)
Response.Write(" 共有" & iCount & "个记录信息" & vbCrLf)
Response.Write(" 转到" & "<INPUT CLASS=wenbenkuang TYEP=TEXT NAME=page SIZE=2 Maxlength=5 VALUE=" & page & ">" & "页" & vbCrLf & "<INPUT CLASS=go-wenbenkuang type=submit value=GO>")
Response.Write("</TD>" & vbCrLf ) 
Response.Write("</TR></form>" & vbCrLf ) 
Response.Write("</table>" & vbCrLf ) 
End Sub
%>
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
