<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->


<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆！');"&"window.location.href = 'index.asp'"&" </script>"
Response.End
end if
%>

<script language=JavaScript>
<%dim i_1,j_1
	set rs_s=server.createobject("adodb.recordset")
	sql="select * from en_city where shiNo=1  order by Shengid"
	rs_s.open sql,conn,1,1
%>
	var selects=[];
	selects['0']=new Array(new Option('区县不限','0'));
<%
	for i=1 to rs_s.recordcount
%>
	selects['<%=rs_s("id")%>']=new Array(

new Option('选择区县','0'),
<%
	set rs_s1=server.createobject("adodb.recordset")
	sql="select * from en_city where shengid="&rs_s("shengid")&" order by shiOrder"
	rs_s1.open sql,conn,1,1
	if rs_s1.recordcount>0 then 
	%>


	<%		for j=1 to rs_s1.recordcount
		if j=rs_s1.recordcount then 
%>
		new Option('<%=trim(rs_s1("shiName"))%>','<%=trim(rs_s1("id"))%>'));
<%		else
%>
		new Option('<%=trim(rs_s1("shiName"))%>','<%=trim(rs_s1("id"))%>'),
<%
		end if
		rs_s1.movenext
		next
	else 
%>
		new Option('','0'));
<%
	end if
	rs_s1.close
	set rs_s1=nothing
	rs_s.movenext
	next
rs_s.close
set rs_s=nothing
%>
	function chsel(){
		with (document.form100){
			if(city.value) {
				town.options.length=0;
				for(var i=0;i<selects[city.value].length;i++){
					town.add(selects[city.value][i]);
				}
			}
		}
	}



</script>



									<p>&nbsp;</p>
									<p ><font color =#ff0000 size=4><strong>学 员 超 级 搜 索</strong></font></p>

									<table width="96%" height="270" border="0" align="center" cellpadding="0" cellspacing="0" id="table11">
							<form name="form100" method="POST" action="search_vip.asp" TARGET="_blank">
								<tr>
										<td height="30">
										<p align="left"> 
                                            <select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #ffffff">
                                                      <option value="0" selected>选择城市</option>
                                                      <option value="0">不限</option>
                                                      <%dim tmpCityid
                                                tmpCityid=0
                                                city=int(city)
                                                town=int(town)
                                                set rs1_s=server.createobject("adodb.recordset")
                                                sql2="select * from en_city  where shiNo=1 order by Shengid"
                                                rs1_s.open sql2,conn,1,1
                                                while not rs1_s.eof
                                                
                                                
                                                           if rs1_s("id") =city  then
                                                     
                                                          tmpCityid=rs1_s("Shengid")
															%>
                                                          <option value="<%=rs1_s("id")%>" selected ><%=trim(rs1_s("shiname"))%></option>
                                                          <%
                                                     else
                                                %>
                                                          <option value="<%=rs1_s("id")%>" ><%=trim(rs1_s("shiname"))%></option>
                                                            <%
                                                     end if        
                                                 
                                                    rs1_s.movenext
                                                wend
                                                rs1_s.close
                                                set rs1_s=nothing
                                            %></select> 城市选择，可不选，表示不限
                                </td>
                                </tr>
							 	<tr>
								  <td height="30">
                                  
                                                        <select size="1" size="18" name="town"  style=" font-size: 12px; background-color: #ffffff" >
                                                                    <option value="0" >选择区县</option>
                                             <%
                                           set rs1_x=server.createobject("adodb.recordset")
                                                sql2="select * from en_city where Shengid="&tmpCityid&" order by shiOrder"
                                                rs1_x.open sql2,conn,1,1
                                                while not rs1_x.eof
                                                %><option value="<%=rs1_x("id")%>" <%if town=rs1_x("id") then%>selected<%end if%>><%=trim(rs1_x("shiname"))%></option>
                                                          <%
                                                    rs1_x.movenext
                                                wend
                                                rs1_x.close
                                                set rs1_x=nothing
                                            %>
                                                      </select> 可不选择，表示市内全部区县。			  
          
                                </td>
							  </tr>
								<tr>
								  <td height="30"><input name="cs" type="text" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" onFocus="this.value=''" value="具体社区" size="13" maxlength="13">							      
							      具体社区，如：长宁区，将查找含“长宁区”的所有信息，不输为不限。</td>
							  </tr>
									<tr>
										<td height="30">
										<p align="left"> 
												<SELECT SIZE="1" NAME="job" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF">
<OPTION VALUE="0" selected>::请选择辅导科目类别::</OPTION>
<%
call listjob("")
%>
                                                </SELECT>
								      学员希望辅导的科目，不选为不限类别</td>
									</tr>
									<tr>
									  <td height="30">  
<SELECT SIZE="1" NAME="fw" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF">
                                       <OPTION VALUE="0">选择服务方式</OPTION>
                                       <OPTION VALUE="教员上门">教员上门</OPTION>
									   <OPTION VALUE="学员上门">学员上门</OPTION>
									   <OPTION VALUE="其它方式">其它方式</OPTION>
									  </SELECT>
学员希望的辅导方式...不选择为不限</td>
									</tr>
																		<tr>
									  <td height="30"><SELECT SIZE="1" NAME="sex" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF">
                                        <OPTION VALUE="0">请指定性别</OPTION>
                                       <OPTION VALUE="1">男</OPTION>
									   <OPTION VALUE="2">女</OPTION>
									  </SELECT>
									    性别要求。不选为不限</td>
							  </tr>
									<tr>
									  <td height="30">  
<SELECT ID=create_date NAME=date size="1"> 
<option selected value="不限">请选择发布时间</option>
<OPTION VALUE="不限">不限</OPTION> <OPTION VALUE="1">一天内</OPTION> 
<OPTION VALUE="2">二天内</OPTION> <OPTION VALUE="3">三天内</OPTION> <OPTION VALUE="7">一星期内</OPTION> 
<OPTION VALUE="14">二星期内</OPTION> <OPTION VALUE="30">一个月内</OPTION> <OPTION VALUE="91">三个月内</OPTION> 
<OPTION VALUE="183">六个月内</OPTION> <OPTION VALUE="365">一年内</OPTION> </SELECT> 
学员信息发布时间，不选为不限时间</td>
									</tr>
									<tr>
									  <td height="30"><input name="class" type="radio" value="2" checked>
										学员 现在进行的是你理想学员的搜索&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td height="30">
										<p align="center">
										 <% if Request.Cookies("e_fullness")<>"ok" then %>
                                           <font color=#FF0000> 重要提示：请您先完成你的资料设置后，再来搜索人才信息！！</font>
                                          <%else%>  
                                             <input border="0" src="images/s2.gif" name="I1" width="53" height="20" type="image">&nbsp;&nbsp;&nbsp;&nbsp;	
                                          <%end if %>	

									  </td>
									</tr>
								</form>
								</table>
									<p align="left" class="STYLE4">搜索方法说明：<br><br>&nbsp;&nbsp;&nbsp;&nbsp;1、所有搜索项目均为可选项目。<br>
									  &nbsp;&nbsp;&nbsp;&nbsp;2、本搜索使用了模糊查找技术，【具体社区】是支持模糊查找。如：在【具体社区】中输入“京”，可找到类似“京”、“北京”、“南京”，“东京”等包含有“京”字的所有信息；<font color=#ff0000>建议关键字从大范围开始查找然后再逐步缩小，即输入关键字的字数由少到多来确定搜索范围。</font><br>
									  &nbsp;&nbsp;&nbsp;&nbsp;3、本功能为会员专有功能，功能强于前台的普通搜索。<br>
 									  </p> 
									<p align="left"> &nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE3">提示：搜索到你理想的学员，你可加入你的学员库并给学员，发站内短信或按其提供的联系方式联系，以确定进一步的联系！</span></p>
									<p>&nbsp;</p>
                                    
                                    
<%

set conn=nothing
%>                                    