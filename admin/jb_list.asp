<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½���߳�ʱ,���ص�½��');"&"window.location.href = '../'"&" </script>"
response.end
end if
%>

<p align="center"><font color="#FF0000"><strong><font size="4">�����Ϣ�ٱ���������</font></strong></font></p>
<table width="98%" height="164" border="0" align="center" cellpadding="0" cellspacing="0" id="table2">
					<tr>
<td style="border: 1px solid #C0C0C0" valign="top">
 
  <% dim rs, icount,ipagesize,maxpage,page,x,i,action,rs2
set rs=server.createobject("adodb.recordset")
rs.open "select * from jb order by date desc",conn,1,1
if err.number<>0 then
response.write "���ݿ����ޡ������Ϣ�ٱ����������"
end if

'------------------------------------------��ҳ��ʼ
if rs.recordcount=0 then 
response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=#ff0000>���ݿ������ޡ������Ϣ�ٱ����������<font>"
else
rs.PageSize =10 'ÿҳ��¼����
iCount=rs.RecordCount '��¼����
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
								
								 &nbsp;<font color=#ff0000>��</font><strong>��
								 �ٱ�ID:<%=rs("id")%> ��</strong>&nbsp;&nbsp;�ٱ����ڣ�<%=rs("date")%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF66FF"><a href="del_jb.asp?id=<%=rs("id")%>">ɾ��</a></font><br>
								 &nbsp;&nbsp;���ٱ���λ/�������ƣ�<%=rs("jname")%><br>
&nbsp;&nbsp;�ٱ����ݣ�<%=rs("content")%><br>
<br>--------------------�ٱ�����Ϣ------------------------<br>
&nbsp;&nbsp;�ٱ�������:<%=rs("name")%><br>
&nbsp;&nbsp;�ٱ��ߵ绰:<%=rs("phone")%><br>
&nbsp;&nbsp;�ٱ���QQ��<%=rs("qq")%><br>
&nbsp;&nbsp;�ٱ������䣺<%=rs("email")%><br>
&nbsp;&nbsp;�ٱ���֤����<%=rs("zj")%><br>
&nbsp;&nbsp;�ٱ���IP��<%=rs("ip")%><br>
&nbsp;&nbsp;�ٱ����û�ID��<% if isnull(rs("x2")) then %> <%else%><% len1=len(rs("x2"))-1 
if right(rs("x2"),1)="1" then%> <a href=../student.asp?id=<%=left(rs("x2"),len1)%> target="_blank"><%=rs("x2")%></a>
<%else%>
<a href=../teacher.asp?id=<%=left(rs("x2"),len1)%> target="_blank"><%=rs("x2")%></a>
<%end if %>
<%end if %>
��ĩλΪ<font color="#FF0000"><strong>1</strong></font>��ʾѧԱ�û���<strong><font color="#FF0000">2</font></strong>Ϊ��Ա�û���<br> 																																		
<%
response.write "<hr width=100% color=777777 size=1>"
rs.movenext
next
call PageControl(iCount,maxpage,page,"border=0 align=center","<p align=center>")
end if
rs.close
set rs=nothing

Sub PageControl(iCount,pagecount,page,table_style,font_style)
'��������
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
Response.Write ("�� ҳ " & vbCrLf) 
Response.Write (" " & vbCrLf)
else 
Response.Write("<A HREF=" & action & "?" & temp & "Page=1>�� ҳ</A> " & vbCrLf)
Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & "></A> " & vbCrLf)
end if

if page>=pagecount then
Response.Write (" " & vbCrLf)
Response.Write ("β ҳ " & vbCrLf) 
else
Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">��һҳ</A> " & vbCrLf)
Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">��һҳ</A> " & vbCrLf)
Response.Write("<A HREF=" & action & "?" & temp & "Page=" & pagecount & ">β ҳ</A> " & vbCrLf) 
end if

Response.Write(" ҳ�Σ�" & page & "/" & pageCount & "ҳ" & vbCrLf)
Response.Write(" ����" & iCount & "����¼��Ϣ" & vbCrLf)
Response.Write(" ת��" & "<INPUT CLASS=wenbenkuang TYEP=TEXT NAME=page SIZE=2 Maxlength=5 VALUE=" & page & ">" & "ҳ" & vbCrLf & "<INPUT CLASS=go-wenbenkuang type=submit value=GO>")
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
