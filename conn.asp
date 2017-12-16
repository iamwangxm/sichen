<%
if (InStr(request.ServerVariables("HTTP_Referer"),"admin_add_article.asp")=0) and (InStr(request.ServerVariables("HTTP_Referer"),"admin_up_article.asp")=0) then
		SQL_injdata = "'|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare"
		SQL_inj = split(SQL_Injdata,"|")
		If Request.QueryString<>"" Then
		For Each SQL_Get In Request.QueryString
		For SQL_Data=0 To Ubound(SQL_inj)
		if instr(Request.QueryString(SQL_Get),Sql_Inj(Sql_DATA))>0 Then
		Response.Write "<Script Language=JavaScript>alert('请勿提交非法数据！');history.back(-1)</Script>"
		Response.end
		end if
		next
		Next
		End If
		If Request.Form<>"" Then
		For Each Sql_Post In Request.Form
		For SQL_Data=0 To Ubound(SQL_inj)
		if instr(Request.Form(Sql_Post),Sql_Inj(Sql_DATA))>0 Then
		Response.Write "<Script Language=JavaScript>alert('请勿提交非法数据！');history.back(-1)</Script>"
		Response.end
		end if
		next
		next
		end if
end if

db="/sichendb/shouhubx2012.mdb"      '数据库文件的位置
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)

conn.Open connstr
If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "数据库连接出错，请检查连接字串。"
		Response.End
	End If

sub CloseConn()
	conn.close
	set conn=nothing
end sub


set rs=server.createobject("adodb.recordset")

%>
