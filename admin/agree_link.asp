<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½���߳�ʱ,���ص�½��');"&"window.location.href = '../'"&" </script>"
response.end
end if
sql="update link set ok=true where id="&clng(request("id"))
conn.execute(sql)
response.write "<script language=JavaScript>" & chr(13) & "alert('�����ɹ����������أ�');" & "history.back()" & "</script>" 
set rs=nothing
%>
