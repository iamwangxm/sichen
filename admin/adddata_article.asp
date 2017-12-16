<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
if trim(request("title"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('标题不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("content"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('内容不能为空！');" & "history.back()" & "</script>" 
Response.End
end if




sql="insert into article(title,content,class,comefrom) values('"&request("title")&"','"&trim(request("Content"))&"',"&request("class")&",'"&request("comefrom")&"')"

conn.execute(sql)

set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('文章添加成功！');"&"window.location.href = 'admin_article.asp'"&" </script>"
%>
