<table border="0" cellpadding="0" cellspacing="0" width="95%">
          <!--DWLayoutTable-->
          <%
	i=1
	StarNodes=0

	strSourceFile = Server.MapPath("link/Word.xml")
   Set objXML = Server.CreateObject("Microsoft.XMLDOM")
	objXML.load(strSourceFile)
	Set objRootsite = objXML.documentElement.selectSingleNode("guestbook")

	'Ã¿Ò³ÏÔÊ¾*ÌõÁôÑÔ
	
	AllNodesNum = objRootsite.childNodes.length - 1
		

	
	response.write "<tr>"
	
	
	while StarNodes =< AllNodesNum

		id=objRootsite.childNodes.item(StarNodes).childNodes.item(0).text	
		liketype=objRootsite.childNodes.item(StarNodes).childNodes.item(1).text
		linkname=objRootsite.childNodes.item(StarNodes).childNodes.item(2).text		
		linkurl=objRootsite.childNodes.item(StarNodes).childNodes.item(3).text
		imgpath=objRootsite.childNodes.item(StarNodes).childNodes.item(4).text
		addtime=objRootsite.childNodes.item(StarNodes).childNodes.item(5).text
		ischeck=objRootsite.childNodes.item(StarNodes).childNodes.item(6).text
		
		if liketype="1" and ischeck="1" then
		
		
	response.write "<td height='10' width='105' valign='middle' bgcolor='#ffffff' ><a href='http://"&replace(linkurl,"http://","")&"' target='_blank' class='a4'>"&linkname&"</a></td>"	  
		  

	%>
          <% 

if i mod 9=0 then response.write "</tr><tr>" 

i=i+1

end if


StarNodes = StarNodes + 1
wend 

set objXML = nothing 
	
%>
        </table>