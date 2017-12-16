              <TABLE cellSpacing=0 cellPadding=0  border=0 align="center"  style="margin-bottom:7" >
                    <TBODY>

                      <TR vAlign=top align=middle>
                        <TD align=middle colSpan=2>
                        <table border="0" cellspacing="0" cellpadding="0" height="25" id="table11">
							<form name="form100"method="POST" action="search.asp" TARGET="_blank">
								<tr>
										<td height="30">
                                                <p align="left"> 
                                                <select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #ffffff">
                                                          <option value="0" selected>选择城市</option>
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
                                                %></select>
                                                   <select  size="1" name="town"  style="font-size: 12px; background-color: #ffffff" >
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
                                        </td>
							        </tr>
									<tr>
										<td height="0">

                                            <SELECT SIZE="1" NAME="job" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF">
                                            <OPTION VALUE="0" selected>辅导科目</OPTION>
                                            <option value="0">不限</option>
                                            <%
                                            call listjob("")
                                            %>
                                            </SELECT>

                                            <SELECT ID=create_date NAME=date size="1"> 
                                            <option selected value="不限">发布时间</option>
                                            <OPTION VALUE="不限">不限</OPTION> <OPTION VALUE="7">一星期内</OPTION> 
                                            <OPTION VALUE="30">一个月内</OPTION> <OPTION VALUE="183">六个月内</OPTION>
                                            <OPTION VALUE="365">一年内</OPTION> </SELECT>
                                      </td>
									</tr>
									<tr>
										<td height="30">
										<% if Request.Cookies("user")="1" then %>
										<input type="radio" value="1" checked name="class">教员&nbsp;&nbsp;&nbsp; 
										<input type="radio" name="class" value="2">学员</td>
										<%else%>
										<input type="radio" value="1"  name="class">教员&nbsp;&nbsp;&nbsp; 
										<input type="radio" checked name="class" value="2">学员</td>
										<%end if %>
                                      </td>									
                                    </tr>
                                    
									<tr>
										<td height="30">
										<p align="left">
										<% if Request.Cookies("id")<>"" or Request.Cookies("ac")<>"" or Request.Cookies("user")<>"" then %>
										<img border="0" src="images/s2.gif" width="53" height="20" onclick=search_vip() style="cursor:pointer">&nbsp;&nbsp;&nbsp;&nbsp;
                                        

                                        
										<a href="<%if Request.Cookies("user")="1" then response.write("control.asp?file=search_job_vip.asp") else   response.write("control.asp?file=search_person_vip.asp") end if%>"><img border="0" src="images/s1.gif" width="79" height="20"  style="cursor:pointer"></a>
										<%else response.write "<font  color=#FF0000>登录后才可搜索</font>  &nbsp;&nbsp; <A  href='law.asp?id=4&what=常见问题'  target='_blank'>新手指南</A>"end if %>
                                        </td>
									</tr>
							</form>
							</table>
                                
                       </TD>
                </TR>
              </TBODY>
            </TABLE>
            
<SCRIPT language=vbscript>                               
sub search_vip()        
	form100.action="search_vip.asp"
	window.event.returnvalue=false        
	form100.submit()                           
end sub   
sub search_novip()        
	form100.action="search.asp"
	window.event.returnvalue=false        
	form100.submit()                           
end sub   

</SCRIPT>   
            