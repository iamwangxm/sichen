<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->

<div class="l-aside">
<div class="rc-block1 rc-block1-yellow notice">
	<b class="tl"></b><b class="tr"></b>
	<div class="outer">
		<div class="inner">
			<div class="hd">
		<h3>按地区找教员</h3><br/>

	</div>
			<div class="bd" style="margin:10 10 10 10">
    <%
	set rs_s=server.createobject("adodb.recordset")
	sql="select * from en_city where shengid=2  order by id"
	rs_s.open sql,conn,1,1
	while not rs_s.eof
	%> 
      <a href='psearchj_vip.asp?city=<%=rs_s("id")%>&town=<%=rs_s("shiNo")%>&flag=1' target="_blank"><%=rs_s("shiName")%></a>
   <%
    rs_s.movenext
    wend
	rs_s.close
	set rs_s=nothing	
   %>

</div>
	</div>
	</div>
</div>
</div>
