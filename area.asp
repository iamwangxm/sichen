
<%
Sub Showarea2(CityNo,TownNo) '��ʾ����������
    if TownNo="0" then
		  set rss=server.createobject("adodb.recordset")
		  sqls="select * from City where CityNo="&int(CityNo)
		  rss.open sqls,conn,1,1
		  if rss.recordcount<>0 then
			  response.Write  rss("CityName")	
		  end if
		  rss.close
		  set rss=nothing
	else
	
		  set rss=server.createobject("adodb.recordset")
		  sqls="select * from Town where TownNo="&int(TownNo)
		  rss.open sqls,conn,1,1
		  if rss.recordcount<>0 then
			  Town=rss("TownName")	
		  end if
		  rss.close
		  set rss=nothing
		  
		  response.Write Town
		  	
	end if
	
End Sub





Function ShowTown(area)'��ʾ����
   	ShowTown=getarea(inittown(area),initcity(area))

End Function


Sub Showarea(area) '��ʾ����������
	area = split(area,",")
	For ai=0 to Ubound(area)-1
    	response.Write getarea(inittown(area(ai)),initcity(area(ai)))
		if ai<>Ubound(area)-1 then response.write "/"
	Next
End Sub


Function  inittown(area)
	inittown=left(area,InStr(1,area,"|")-1)

End Function 

Function initcity(area)
	initcity=right(area,len(area)-InStr(1,area,"|"))
End Function 




Function getarea(town,city)

	set rss=server.createobject("adodb.recordset")
	sqls="select * from city where cityNo="&int(city)
	rss.open sqls,conn,1,1
	if rss.recordcount<>0 then
		Cityid=rss("id")
		city=rss("cityname")	
	end if
	rss.close
	set rss=nothing
	
	if town<>"" then '�������Ϊ��
		set rss=server.createobject("adodb.recordset")
		sqls="select * from town where Cityid="&Cityid&" and  TownNo="&int(town)
		rss.open sqls,conn,1,1
		if rss.recordcount<>0 then
		   town1=rss("townname")
		end if
		rss.close
		set rss=nothing
    	getarea=town1
	else
	    getarea=city
	end if
	



End Function





%>
