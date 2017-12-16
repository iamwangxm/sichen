<!--#include file="Safety.asp"-->
<%
id = Request.Querystring("id")
sourceFile = Server.MapPath("Word.xml")
if id<>"" then
   Set source = Server.CreateObject("Microsoft.XMLDOM")
   'Set source = Server.CreateObject("Msxml2.DOMDocument")
   source.async = false
   source.load(sourceFile)
   Set currNode = source.selectSingleNode("xml/guestbook/item[id='" & id & "']")
   if Not IsNull(currNode) then
      currNode.parentNode.removeChild(currNode)
   End If  
   source.save(sourceFile)
Response.Write "<script>window.alert('É¾³ý³É¹¦£¡');window.location='admin.asp';</script>"
Response.End
end if
%>
