<!--#include file="Conn.asp"-->																											
<%
sessionID = session.SessionID
timeout = 5
aaa = dateadd("n", -timeout, now())
conn.Execute ("delete * from count where postdate < #" & aaa & "#")
sql0 = "select sess from count where sess='" & sessionID & "'"
set rscheck = conn.Execute (sql0)
if rscheck.eof then
sql = "insert into count (sess,postdate) values('" & sessionID & "', '" & now() & "')"
conn.Execute (sql)
end if
rscheck.close
set rscheck = nothing

sql2 = "select count(sess) from count"
set rs = conn.Execute (sql2)
count = rs(0)
rs.close
set rs = nothing

sql3 = "select * from count"
set rspredel = conn.Execute (sql3)
do until rspredel.eof
xxx=DateDiff("n", rspredel("postdate"), Now())
if xxx > timeout then
count = count-1
end if
rspredel.movenext
loop
rspredel.close
set rspredel = nothing

conn.Close
set conn = nothing

if count = 0 then
count = 1
end if
%>
document.write('当前<font color=#ff0000><strong><%=count%></strong></font>人在线');

