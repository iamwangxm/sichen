<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"1" then
response.write "<script language=JavaScript>" & chr(13) & "alert('�����߱���Ȩ�ޣ�');" & "history.back()" & "</script>" 
Response.End
end if
sql="select id from inorder where inid="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if Request.Cookies("vip")="false" then
if rs.recordcount>=in_max then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ǹ����ͨ�û���ѽ�Ա������Ϊ"&in_max&"�����������ɾ����Ч�Ľ�Ա��Ϣ�����Ӵ˽�Ա��Ϣ��������Ҫ����Ŀ����������������VIP�û���һ���Ը���50Ԫ���Ժ������ѣ�������ӵ��"&in_vip_max&"����Ա�����������ѷ�ʽ����Ա�������·��ġ����ʽ������ѯ�绰��18260298314 QQ��583164404��');" & "history.back()" & "</script>" 
Response.End
end if
else
if rs.recordcount>=in_vip_max then
rs.close
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('��Ǹ������"&in_vip_max&"����Ա��������������Ҫ����Ŀ���������������Ա��ϵ���绰��18260298314 QQ��583164404');" & "history.back()" & "</script>" 
Response.End
end if
end if
rs.close
sql="select id from en_user where id="&clng(request("enid"))
rs.open sql,conn,1,1
if rs.recordcount=0 then
rs.close
response.write "<script language=JavaScript>" & chr(13) & "alert('�޴˽�Ա��Ϣ��');" & "history.back()" & "</script>" 
Response.End
end if
rs.close
sql="select id from inorder where inid="&clng(Request.Cookies("id"))& "and enid="&clng(request("enid"))
rs.open sql,conn,1,1
if rs.recordcount<>0 then
rs.close
response.write "<script language=JavaScript>" & chr(13) & "alert('���Ѿ�ԤԼ���˽�Ա��');" & "history.back()" & "</script>" 
Response.End
end if
rs.close
sql="insert into inorder(inid,enid) values("&Request.Cookies("id")&","&request("enid")&")"
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('�ѵǼǺ�����ԤԼ������Ե绰�𸴣�');" & "history.back()" & "</script>" 

%>
