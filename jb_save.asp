<!--#include file="conn.asp"-->
<%
dim rs,sql,name,url1,url2,yq,money,qq,lxr,address,phone
if trim(request("jname"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('���ٱ���λ/�������Ʊ�����д��');" & "history.back()" & "</script>"
Response.End
end if 
if trim(request("content"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�ٱ�����Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if len(request("content"))>1500 then
response.write "<script language=JavaScript>" & chr(13) & "alert('�ٱ����ݲ��ܳ���1500�֣�');" & "history.back()" & "</script>" 
Response.End
end if 
if trim(request("name"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�ٱ�������������д��');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("phone"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�ٱ��˵绰������д��');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("zj"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�ٱ�����Ч֤��������д��');" & "history.back()" & "</script>" 
Response.End
end if
jname=Request.Form("jname")
content=Request.Form("content")
name=Request.Form("name")
phone=Request.Form("phone")
qq=Request.Form("qq")
email=Request.Form("email")
zj=Request.Form("zj")
x2=Request.Form("x2")
ip=request.servervariables("remote_addr")
set rs=server.CreateObject("Adodb.recordset")
rs.open "select * from jb ",conn,1,3
rs.addnew
rs("jname")=jname
rs("content")=content
rs("name")=name
rs("phone")=phone
rs("qq")=qq
rs("email")=email
rs("zj")=zj
rs("ip")=ip
rs("x2")=x2
rs.update
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('��ľٱ���Ϣ�ѳɹ��ύ����վ����Ϣ�⡱�����ǽ������ύ����Ϣ���촦��лл���֧�֣������Ҫ����ϵ���ǣ� ���ǵĵ绰-18260298314 QQ-583164404 ');"&"window.location.href = 'index.asp'"&" </script>"

%>
