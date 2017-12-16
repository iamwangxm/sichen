<%
sub showart_list(c,n)

sql="select top "&clng(n)&" * from article where class="&clng(c)&" order by id desc"
rs.open sql,conn,1,1
if rs.recordcount=0 then
rs.close
   response.write "ÔÝÎÞÎÄÕÂ£¡"
else
  for ii=1 to rs.recordcount
%>	
<li style="margin-bottom:8;margin-top:8"><img src="/images/menu.gif"><a target="_blank" href="show_article.asp?id=<%=rs("id")%>"><%=rs("title")%></a></li>
<%
rs.movenext
if rs.eof then exit for
next
rs.close
end if
end sub
%>