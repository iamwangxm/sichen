<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您不具备此权限！');" & "history.back()" & "</script>" 
Response.End
end if
sql="select id from endepot where enid="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if Request.Cookies("vip")="false" then
if rs.recordcount>=en_max2 then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('抱歉，普通用户学员库上限为"&en_max2&"个，你可自行删除无效的学员信息来增加此学员信息；若您需要更多的库存容量，请升级成VIP用户，一次性付费100元（以后不用再续费），终身拥有"&en_vip_max2&"个学员库容量，付费方式请见会员中心左下方的“付款方式”，咨询电话：13412380803 QQ：27229133！ ');" & "history.back()" & "</script>" 
Response.End
end if
else
if rs.recordcount>=en_vip_max2 then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('抱歉，您的"&en_vip_max2&"个学员库已满，你可自行删除无效的学员信息来增加此学员信息；若您需要更多的库存容量，请与管理员联系！电话：13412380803 QQ：27229133');" & "history.back()" & "</script>" 
Response.End
end if
end if
rs.close
sql="select id from in_user where id="&clng(request("inid"))
rs.open sql,conn,1,1
if rs.recordcount=0 then
rs.close
response.write "<script language=JavaScript>" & chr(13) & "alert('无此学员！');" & "history.back()" & "</script>" 
Response.End
end if
rs.close
sql="select id from endepot where enid="&clng(Request.Cookies("id"))& "and inid="&clng(request("inid"))
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.close
response.write "<script language=JavaScript>" & chr(13) & "alert('您已经添加过此学员！');" & "history.back()" & "</script>" 
Response.End
end if
rs.close
sql="insert into endepot(enid,inid) values("&Request.Cookies("id")&","&request("inid")&")"
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('添加成功！');" & "history.back()" & "</script>" 

%>
