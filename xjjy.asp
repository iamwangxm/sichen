<table style="font-size:15px">
<%
sql="select top 10 id,name,trade,enfudao,fund,rdate,vip,city,town,xian from en_user where lock=false and name<>''  and tj=true and vip=true order by tj asc,vip asc,gotop desc,id desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
rs.close
response.write "暂时没有推荐教员！" 
else
for ii=1 to 10

%>

<tr><td height="20"><img src="images/d18.gif" width="12" height="11"> <a target =_blank  href="teacher.asp?id=<%=rs("id")%>"><%=left(unhtml(rs("name")),1)%>教员</a> 擅长 <%=left(unhtml(rs("enfudao")),10)%></td></tr>

<%
rs.movenext
if rs.eof then exit for
next
rs.close
			
end if
%>
</table>