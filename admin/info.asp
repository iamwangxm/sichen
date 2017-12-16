<!--#include file="../conn.asp"-->
<%
startime=timer()
sql="select upsize from info where id=1"
rs.open sql,conn,1,1
upsize=rs("upsize")
rs.close
set rs=nothing
set conn=nothing
'以下为常用过程
public sub GetCode()
response.write "<img src=""getcode.asp"" alt= ""验证码,看不清楚?请点击刷新验证码"" style=""cursor : pointer;height : 20px;"" onclick=""this.src='getcode.asp'""/> "
end sub
public sub CodeIsTrue(b)
if CStr(Session("GetCode"))<>cstr(Trim(Request("Code"))) then
randomize
Session("GetCode")=rnd()
if b="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('验证码错误，请刷新页面后重新输入！');" & "history.back()" & "</script>" 
else
response.write "<script language=JavaScript>" & chr(13) & "alert('验证码错误，请重新输入！');"&"window.location.href = '"&b&"'"&" </script>"
end if
Response.End
end if
end sub
%>