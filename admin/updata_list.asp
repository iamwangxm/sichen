<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½���߳�ʱ,���ص�½��');"&"window.location.href = '../'"&" </script>"
response.end
end if
if trim(request("what"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ŀ����Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
sql="update "&request("how")&"list set "&request("how")&"class='"&request("what")&"' where id="&clng(request("id"))
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('�޸ĳɹ�����ˢ�º�鿴�����');" & "window.close()" & "</script>" 
%>
