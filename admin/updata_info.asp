<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
if trim(request("webname"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('网站名称不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("webaddress"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('网站地址不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("logo"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('logo地址不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if request("adminemail")="@" or instr(request("adminemail"),"@")=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('邮箱地址不正确！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("address"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('通讯地址不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("post"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('邮政编码应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("tel"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('服务电话不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("qq"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('QQ号码应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("upsize"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('上传限制应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("in_max"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('普通个人用户职位库上限应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("in_vip_max"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('高级个人用户职位库上限应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("en_max1"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('普通企业用户人才库上限应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("en_vip_max1"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('高级企业用户人才库上限应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("en_max2"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('普通企业用户职位发布上限应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("en_vip_max2"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('高级企业用户职位发布上限应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("index1"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('首页显示求职新闻数应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("index2"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('首页显示新加企业数应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("index3"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('首页显示推荐职位数应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("index4"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('首页显示最新人才数应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("index5"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('首页显示求职技巧数应为数字！');" & "history.back()" & "</script>" 
Response.End
end if
if isnumeric(request("index6"))=false then
response.write "<script language=JavaScript>" & chr(13) & "alert('首页显示最新委托招聘数应为数字！');" & "history.back()" & "</script>" 
Response.End
end if

upsize=request("upsize")
logo=request("logo")
webname=request("webname")
webaddress=request("webaddress")
adminemail=request("adminemail")
address=request("address")
post=request("post")
tel=request("tel")
qq=request("qq")
index1=request("index1")
index3=request("index3")
index4=request("index4")
index5=request("index5")

in_max=request("in_max")
in_vip_max=request("in_vip_max")
en_max2=request("en_max2")
en_vip_max2=request("en_vip_max2")




sql="update info set webname='"&webname&"',webaddress='"&webaddress&"',adminemail='"&adminemail&"',logo='"&logo&"',address='"&address&"',post="&post&",tel='"&tel&"',index1='"&index1&"',index3='"&index3&"',index4='"&index4&"',index5='"&index5&"',in_max='"&in_max&"',in_vip_max='"&in_vip_max&"',en_max2='"&en_max2&"',en_vip_max2='"&en_vip_max2&"',qq="&qq&" where id=1"
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('修改成功,即将返回！');"&"window.location.href = 'webinfo.asp'"&" </script>"

%>
