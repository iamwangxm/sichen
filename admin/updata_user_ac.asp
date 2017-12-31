<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
tj=request("tj")
rz=request("rz")
vip=request("vip")
lock=request("lock")
state=request("state")

sql=""
if request("ttype")="1" then
sql="update in_user set tj="&tj&",rz="&rz&",vip="&vip&",lock="&lock&",state="&state&" where id="&request("id")
else
sql="update en_user set tj="&tj&",rz="&rz&",vip="&vip&" ,lock="&lock&" where id="&request("id")
end if
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('修改成功,即将返回！');window.close();parent.location.reload(); </script>"
%>
