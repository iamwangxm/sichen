<!--#include file="conn.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��¼��ʱ!! �����µ�¼����д��ҳ���ݣ�');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if

if len(request("name"))>10 then
response.write "<script language=JavaScript>" & chr(13) & "alert('�������ܳ���10���֣�');" & "history.back()" & "</script>" 
Response.End
end if

if request("birthday")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�����������ݣ�');" & "history.back()" & "</script>" 
Response.End
end if


if request("trade")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ���Ա��ݣ�');" & "history.back()" & "</script>" 
Response.End
end if

if request("school")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�������ҵ���ڶ�ѧУ��');" & "history.back()" & "</script>" 
Response.End
end if

if request("xueli")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�������ҵ���ڶ�ѧ����');" & "history.back()" & "</script>" 
Response.End
end if




if request("Myenfudao2")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ���ó���Ŀ��');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("jianj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ա��鲻��Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if len(request("jianj"))>300 then
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ա��鲻�ܳ���300�֣�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("phone"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ϵ�绰����Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("fund"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('ÿСʱ���۲���Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("sex"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ա�Ա���Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("mcsj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('ÿ�����ٸ���ʱ�䲻��Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if request("fwff")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��ѡ�����ʽ��');" & "history.back()" & "</script>" 
Response.End
end if
if request("yxq")="0" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��������Ϣ����Ч�ڣ�');" & "history.back()" & "</script>" 
Response.End
end if

if request("Mycity2")="0" or request("Mycity2")="" then

response.write "<script language=JavaScript>" & chr(13) & "alert('�޸� ����������ʱ�����к�����Ҫͬʱ�޸ģ�[ע�����غ���Ҫ��ѡ��һ�ζ�Ӧ�ĳ��У��ſ���ѡ������]');" & "history.back()" & "</script>" 
Response.End

end if 

if request("email")="@" or instr(request("email"),"@")=0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('�����ַ����ȷ��');" & "history.back()" & "</script>" 
Response.End
end if

if request("Myenfudao2")="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����д�ɽ��ڿ�Ŀ��');" & "history.back()" & "</script>" 
Response.End
end if

sql="update en_user set nation='"&request("nation")&"',birthday='"&request("birthday")&"',lzsf='"&request("lzsf")&"',school='"&request("school")&"',xueli='"&request("xueli")&"',special='"&request("special")&"',fdjy='"&request("fdjy")&"',trade='"&request("trade")&"',enfudao='"&request("Myenfudao2")&"',fund='"&request("fund")&"',sex='"&request("sex")&"',mcsj='"&request("mcsj")&"',jianj='"&request("jianj")&"',address='"&request("address")&"',zip='"&request("zip")&"',phone='"&request("phone")&"',email='"&request("email")&"',qq='"&request("qq")&"',servercity='"&request("Mycity2")&"',xian='"&request("xian")&"',fwff='"&request("fwff")&"',yxq='"&request("yxq")&"',web='"&request("web")&"' where id="&clng(Request.Cookies("id"))

conn.execute(sql)

if Request.Cookies("login")="yes" then'����Ա��½�����޸����������֤
	sql="update en_user set name='"&request("name")&"',idcard='"&request("idcard")&"' where id="&clng(Request.Cookies("id"))
	conn.execute(sql)
end if


set rs=nothing
set conn=nothing
Response.Cookies("e_fullness")="ok"
Response.Cookies("e_fullness").expires=(now+1/6) '����4Сʱ
Response.Write request("mycity2")
response.end
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ϣ���³ɹ���');" &"window.location.href='control.asp'"& "</script>" 

%>
