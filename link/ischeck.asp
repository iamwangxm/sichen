<!--#include file="Safety.asp"-->
<!--#include file="char.inc"-->
<%
	filePath = "word.xml"
	Set objXML = Server.CreateObject("Microsoft.XMLDOM")
   'Set objXML = server.CreateObject("Msxml2.DOMDocument")
        objXML.async = False
        loadResult = objXML.Load(server.MapPath(filePath))
        If Not loadResult Then
             Response.Write ("加载XML文件出错!")
               Response.End
         End If		

      id =  Request("ID")
	  	  
	  
      Set objNodes = objXML.selectSingleNode("xml/guestbook/item[id ='" & id & "']")



      if Not IsNull(objNodes) then
	 
	  
       ischeck = trim(Request("ischeck"))
	   
       if ischeck <> "" then
	   
		objNodes.childNodes(6).text  = ischeck
		
		objXML.save(server.MapPath(filePath))
				
		Set objXML=nothing
		
		Response.Write "<script>window.alert('链接审核完毕');window.location='admin.asp';</script>"
		
		response.end
		
    end if
	   
    end if
	  
	  
%>

 