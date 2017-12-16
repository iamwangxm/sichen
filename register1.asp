<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE2 {
	font-size: 14pt;
	color: #006633;
}
.STYLE4 {color: #FF0000}
.STYLE5 {color: #000000}
body,td,th {
	font-size: 12px;
}
-->
</style>
<%
sql="select * from service where id=1"
rs.open sql,conn,1,1
%>

<%=rs("service")%>

<%
rs.close
set rs=nothing
set conn=nothing
%>