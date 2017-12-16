<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="check.asp"-->
<!--#include file="md5.asp"-->

<%
str=request("zpname")
if request("name")="" or request("pwd")="" or (request("user")<>"1" and request("user")<>"2") or request("question")="" or request("answer")=""or request("email")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请确认所有信息已经填写！');" & "history.back()" & "</script>" 
Response.End
end if
if request("email")="@" or instr(request("email"),"@")=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('邮箱地址不正确！');" & "history.back()" & "</script>" 
Response.End
end if
if request("zpname")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('姓名还没填写！');" & "history.back()" & "</script>" 
Response.End
end if
if request("phone")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您的联系电话还没填写！');" & "history.back()" & "</script>" 
Response.End
end if
if request("pwd")<>request("pwd1") then
response.write "<script language=JavaScript>" & chr(13) & "alert('两次密码输入不正确！');" & "history.back()" & "</script>" 
Response.End
end if
if instr(request("name"),"'")<>0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('非法数据提交！');" & "history.back()" & "</script>" 
Response.End
end if

if len(request("zpname"))>10then
response.write "<script language=JavaScript>" & chr(13) & "alert('姓名不能超过20个字！');" & "history.back()" & "</script>" 
Response.End
end if
call codeistrue("register_sy.asp")
name=request("name")
email=request("email")
pwd=request("pwd")
question=request("question")
answer=request("answer")
zpname=request("zpname")
phone=request("phone")

content="免费家教网欢迎您！"&"请尽快发布家教信息!"

if request("user")="1" then '请选择学员
school=request("school")
shixin=request("shixin")
sex=request("sex")
age=request("age")
infudao=request("Myinfudao2")
zxnj=request("zxnj")
fdfs=request("fdfs")
xyjj=request("xyjj")
city=request("city")
town=request("town")
xian=request("xian")
sksj=request("times")
yxq=request("yxq")

if trim(request("sex"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择性别！');" & "history.back()" & "</script>" 
Response.End
end if
if request("age")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('年龄没填写！');" & "history.back()" & "</script>" 
Response.End
end if
if request("Myinfudao2")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择辅导科目！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("zxnj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请填写所在年级！');" & "history.back()" & "</script>" 
Response.End
end if
if request("fdfs")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择辅导方式！');" & "history.back()" & "</script>" 
Response.End
end if
if request("school")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('就读学校还没写！');" & "history.back()" & "</script>" 
Response.End
end if
if request("shixin")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请填写每小时可支付价格！');" & "history.back()" & "</script>" 
Response.End
end if
if request("city")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择城市！如果无法选择镇区，请再选择一次对应的城市后操作！');" & "history.back()" & "</script>" 
Response.End
end if
if request("town")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择镇区！如果无法选择镇区，请再选择一次对应的城市后操作！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("xyjj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('简介不能为空！');" & "history.back()" & "</script>" 
Response.End
end if

if len(request("xyjj"))>200 then
response.write "<script language=JavaScript>" & chr(13) & "alert('简介不能超过200字！');" & "history.back()" & "</script>" 
Response.End
end if




sql="select id from in_user"
rs.open sql,conn,1,1
if rs.recordcount>3000 then 
response.write "<script language=JavaScript>" & chr(13) & "history.back()" & "</script>" 
Response.End
end if
rs.close
sql="select id from in_user where ac='"&name&"'"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('此用户名已经被注册！');" & "history.back()" & "</script>" 
Response.End
else
rs.close
sql="insert into in_user(ac,pwd,question,answer,email,name,phone,school,shixin,sex,age,zxnj,infudao,fdfs,city,town,xian,xyjj,sksj,yxq) values('"&name&"','"&md5(pwd)&"','"&question&"','"&md5(answer)&"','"&email&"','"&zpname&"','"&phone&"','"&school&"','"&shixin&"','"&sex&"','"&age&"','"&zxnj&"','"&infudao&"','"&fdfs&"','"&city&"','"&town&"','"&xian&"','"&xyjj&"','"&sksj&"','"&yxq&"')"
conn.execute(sql)
sql="select id from in_user where ac='"&name&"'"
rs.open sql,conn,1,1
id=rs("id")
rs.close
sql="insert into message(ttype,tid,ftype,content,title) values('1',"&id&",'0','"&content&"','恭喜您成功注册！')"
conn.execute(sql)
set rs=nothing
set conn=nothing
Response.Cookies("name")=zpname
Response.Cookies("vip")="false"
Response.Cookies("id")=id
Response.Cookies("ac")=name
Response.Cookies("pwd")=pwd
Response.Cookies("rdate")=now()
Response.Cookies("ggval")="81528686528"
Response.Cookies("user")="1"
Response.Cookies("i_fullness")="ok"
Response.Cookies("newinfo")="new"


response.write "<script language=JavaScript>" & chr(13) & "alert('注册学员用户成功！现在您可以预约教员了！');"&"window.location.href = 'reg_success.asp?ttype=1'"&" </script>"

   
end if
end if

if request("user")="2" then '教员
trade=request("trade")
enfudao=request("Myenfudao2")
city=request("city")
servercity=request("Mycity2")
town=request("town")
jianj=request("jianj")
xian=request("xian")

qq=request("qq")
idcard=request("idcard")
sex=request("sex")
nation=request("nation")
birthday=request("birthday")
lzsf=request("lzsf")
address=request("address")
school=request("school")
xueli=request("xueli")
special=request("special")
fdjy=request("fdjy")
yxq=request("yxq")
fwff=request("fwff")
fund=request("fund")

if request("trade")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择教员身份！');" & "history.back()" & "</script>" 
Response.End
end if
if request("enfudao")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择擅长科目！');" & "history.back()" & "</script>" 
Response.End
end if
if request("jianj")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请填写教员简介！');" & "history.back()" & "</script>" 
Response.End
end if
if request("city")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择城市！如果无法选择镇区，请再选择一次对应的城市后操作！');" & "history.back()" & "</script>" 
Response.End
end if
if request("town")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('请选择镇区！如果无法选择镇区，请再选择一次对应的城市后操作！');" & "history.back()" & "</script>" 
Response.End
end if
if len(request("jianj"))>300 then
response.write "<script language=JavaScript>" & chr(13) & "alert('教员简介不能超过300字！');" & "history.back()" & "</script>" 
Response.End
end if
sql="select id from en_user"
rs.open sql,conn,1,1
if rs.recordcount>3500 then 
response.write "<script language=JavaScript>" & chr(13) & "history.back()" & "</script>" 
Response.End
end if
rs.close
sql="select id from en_user where ac='"&name&"' or phone='"&phone&"'"
rs.open sql,conn,1,1
if rs.recordcount<>0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('此用户名已经被注册或同一教员重复注册！');" & "history.back()" & "</script>" 
Response.End
else
rs.close




sql="insert into en_user(ac,pwd,question,answer,email,phone,name,jianj,city,town,servercity,trade,enfudao,xian,qq,idcard,sex,nation,birthday,lzsf,address,school,xueli,special,fdjy,yxq,fwff,fund) values('"&name&"','"&md5(pwd)&"','"&question&"','"&md5(answer)&"','"&email&"','"&phone&"','"&zpname&"','"&jianj&"','"&city&"','"&town&"','"&servercity&"','"&trade&"','"&enfudao&"','"&xian&"','"&qq&"','"&idcard&"','"&sex&"','"&nation&"','"&birthday&"','"&lzsf&"','"&address&"','"&school&"','"&xueli&"','"&special&"','"&fdjy&"','"&yxq&"','"&fwff&"','"&fund&"')"
conn.execute(sql)
sql="select id from en_user where ac='"&name&"'"
rs.open sql,conn,1,1
id=rs("id")
rs.close
sql="insert into message(ttype,tid,ftype,content,title) values('2',"&id&",'0','"&content&"','恭喜您成功注册！')"
conn.execute(sql)
set rs=nothing
set conn=nothing
Response.Cookies("name")=zpname
Response.Cookies("vip")="false"
Response.Cookies("id")=id
Response.Cookies("ac")=name
Response.Cookies("pwd")=pwd
Response.Cookies("rdate")=now()
Response.Cookies("ggval")="81528686528"
Response.Cookies("user")="2"
Response.Cookies("e_fullness")="ok"
Response.Cookies("newinfo")="new"

response.write "<script language=JavaScript>" & chr(13) & "alert('注册学员用户成功！现在您可以预约教员了！');"&"window.location.href = 'reg_success.asp?ttype=2'"&" </script>"

end if
end if
set rs=nothing
set conn=nothing
%>