<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->


<%
if Request.Cookies("id")="" or Request.Cookies("ac")="" or Request.Cookies("user")<>"2" then
response.write "<script language=JavaScript>" & chr(13) & "alert('����δ��½��');"&"window.location.href = 'index.asp'"&" </script>"
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
	selects['0']=new Array(new Option('���ز���','0'));
<%
	for i=1 to rs_s.recordcount
%>
	selects['<%=rs_s("id")%>']=new Array(

new Option('ѡ������','0'),
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
									<p ><font color =#ff0000 size=4><strong>ѧ Ա �� �� �� ��</strong></font></p>

									<table width="96%" height="270" border="0" align="center" cellpadding="0" cellspacing="0" id="table11">
							<form name="form100" method="POST" action="search_vip.asp" TARGET="_blank">
								<tr>
										<td height="30">
										<p align="left"> 
                                            <select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #ffffff">
                                                      <option value="0" selected>ѡ�����</option>
                                                      <option value="0">����</option>
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
                                            %></select> ����ѡ�񣬿ɲ�ѡ����ʾ����
                                </td>
                                </tr>
							 	<tr>
								  <td height="30">
                                  
                                                        <select size="1" size="18" name="town"  style=" font-size: 12px; background-color: #ffffff" >
                                                                    <option value="0" >ѡ������</option>
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
                                                      </select> �ɲ�ѡ�񣬱�ʾ����ȫ�����ء�			  
          
                                </td>
							  </tr>
								<tr>
								  <td height="30"><input name="cs" type="text" style="padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" onFocus="this.value=''" value="��������" size="13" maxlength="13">							      
							      �����������磺�������������Һ�������������������Ϣ������Ϊ���ޡ�</td>
							  </tr>
									<tr>
										<td height="30">
										<p align="left"> 
												<SELECT SIZE="1" NAME="job" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF">
<OPTION VALUE="0" selected>::��ѡ�񸨵���Ŀ���::</OPTION>
<%
call listjob("")
%>
                                                </SELECT>
								      ѧԱϣ�������Ŀ�Ŀ����ѡΪ�������</td>
									</tr>
									<tr>
									  <td height="30">  
<SELECT SIZE="1" NAME="fw" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF">
                                       <OPTION VALUE="0">ѡ�����ʽ</OPTION>
                                       <OPTION VALUE="��Ա����">��Ա����</OPTION>
									   <OPTION VALUE="ѧԱ����">ѧԱ����</OPTION>
									   <OPTION VALUE="������ʽ">������ʽ</OPTION>
									  </SELECT>
ѧԱϣ���ĸ�����ʽ...��ѡ��Ϊ����</td>
									</tr>
																		<tr>
									  <td height="30"><SELECT SIZE="1" NAME="sex" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF">
                                        <OPTION VALUE="0">��ָ���Ա�</OPTION>
                                       <OPTION VALUE="1">��</OPTION>
									   <OPTION VALUE="2">Ů</OPTION>
									  </SELECT>
									    �Ա�Ҫ�󡣲�ѡΪ����</td>
							  </tr>
									<tr>
									  <td height="30">  
<SELECT ID=create_date NAME=date size="1"> 
<option selected value="����">��ѡ�񷢲�ʱ��</option>
<OPTION VALUE="����">����</OPTION> <OPTION VALUE="1">һ����</OPTION> 
<OPTION VALUE="2">������</OPTION> <OPTION VALUE="3">������</OPTION> <OPTION VALUE="7">һ������</OPTION> 
<OPTION VALUE="14">��������</OPTION> <OPTION VALUE="30">һ������</OPTION> <OPTION VALUE="91">��������</OPTION> 
<OPTION VALUE="183">��������</OPTION> <OPTION VALUE="365">һ����</OPTION> </SELECT> 
ѧԱ��Ϣ����ʱ�䣬��ѡΪ����ʱ��</td>
									</tr>
									<tr>
									  <td height="30"><input name="class" type="radio" value="2" checked>
										ѧԱ ���ڽ��е���������ѧԱ������&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td height="30">
										<p align="center">
										 <% if Request.Cookies("e_fullness")<>"ok" then %>
                                           <font color=#FF0000> ��Ҫ��ʾ���������������������ú����������˲���Ϣ����</font>
                                          <%else%>  
                                             <input border="0" src="images/s2.gif" name="I1" width="53" height="20" type="image">&nbsp;&nbsp;&nbsp;&nbsp;	
                                          <%end if %>	

									  </td>
									</tr>
								</form>
								</table>
									<p align="left" class="STYLE4">��������˵����<br><br>&nbsp;&nbsp;&nbsp;&nbsp;1������������Ŀ��Ϊ��ѡ��Ŀ��<br>
									  &nbsp;&nbsp;&nbsp;&nbsp;2��������ʹ����ģ�����Ҽ�������������������֧��ģ�����ҡ��磺�ڡ����������������롰���������ҵ����ơ��������������������Ͼ��������������Ȱ����С������ֵ�������Ϣ��<font color=#ff0000>����ؼ��ִӴ�Χ��ʼ����Ȼ��������С��������ؼ��ֵ��������ٵ�����ȷ��������Χ��</font><br>
									  &nbsp;&nbsp;&nbsp;&nbsp;3��������Ϊ��Աר�й��ܣ�����ǿ��ǰ̨����ͨ������<br>
 									  </p> 
									<p align="left"> &nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE3">��ʾ���������������ѧԱ����ɼ������ѧԱ�Ⲣ��ѧԱ����վ�ڶ��Ż����ṩ����ϵ��ʽ��ϵ����ȷ����һ������ϵ��</span></p>
									<p>&nbsp;</p>
                                    
                                    
<%

set conn=nothing
%>                                    