

<%
sql="select * from info where id=1"
rs.open sql,conn,1,1
webname=rs("webname")
webaddress=rs("webaddress")
address=rs("address")
post=rs("post")
qq=rs("qq")
tel=rs("tel")
logo=rs("logo")
adminemail=rs("adminemail")
upsize=rs("upsize")
in_max=rs("in_max") ' 普通学员职位库容量
in_vip_max=rs("in_vip_max") ' VIP学员职位库容量
en_max1=rs("en_max1") '普通职位库容量
en_vip_max1=rs("en_vip_max1") ' VIP教员职位库容量
en_max2=rs("en_max2") ' 普通教员人才库容量
en_vip_max2=rs("en_vip_max2") 'VIP教员人才库容量
index1=rs("index1")
index2=rs("index2")
index3=rs("index3")
index4=rs("index4")
index5=rs("index5")
index6=rs("index6")
rs.close
%>
<script language="javascript">
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
<%
'以下为常用过程
public sub GetCode()
response.write "<img src=""getcode.asp"" alt= ""验证码,看不清楚?请点击刷新验证码"" style=""cursor : pointer;height : 20px;"" onclick=""this.src='getcode.asp'""/> "
end sub
public sub GetCode_df()
response.write "<img src=""../getcode.asp"" alt= ""验证码,看不清楚?请点击刷新验证码"" style=""cursor : pointer;height : 20px;"" onclick=""this.src='../getcode.asp'""/> "
end sub

public sub CodeIsTrue(b)
if CStr(Session("GetCode"))<>cstr(Trim(Request("Code"))) then
randomize
Session("GetCode")=rnd()
if b="" then
response.write "<script language=JavaScript>" & chr(13) & "alert('验证码错误，请刷新页面后重新输入！');" & "history.back()" & "</script>" 
else
response.write "<script language=JavaScript>" & chr(13) & "alert('验证码错误，请重新输入！');"&"window.location.href = '"&b&"'"&" </script>"
end if
Response.End
end if
end sub

public sub listarea(area_b)
set rs_area=server.createobject("adodb.recordset")
sql="select areaclass from arealist order by id desc"
rs_area.open sql,conn,1,1
if area_b="" then
for i_area=1 to rs_area.recordcount
response.write "<OPTION VALUE="&rs_area("areaclass")&">"&rs_area("areaclass")&"</OPTION>"
rs_area.movenext
if rs_area.eof then exit for
next
else
for i_area=1 to rs_area.recordcount
response.write "<OPTION VALUE="&rs_area("areaclass")
if area_b=rs_area("areaclass") then response.write " selected"
response.write ">"&rs_area("areaclass")&"</OPTION>"
rs_area.movenext
if rs_area.eof then exit for
next
end if
rs_area.close
set rs_area=nothing
end sub

public sub listjob(job_b)
set rs_job=server.createobject("adodb.recordset")
sql="select jobclass from joblist order by id desc"
rs_job.open sql,conn,1,1
if job_b="" then
for i_job=1 to rs_job.recordcount
response.write "<OPTION VALUE="&rs_job("jobclass")&">"&rs_job("jobclass")&"</OPTION>"
rs_job.movenext
if rs_job.eof then exit for
next
else
for i_job=1 to rs_job.recordcount
response.write "<OPTION VALUE="&rs_job("jobclass")
if job_b=rs_job("jobclass") then response.write " selected"
response.write ">"&rs_job("jobclass")&"</OPTION>"
rs_job.movenext
if rs_job.eof then exit for
next
end if
rs_job.close
set rs_job=nothing
end sub

public sub listzhy(zhy_b)
set rs_zhy=server.createobject("adodb.recordset")
sql="select zhyclass from zhylist order by id desc"
rs_zhy.open sql,conn,1,1
if zhy_b="" then
for i_zhy=1 to rs_zhy.recordcount
response.write "<OPTION VALUE="&rs_zhy("zhyclass")&">"&rs_zhy("zhyclass")&"</OPTION>"
rs_zhy.movenext
if rs_zhy.eof then exit for
next
else
for i_zhy=1 to rs_zhy.recordcount
response.write "<OPTION VALUE="&rs_zhy("zhyclass")
if zhy_b=rs_zhy("zhyclass") then response.write " selected"
response.write ">"&rs_zhy("zhyclass")&"</OPTION>"
rs_zhy.movenext
if rs_zhy.eof then exit for
next
end if
rs_zhy.close
set rs_zhy=nothing
end sub

public sub listcompany(company_b)
set rs_company=server.createobject("adodb.recordset")
sql="select companyclass from companylist order by id desc"
rs_company.open sql,conn,1,1
if company_b="" then
for i_company=1 to rs_company.recordcount
response.write "<OPTION VALUE="&rs_company("companyclass")&">"&rs_company("companyclass")&"</OPTION>"
rs_company.movenext
if rs_company.eof then exit for
next
else
for i_company=1 to rs_company.recordcount
response.write "<OPTION VALUE="&rs_company("companyclass")
if company_b=rs_company("companyclass") then response.write " selected"
response.write ">"&rs_company("companyclass")&"</OPTION>"
rs_company.movenext
if rs_company.eof then exit for
next
end if
rs_company.close
set rs_company=nothing
end sub
%>