<!--#include file="conn.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('Äú»¹Î´µÇÂ½£¡');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
if request("id")="all" then
sql="DELETE FROM message WHERE tid="&clng(Request.Cookies("id"))&" and ttype='"&Request.Cookies("user")&"'"
else
sql="DELETE FROM message WHERE id="&clng(request("id"))&"and tid="&clng(Request.Cookies("id"))&" and ttype='"&Request.Cookies("user")&"'"
end if
conn.execute(sql)
set rs=nothing
set conn=nothing
Response.Cookies("newinfo")=""
response.write "<script language=JavaScript>" & chr(13) & "alert('É¾³ý³É¹¦,¼´½«·µ»Ø£¡');"&"window.location.href =  'control.asp?file=message.asp&page="&request("page")&"'"&" </script>"

%>
