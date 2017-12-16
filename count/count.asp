<!--#Include File=Conn.asp -->
javastr=""
<%
dim visiter
dim sql
dim rs

sql="select visiter from visiter"
set rs=conn.execute(sql)
count=rs("visiter")
changdu=len(count)
for i=1 to 7-changdu
%>	
	javastr=javastr+"<img src='count/images/0.gif' border=0></img>"
<%
next 

for i=1 to changdu
%>
	javastr=javastr+"<img src='count/images/<%=mid(count,i,1)%>.gif' border=0></img>"
<%
next 
%>
document.write (javastr);
document.write ("</a>");
<%
sql="update visiter set visiter=visiter+1"
rs.close
set rs=nothing
conn.execute(sql)
conn.close
set conn=nothing
%>

















