<!--#include file="../conn.asp"-->
<%
linkname=trim(Request("linkname"))
linkurl=trim(Request("linkurl"))
imgpath=trim(request("imgpath"))



if linkname<>"" and linkurl<>"" and imgpath<>"" then

strSourceFile = Server.MapPath("word.xml")
Set objXML = Server.CreateObject("Microsoft.XMLDOM")
objXML.load(strSourceFile)
If objXML.parseError.ErrorCode <> 0 Then 
objXML.loadXML "<?xml version=""1.0"" encoding=""gb2312"" ?><xml><guestbook></guestbook></xml>"
End If
Set objRootlist = objXML.documentElement.selectSingleNode("guestbook")
If objRootlist.hasChildNodes then
id = objRootlist.lastChild.firstChild.text + 1
Else
id=1
End If
		
Set oListNode = objXML.documentElement.selectSingleNode("guestbook").AppendChild(objXML.createElement("item"))

Set oDetailsNode = oListNode.appendChild(objXML.createElement("id"))
oDetailsNode.Text=id

Set oDetailsNode = oListNode.appendChild(objXML.createElement("linktype"))
oDetailsNode.Text="2"

Set oDetailsNode = oListNode.appendChild(objXML.createElement("linkname"))
oDetailsNode.Text=linkname

Set oDetailsNode = oListNode.appendChild(objXML.createElement("linkurl"))
oDetailsNode.Text=linkurl
Set oDetailsNode = oListNode.appendChild(objXML.createElement("imgpath"))
oDetailsNode.Text=imgpath

Set oDetailsNode = oListNode.appendChild(objXML.createElement("addtime"))
oDetailsNode.Text=now()

Set oDetailsNode = oListNode.appendChild(objXML.createElement("ischeck"))
oDetailsNode.Text="0"

objXML.save(strSourceFile)		
Set objXML=nothing
	
Response.Write "<script>window.alert('图片链接添加成功！请尽快做好本站链接！！');window.location='default.asp';</script>"
Response.End

end if

%>