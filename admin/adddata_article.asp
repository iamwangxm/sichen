<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½���߳�ʱ,���ص�½��');"&"window.location.href = '../'"&" </script>"
response.end
end if
if trim(request("title"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('���ⲻ��Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("content"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('���ݲ���Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if




sql="insert into article(title,content,class,comefrom) values('"&request("title")&"','"&trim(request("Content"))&"',"&request("class")&",'"&request("comefrom")&"')"

conn.execute(sql)

set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('������ӳɹ���');"&"window.location.href = 'admin_article.asp'"&" </script>"
%>
