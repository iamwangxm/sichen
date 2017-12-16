<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
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
sql="update consign set company='"&request("company")&"',address='"&request("address")&"',tel='"&request("tel")&"',person='"&request("person")&"',url='"&request("url")&"',jtzw='"&request("jtzw")&"',hka='"&request("hka")&"',town='"&request("town")&"',zpnum='"&request("zpnum")&"',nianlings='"&request("nianlings")&"',zyes='"&request("zyes")&"',hkas='"&request("hkas")&"',edus='"&request("edus")&"',hkbs='"&request("hkbs")&"',languages='"&request("languages")&"',pthuas='"&request("pthuas")&"',sexs='"&request("sexs")&"',jobtypes='"&request("jobtypes")&"',marrys='"&request("marrys")&"',computers='"&request("computers")&"',shisus='"&request("shisus")&"',moneys='"&request("moneys")&"',youxiaos='"&request("youxiaos")&"',zptext='"&request("zptext")&"' where id="&clng(request("id"))

conn.execute(sql)
set rs=nothing
set conn=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('修改成功,即将返回！');"&"window.location.href = 'admin_consign.asp'"&" </script>"
%>
