<!--#include file="../conn.asp"-->
<!--#include file="md5.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½���߳�ʱ,���ص�½��');"&"window.location.href = '../'"&" </script>"
response.end
end if
name=trim(request("name"))
psw=trim(request("psw"))
if psw="" then
sql="update gogo_admin set gogo_name='"&name&"' where id=1"
else
sql="update gogo_admin set gogo_name='"&name&"',gogo_pwd='"&md5(psw)&"' where id=1"
end if
conn.execute(sql)
response.write "<script language=JavaScript>" & chr(13) & "alert('�޸ĳɹ�,�������أ�');"&"window.location.href = 'admin_user.asp'"&" </script>"
set rs=nothing
%>