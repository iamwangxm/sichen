<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½���߳�ʱ,���ص�½��');"&"window.location.href = '../'"&" </script>"
response.end
end if
dim selflag
	if request("isread")="yes" then
	selflag=""
	else
	selflag=" and new=false"
	end if
	select case request("delDate")
	case "all"
	sql="delete from message where id>0 "&selflag
	case 7
	sql="delete from message where datediff('d',addtime,Now())>7 "&selflag
	case 30
	sql="delete from message where datediff('d',addtime,Now())>30 "&selflag
	case 60
	sql="delete from message where datediff('d',addtime,Now())>60 "&selflag
	case 180
	sql="delete from message where datediff('d',addtime,Now())>180 "&selflag
	end select
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('������ɣ�');" & "history.back()" & "</script>" 
%>