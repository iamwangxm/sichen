<!--#include file="conn.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('登录超时!!请重新登录后填写本页内容！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
if trim(request("sex"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择性别！');" & "history.back()" & "</script>" 
Response.End
end if
if request("age")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('年龄没填写！');" & "history.back()" & "</script>" 
Response.End
end if
if request("fdfs")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择辅导方式！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("school"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('就读学校不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("zxnj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('所在年级不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("infudao"))="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择辅导科目！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("shixin"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('每小时支付价格不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("phone"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('联系电话不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if request("yxq")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请设置信息的有效期！');" & "history.back()" & "</script>" 
Response.End
end if
if request("email")="@" or instr(request("email"),"@")=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('邮箱地址不正确！');" & "history.back()" & "</script>" 
Response.End
end if
if request("city")<>"0" and request("city")<>"" then
if request("town")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('修改『所在地区』时，城市和镇区要同时修改！[注：返回后，请再点一次城市，才可以选择镇区]');" & "history.back()" & "</script>" 
Response.End
end if
end if 
if trim(request("xyjj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('学员简介或对教员要求不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if len(request("xyjj"))>200 then
response.write "<script language=JavaScript>" & chr(13) & "alert('学员简介或对教员要求不能超过200字！');" & "history.back()" & "</script>" 
Response.End
end if


if request("Myinfudao2")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请填写需要辅导的课目！');" & "history.back()" & "</script>" 
Response.End
end if

if request("city")="0" or request("city")="" or request("town")="0" or request("town")="" then
sql="update in_user set sex='"&request("sex")&"',age='"&request("age")&"',fdfs='"&request("fdfs")&"',school='"&request("school")&"',oicq='"&request("oicq")&"',email='"&request("email")&"',phone='"&request("phone")&"',posts='"&request("posts")&"',address='"&request("address")&"',shixin='"&request("shixin")&"',infudao='"&request("Myinfudao2")&"',zxnj='"&request("zxnj")&"',yxq='"&request("yxq")&"',xyjj='"&request("xyjj")&"',sksj='"&request("times")&"' where id="&clng(Request.Cookies("id"))
else
sql="update in_user set sex='"&request("sex")&"',age='"&request("age")&"',fdfs='"&request("fdfs")&"',school='"&request("school")&"',oicq='"&request("oicq")&"',email='"&request("email")&"',phone='"&request("phone")&"',posts='"&request("posts")&"',address='"&request("address")&"',shixin='"&request("shixin")&"',infudao='"&request("Myinfudao2")&"',zxnj='"&request("zxnj")&"',city='"&request("city")&"',town='"&request("town")&"',xian='"&request("xian")&"',yxq='"&request("yxq")&"',xyjj='"&request("xyjj")&"',sksj='"&request("times")&"' where id="&clng(Request.Cookies("id"))
end if 

conn.execute(sql)


if Request.Cookies("login")="yes" then'管理员登陆可以修改姓名
	sql="update in_user set name='"&request("name")&"' where id="&clng(Request.Cookies("id"))
	conn.execute(sql)
end if



set rs=nothing
set conn=nothing
Response.Cookies("i_fullness")="ok"
Response.Cookies("i_fullness").expires=(now+1/6) '保存4小时

response.write "<script language=JavaScript>" & chr(13) & "alert('信息更新成功！');" &"window.location.href='control.asp'"& "</script>" 

%>
