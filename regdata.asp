<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="check.asp"-->
<!--#include file="md5.asp"-->

<%
str=request("zpname")
if request("name")="" or request("pwd")="" or (request("user")<>"1" and request("user")<>"2") or request("question")="" or request("answer")=""or request("email")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ȷ��������Ϣ�Ѿ���д��');" & "history.back()" & "</script>" 
Response.End
end if
if request("email")="@" or instr(request("email"),"@")=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('�����ַ����ȷ��');" & "history.back()" & "</script>" 
Response.End
end if
if request("zpname")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('������û��д��');" & "history.back()" & "</script>" 
Response.End
end if
if request("phone")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('������ϵ�绰��û��д��');" & "history.back()" & "</script>" 
Response.End
end if
if request("pwd")<>request("pwd1") then
response.write "<script language=JavaScript>" & chr(13) & "alert('�����������벻��ȷ��');" & "history.back()" & "</script>" 
Response.End
end if
if instr(request("name"),"'")<>0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('�Ƿ������ύ��');" & "history.back()" & "</script>" 
Response.End
end if

if len(request("zpname"))>10then
response.write "<script language=JavaScript>" & chr(13) & "alert('�������ܳ���20���֣�');" & "history.back()" & "</script>" 
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

content="��Ѽҽ�����ӭ����"&"�뾡�췢���ҽ���Ϣ!"

if request("user")="1" then '��ѡ��ѧԱ
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
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ���Ա�');" & "history.back()" & "</script>" 
Response.End
end if
if request("age")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����û��д��');" & "history.back()" & "</script>" 
Response.End
end if
if request("Myinfudao2")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ�񸨵���Ŀ��');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("zxnj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����д�����꼶��');" & "history.back()" & "</script>" 
Response.End
end if
if request("fdfs")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ�񸨵���ʽ��');" & "history.back()" & "</script>" 
Response.End
end if
if request("school")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�Ͷ�ѧУ��ûд��');" & "history.back()" & "</script>" 
Response.End
end if
if request("shixin")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����дÿСʱ��֧���۸�');" & "history.back()" & "</script>" 
Response.End
end if
if request("city")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ����У�����޷�ѡ������������ѡ��һ�ζ�Ӧ�ĳ��к������');" & "history.back()" & "</script>" 
Response.End
end if
if request("town")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ������������޷�ѡ������������ѡ��һ�ζ�Ӧ�ĳ��к������');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("xyjj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��鲻��Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if

if len(request("xyjj"))>200 then
response.write "<script language=JavaScript>" & chr(13) & "alert('��鲻�ܳ���200�֣�');" & "history.back()" & "</script>" 
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
response.write "<script language=JavaScript>" & chr(13) & "alert('���û����Ѿ���ע�ᣡ');" & "history.back()" & "</script>" 
Response.End
else
rs.close
sql="insert into in_user(ac,pwd,question,answer,email,name,phone,school,shixin,sex,age,zxnj,infudao,fdfs,city,town,xian,xyjj,sksj,yxq) values('"&name&"','"&md5(pwd)&"','"&question&"','"&md5(answer)&"','"&email&"','"&zpname&"','"&phone&"','"&school&"','"&shixin&"','"&sex&"','"&age&"','"&zxnj&"','"&infudao&"','"&fdfs&"','"&city&"','"&town&"','"&xian&"','"&xyjj&"','"&sksj&"','"&yxq&"')"
conn.execute(sql)
sql="select id from in_user where ac='"&name&"'"
rs.open sql,conn,1,1
id=rs("id")
rs.close
sql="insert into message(ttype,tid,ftype,content,title) values('1',"&id&",'0','"&content&"','��ϲ���ɹ�ע�ᣡ')"
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


response.write "<script language=JavaScript>" & chr(13) & "alert('ע��ѧԱ�û��ɹ�������������ԤԼ��Ա�ˣ�');"&"window.location.href = 'reg_success.asp?ttype=1'"&" </script>"

   
end if
end if

if request("user")="2" then '��Ա
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
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ���Ա��ݣ�');" & "history.back()" & "</script>" 
Response.End
end if
if request("enfudao")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ���ó���Ŀ��');" & "history.back()" & "</script>" 
Response.End
end if
if request("jianj")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����д��Ա��飡');" & "history.back()" & "</script>" 
Response.End
end if
if request("city")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ����У�����޷�ѡ������������ѡ��һ�ζ�Ӧ�ĳ��к������');" & "history.back()" & "</script>" 
Response.End
end if
if request("town")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ������������޷�ѡ������������ѡ��һ�ζ�Ӧ�ĳ��к������');" & "history.back()" & "</script>" 
Response.End
end if
if len(request("jianj"))>300 then
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ա��鲻�ܳ���300�֣�');" & "history.back()" & "</script>" 
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
response.write "<script language=JavaScript>" & chr(13) & "alert('���û����Ѿ���ע���ͬһ��Ա�ظ�ע�ᣡ');" & "history.back()" & "</script>" 
Response.End
else
rs.close




sql="insert into en_user(ac,pwd,question,answer,email,phone,name,jianj,city,town,servercity,trade,enfudao,xian,qq,idcard,sex,nation,birthday,lzsf,address,school,xueli,special,fdjy,yxq,fwff,fund) values('"&name&"','"&md5(pwd)&"','"&question&"','"&md5(answer)&"','"&email&"','"&phone&"','"&zpname&"','"&jianj&"','"&city&"','"&town&"','"&servercity&"','"&trade&"','"&enfudao&"','"&xian&"','"&qq&"','"&idcard&"','"&sex&"','"&nation&"','"&birthday&"','"&lzsf&"','"&address&"','"&school&"','"&xueli&"','"&special&"','"&fdjy&"','"&yxq&"','"&fwff&"','"&fund&"')"
conn.execute(sql)
sql="select id from en_user where ac='"&name&"'"
rs.open sql,conn,1,1
id=rs("id")
rs.close
sql="insert into message(ttype,tid,ftype,content,title) values('2',"&id&",'0','"&content&"','��ϲ���ɹ�ע�ᣡ')"
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

response.write "<script language=JavaScript>" & chr(13) & "alert('ע��ѧԱ�û��ɹ�������������ԤԼ��Ա�ˣ�');"&"window.location.href = 'reg_success.asp?ttype=2'"&" </script>"

end if
end if
set rs=nothing
set conn=nothing
%>