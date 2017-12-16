<!--#include file="../conn.asp"-->
<%
if trim(request("company"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('公司名不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("jtzw"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('具体位置不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("town"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('所在镇区不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
if trim(request("zptext"))="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('岗位职责描述不能为空！');" & "history.back()" & "</script>" 
Response.End
end if
sql="insert into consign(company,address,tel,person,url,jtzw,hka,town,zpnum,nianlings,zyes,hkas,edus,hkbs,languages,pthuas,sexs,jobtypes,marrys,computers,shisus,moneys,youxiaos,zptext) values('"&request("company")&"','"&request("address")&"','"&request("tel")&"','"&request("person")&"','"&request("url")&"','"&request("jtzw")&"','"&request("hka")&"','"&request("town")&"','"&request("zpnum")&"','"&request("nianlings")&"','"&request("zyes")&"','"&request("hkas")&"','"&request("edus")&"','"&request("hkbs")&"','"&request("languages")&"','"&request("pthuas")&"','"&request("sexs")&"','"&request("jobtypes")&"','"&request("marrys")&"','"&request("computers")&"','"&request("shisus")&"','"&request("moneys")&"','"&request("youxiaos")&"','"&request("zptext")&"')"
conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('委托招聘职位添加成功！');"&"window.location.href = 'admin_add_consign_nolog.asp'"&" </script>"
%>
