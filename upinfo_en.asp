<!--#include file="conn.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('登录超时!! 请重新登录后填写本页内容！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if

if len(request("name"))>10 then
response.write "<script language=JavaScript>" & chr(13) & "alert('姓名不能超过10个字！');" & "history.back()" & "</script>" 
Response.End
end if

if request("birthday")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请输入出生年份！');" & "history.back()" & "</script>" 
Response.End
end if


if request("trade")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择教员身份！');" & "history.back()" & "</script>" 
Response.End
end if

if request("school")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请输入毕业或在读学校！');" & "history.back()" & "</script>" 
Response.End
end if

if request("xueli")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请输入毕业或在读学历！');" & "history.back()" & "</script>" 
Response.End
end if




if request("Myenfudao2")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择擅长科目！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("jianj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('教员简介不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if len(request("jianj"))>300 then
response.write "<script language=JavaScript>" & chr(13) & "alert('教员简介不能超过300字！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("phone"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('联系电话不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("fund"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('每小时单价不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("sex"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('教员性别不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("mcsj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('每次最少辅导时间不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if request("fwff")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择服务方式！');" & "history.back()" & "</script>" 
Response.End
end if
if request("yxq")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请设置信息的有效期！');" & "history.back()" & "</script>" 
Response.End
end if

if request("Mycity2")="0" or request("Mycity2")="" then

response.write "<script language=JavaScript>" & chr(13) & "alert('修改 『服务区域』时，城市和镇区要同时修改！[注：返回后，需要再选择一次对应的城市，才可以选择镇区]');" & "history.back()" & "</script>" 
Response.End

end if 

if request("email")="@" or instr(request("email"),"@")=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('邮箱地址不正确！');" & "history.back()" & "</script>" 
Response.End
end if

if request("Myenfudao2")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请填写可教授课目！');" & "history.back()" & "</script>" 
Response.End
end if

sql="update en_user set nation='"&request("nation")&"',birthday='"&request("birthday")&"',lzsf='"&request("lzsf")&"',school='"&request("school")&"',xueli='"&request("xueli")&"',special='"&request("special")&"',fdjy='"&request("fdjy")&"',trade='"&request("trade")&"',enfudao='"&request("Myenfudao2")&"',fund='"&request("fund")&"',sex='"&request("sex")&"',mcsj='"&request("mcsj")&"',jianj='"&request("jianj")&"',address='"&request("address")&"',zip='"&request("zip")&"',phone='"&request("phone")&"',email='"&request("email")&"',qq='"&request("qq")&"',servercity='"&request("Mycity2")&"',xian='"&request("xian")&"',fwff='"&request("fwff")&"',yxq='"&request("yxq")&"',web='"&request("web")&"' where id="&clng(Request.Cookies("id"))

conn.execute(sql)

if Request.Cookies("login")="yes" then'管理员登陆可以修改姓名和身份证
	sql="update en_user set name='"&request("name")&"',idcard='"&request("idcard")&"' where id="&clng(Request.Cookies("id"))
	conn.execute(sql)
end if


set rs=nothing
set conn=nothing
Response.Cookies("e_fullness")="ok"
Response.Cookies("e_fullness").expires=(now+1/6) '保存4小时
Response.Write request("mycity2")
response.end
response.write "<script language=JavaScript>" & chr(13) & "alert('信息更新成功！');" &"window.location.href='control.asp'"& "</script>" 

%>
