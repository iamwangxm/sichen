<!--#include file="../conn.asp"-->
<%
if trim(request("company"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��˾������Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("jtzw"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����λ�ò���Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("town"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('������������Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("zptext"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('��λְ����������Ϊ�գ�');" & "history.back()" & "</script>" 
Response.End
end if
sql="insert into consign(company,address,tel,person,url,jtzw,hka,town,zpnum,nianlings,zyes,hkas,edus,hkbs,languages,pthuas,sexs,jobtypes,marrys,computers,shisus,moneys,youxiaos,zptext) values('"&request("company")&"','"&request("address")&"','"&request("tel")&"','"&request("person")&"','"&request("url")&"','"&request("jtzw")&"','"&request("hka")&"','"&request("town")&"','"&request("zpnum")&"','"&request("nianlings")&"','"&request("zyes")&"','"&request("hkas")&"','"&request("edus")&"','"&request("hkbs")&"','"&request("languages")&"','"&request("pthuas")&"','"&request("sexs")&"','"&request("jobtypes")&"','"&request("marrys")&"','"&request("computers")&"','"&request("shisus")&"','"&request("moneys")&"','"&request("youxiaos")&"','"&request("zptext")&"')"
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('ί����Ƹְλ��ӳɹ���');"&"window.location.href = 'admin_add_consign_nolog.asp'"&" </script>"
%>
