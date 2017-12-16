<!--#include file="../conn.asp"-->
<%

linkname=trim(Request("linkname"))
linkurl=trim(Request("linkurl"))

if len(linkname)>7 then 
   Response.Write "<script>window.alert('文字连接内容太长！');window.location='default.asp';</script>"
   Response.End
end if

if linkname<>"" and linkurl<>"" then

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
oDetailsNode.Text="1"

Set oDetailsNode = oListNode.appendChild(objXML.createElement("linkname"))
oDetailsNode.Text=linkname

Set oDetailsNode = oListNode.appendChild(objXML.createElement("linkurl"))
oDetailsNode.Text=linkurl

Set oDetailsNode = oListNode.appendChild(objXML.createElement("imgpath"))
oDetailsNode.Text=""

Set oDetailsNode = oListNode.appendChild(objXML.createElement("addtime"))
oDetailsNode.Text=now()

Set oDetailsNode = oListNode.appendChild(objXML.createElement("ischeck"))
oDetailsNode.Text="0"


objXML.save(strSourceFile)		
Set objXML=nothing
	
Response.Write "<script>window.alert('文字链接添加成功！请尽快做好本站链接！！');window.location='default.asp';</script>"
Response.End

end if

%>