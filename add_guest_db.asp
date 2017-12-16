<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<%
ip=request.servervariables("remote_addr")
 if trim(request("title"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('主题不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("content"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('内容不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if len(request("content"))>300 then
response.write "<script language=JavaScript>" & chr(13) & "alert('内容不能超过150个汉字！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("username"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('姓名不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
call codeistrue("add_guest.asp")
title=Trim(Request("title"))
content=Request("content")
username=Trim(request("username"))
email=request("email")
qq=request("qq")
homepage=request("homepage")
show=request("show")
addtime=now()
sex=request("sex")
sql="insert into guest(title,content,username,email,qq,addtime,ip,homepage,sex) values('"&title&"','"&content&"','"&username&"','"&email&"','"&qq&"','"&addtime&"','"&ip&"','"&homepage&"',"&sex&")"
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write ("<Script Language=Javascript>window.alert('添加留言成功，我们将会在最短的时间内对您的问题作出回答，谢谢你对本站的支持！');location.href='guest.asp';</Script>")

%>