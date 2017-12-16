<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select VIP from in_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if not rs.eof  then
  VIP=rs("VIP")
end if
rs.close


	
if vip=true then

sql="update in_user set gr_view='"&request("gr_view")&"' where id="&clng(Request.Cookies("id"))
conn.execute(sql)
  response.write "<script language=JavaScript>" & chr(13) & "alert('状态设置成功！');" &"window.location.href='control.asp?file=close_gr.asp'"& "</script>" 
else
  response.write "<script language=JavaScript>" & chr(13) & "alert('非VIP会员，不能设置状态！');" &"window.location.href='control.asp?file=close_gr.asp'"& "</script>" 
end if 


set rs=nothing
set conn=nothing

%>
