<!--#include file="conn.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��¼��ʱ!!�����µ�¼����д��ҳ���ݣ�');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
if trim(request("sex"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ���Ա�');" & "history.back()" & "</script>" 
Response.End
end if
if request("age")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����û��д��');" & "history.back()" & "</script>" 
Response.End
end if
if request("fdfs")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ�񸨵���ʽ��');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("school"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�Ͷ�ѧУ����Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("zxnj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�����꼶����Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("infudao"))="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ�񸨵���Ŀ��');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("shixin"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('ÿСʱ֧���۸���Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("phone"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ϵ�绰����Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if request("yxq")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��������Ϣ����Ч�ڣ�');" & "history.back()" & "</script>" 
Response.End
end if
if request("email")="@" or instr(request("email"),"@")=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('�����ַ����ȷ��');" & "history.back()" & "</script>" 
Response.End
end if
if request("city")<>"0" and request("city")<>"" then
if request("town")="0" or request("town")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�޸ġ����ڵ�����ʱ�����к�����Ҫͬʱ�޸ģ�[ע�����غ����ٵ�һ�γ��У��ſ���ѡ������]');" & "history.back()" & "</script>" 
Response.End
end if
end if 
if trim(request("xyjj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('ѧԱ����Խ�ԱҪ����Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if len(request("xyjj"))>200 then
response.write "<script language=JavaScript>" & chr(13) & "alert('ѧԱ����Խ�ԱҪ���ܳ���200�֣�');" & "history.back()" & "</script>" 
Response.End
end if


if request("Myinfudao2")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����д��Ҫ�����Ŀ�Ŀ��');" & "history.back()" & "</script>" 
Response.End
end if

if request("city")="0" or request("city")="" or request("town")="0" or request("town")="" then
sql="update in_user set sex='"&request("sex")&"',age='"&request("age")&"',fdfs='"&request("fdfs")&"',school='"&request("school")&"',oicq='"&request("oicq")&"',email='"&request("email")&"',phone='"&request("phone")&"',posts='"&request("posts")&"',address='"&request("address")&"',shixin='"&request("shixin")&"',infudao='"&request("Myinfudao2")&"',zxnj='"&request("zxnj")&"',yxq='"&request("yxq")&"',xyjj='"&request("xyjj")&"',sksj='"&request("times")&"' where id="&clng(Request.Cookies("id"))
else
sql="update in_user set sex='"&request("sex")&"',age='"&request("age")&"',fdfs='"&request("fdfs")&"',school='"&request("school")&"',oicq='"&request("oicq")&"',email='"&request("email")&"',phone='"&request("phone")&"',posts='"&request("posts")&"',address='"&request("address")&"',shixin='"&request("shixin")&"',infudao='"&request("Myinfudao2")&"',zxnj='"&request("zxnj")&"',city='"&request("city")&"',town='"&request("town")&"',xian='"&request("xian")&"',yxq='"&request("yxq")&"',xyjj='"&request("xyjj")&"',sksj='"&request("times")&"' where id="&clng(Request.Cookies("id"))
end if 

conn.execute(sql)


if Request.Cookies("login")="yes" then'����Ա��½�����޸�����
	sql="update in_user set name='"&request("name")&"' where id="&clng(Request.Cookies("id"))
	conn.execute(sql)
end if



set rs=nothing
set conn=nothing
Response.Cookies("i_fullness")="ok"
Response.Cookies("i_fullness").expires=(now+1/6) '����4Сʱ

response.write "<script language=JavaScript>" & chr(13) & "alert('��Ϣ���³ɹ���');" &"window.location.href='control.asp'"& "</script>" 

%>
