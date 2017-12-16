<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->

<%
dim vip
sql="select ID,VIP from  in_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
vip=rs("vip")
rs.close


if vip=true then
	  
	  if request("G1")="提升学员信息" then
	  sql="update in_user set gotop=now() where id="&clng(Request.Cookies("id"))
      conn.execute(sql)
	  response.write "<script language=JavaScript>" & chr(13) & "alert('成功提升信息到最前显示！');" & "history.back()" & "</script>" 
	  end if
else
      response.write "<script language=JavaScript>" & chr(13) & "alert('您不是VIP会员，不能进行这个操作！');" & "history.back()" & "</script>" 
end if


set rs=nothing
set conn=nothing

%>