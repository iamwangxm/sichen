<!--#include file="conn.asp"-->
<TABLE width=728 border=0 align="center" cellPadding=0 cellSpacing=0 style="border:#dddddd 1px solid;">
    <TR align="center"> 
      <TD colspan="3" valign="top"><table border="0" cellpadding="0" cellspacing="0">
          <!--DWLayoutTable-->
          <%
	j=1
	StarNodes=0

	strSourceFile = Server.MapPath("Word.xml")
   Set objXML = Server.CreateObject("Microsoft.XMLDOM")
	objXML.load(strSourceFile)
	Set objRootsite = objXML.documentElement.selectSingleNode("guestbook")

	
	
	'获取子节点数据（因为是从节点数从0开始的所最大子节点数要减1）
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

		if liketype="2" and ischeck="1" then
		
		
	response.write "<td height='28' align='center' valign='middle' bgcolor='#ffffff' style='padding:5px;'><a href='http://"&replace(linkurl,"http://","")&"' target='_blank' title='"&linkname&"'><img src='http://"&replace(imgpath,"http://","")&"' border=0 height=31 width=88></a></td>"	  
		  

	%>
          <% 

if j mod 7=0 then response.write "</tr><tr>" 

j=j+1

end if


StarNodes = StarNodes + 1
wend 

set objXML = nothing 
	
%>
</table></TD>
    </TR>
</TABLE>
