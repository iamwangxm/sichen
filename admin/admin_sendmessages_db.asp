<!--#include file="info.asp"-->
<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
if trim(request("title"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('主题不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("content"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('信息内容不能为空！');" & "history.back()" & "</script>" 
Response.End
end if


if request("class")="all" then  '所有注册用户
sql="select id from in_user"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('1',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
sql="select id from en_user"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('2',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if



if request("class")="in" then  '所有个人用户
sql="select id from in_user"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('1',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if



if request("class")="en" then  '所有企业用户
sql="select id from en_user"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('2',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if



if request("class")="vip" then  '所有高级用户
sql="select id from in_user where vip=true"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('1',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
sql="select id from en_user where vip=true"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('2',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if


if request("class")="notvip" then  '所有普通用户
sql="select id from in_user where vip=false"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('1',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
sql="select id from en_user where vip=false"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('2',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if


if request("class")="vipin" then  '所有高级个人用户
sql="select id from in_user where vip=true"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('1',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if


if request("class")="notvipin" then  '所有普通个人用户
sql="select id from in_user where vip=false"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('1',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if


if request("class")="vipen" then  '所有高级企业用户
sql="select id from en_user where vip=true"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('2',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if


if request("class")="notvipen" then  '所有普通企业用户
sql="select id from en_user where vip=false"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.movefirst
set rs1=server.createobject("adodb.recordset")
for i=1 to rs.recordcount
sql1="insert into message(ttype,tid,ftype,content,title) values('2',"&rs("id")&",'0','"&Replace(request("content"),"'","''")&"','"&Replace(request("title"),"'","''")&"')"
conn.execute(sql1)
rs.movenext
next
end if
rs.close
end if
call addlog("站内短信群发")
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('操作完成！');"&"window.location.href = 'admin_message.asp'"&" </script>"
%>