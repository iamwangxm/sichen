<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->

<%
dim vip
sql="select ID,VIP from  in_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
vip=rs("vip")
rs.close


if vip=true then
	  
	  if request("G1")="����ѧԱ��Ϣ" then
	  sql="update in_user set gotop=now() where id="&clng(Request.Cookies("id"))
      conn.execute(sql)
	  response.write "<script language=JavaScript>" & chr(13) & "alert('�ɹ�������Ϣ����ǰ��ʾ��');" & "history.back()" & "</script>" 
	  end if
else
      response.write "<script language=JavaScript>" & chr(13) & "alert('������VIP��Ա�����ܽ������������');" & "history.back()" & "</script>" 
end if


set rs=nothing
set conn=nothing

%>