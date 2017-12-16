<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您不具备此权限！');" & "history.back()" & "</script>" 
Response.End
end if
sql="select id from inorder where inid="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if Request.Cookies("vip")="false" then
if rs.recordcount>=in_max then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('抱歉，普通用户免费教员库上限为"&in_max&"个，你可自行删除无效的教员信息来增加此教员信息；若您需要更多的库存容量，请升级成VIP用户，一次性付费50元（以后不用续费），将会拥有"&in_vip_max&"个教员库容量，付费方式见会员中心左下方的“付款方式”，咨询电话：18260298314 QQ：583164404！');" & "history.back()" & "</script>" 
Response.End
end if
else
if rs.recordcount>=in_vip_max then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('抱歉，您的"&in_vip_max&"个教员库已满！若您需要更多的库存容量，请与管理员联系！电话：18260298314 QQ：583164404');" & "history.back()" & "</script>" 
Response.End
end if
end if
rs.close
sql="select id from en_user where id="&clng(request("enid"))
rs.open sql,conn,1,1
if rs.recordcount=0 then
rs.close
response.write "<script language=JavaScript>" & chr(13) & "alert('无此教员信息！');" & "history.back()" & "</script>" 
Response.End
end if
rs.close
sql="select id from inorder where inid="&clng(Request.Cookies("id"))& "and enid="&clng(request("enid"))
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.close
response.write "<script language=JavaScript>" & chr(13) & "alert('您已经预约过此教员！');" & "history.back()" & "</script>" 
Response.End
end if
rs.close
sql="insert into inorder(inid,enid) values("&Request.Cookies("id")&","&request("enid")&")"
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('已登记好您的预约，请等稍电话答复！');" & "history.back()" & "</script>" 

%>
