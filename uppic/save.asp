<!--#include file="conn.asp"-->
<% dim rs
   dim sql 
   dim id 
if not(isnumeric(request("id"))) then
response.write "<script language=JavaScript>" & chr(13) & "alert('参数错误！');" & "history.back()" & "</script>" 
Response.End
rs.close
end if
id=request("id") 
sql="select id from imgdata where id="&clng(id)
rs2.open sql,conn2,1,1
if rs2.recordcount<>0 then
response.write "<script language=JavaScript>" & chr(13) & "alert('你已上传过图片，如果需要再次上传，请先删除原来上传的图片！');" & "history.back()" & "</script>" 
Response.End
end if 
FormSize = Request.TotalBytes
FormData = Request.BinaryRead(FormSize)
if FormSize>10000  then
response.write "<script language=JavaScript>" & chr(13) & "alert('你上传的文件大小为"&FormSize/1000&" K，超过最大10K的限制，请处理后再上传！');" & "history.back()" & "</script>" 
Response.End
end if
Image=ImageUp (FormSize,Formdata)
set rs=server.CreateObject("adodb.recordset")
sql="SELECT * FROM imgdata"
rs.Open sql,conn,1,3
rs.AddNew
rs("imagedata") = NULL
rs("imagedata").appendchunk Image
rs("time") = now()
rs("id")=id
rs("type")="学员"
rs.Update
rs.Close
set rs=nothing
response.write "<script language=JavaScript>" & chr(13) & "alert('图片成功上传到我站图片数据库中！由于本站图片服务是付费服务，请及时联系我站管理员为你开通[询：QQ-27229133 电话-13412380803]！好消息：本站VIP会员，赠送1月免费图片显示时间，请及时联系我们为你开通！！');" &"window.location.href = '../in_uppic.asp'" &"</script>" 

%>
<%
function ImageUp(formsize,formdata)
    bncrlf=chrb(13) & chrb(10)
    divider=leftb(formdata,instrb(formdata,bncrlf)-1)
    datastart=instrb(formdata,bncrlf&bncrlf)+4
    dataend=instrb(datastart+1,formdata,divider)-datastart
    imageup=midb(formdata,datastart,dataend)
end function

%>