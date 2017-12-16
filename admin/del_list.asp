<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('ÄúÎ´µÇÂ½»òÕÊºÅÃÜÂë´íÎó,ÇëÖØµÇÂ½£¡');" & "history.back()" & "</script>" 
response.end
end if
sql="DELETE FROM "&request("how")&"list WHERE id="&clng(request("id"))
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('É¾³ı³É¹¦,¼´½«·µ»Ø£¡');"&"window.location.href = 'admin_list.asp'"&" </script>"

%>
