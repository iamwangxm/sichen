<!--#include file="conn.asp"-->
<%
if session("login")<>"yes" and  (Request.Cookies("login")<>"yes") then
response.write "<script language=JavaScript>" & chr(13) & "alert('ÄúÎ´µÇÂ½»òÕÊºÅÃÜÂë´íÎó,ÇëÖØµÇÂ½£¡');" & "history.back()" & "</script>" 
response.end
end if
sql="DELETE FROM imgdata WHERE num="&clng(request("id"))
conn.execute(sql)
set rs2=nothing
set conn2=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('É¾³ı³É¹¦,¼´½«·µ»Ø£¡');"&"JavaScript:window.close();"&" </script>"

%>