<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="area.asp"-->
<SCRIPT src="moveloc.js" type=text/javascript></SCRIPT>

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
		with (document.form1){
			if(city.value) {
				town.options.length=0;
				for(var i=0;i<selects[city.value].length;i++){
					town.add(selects[city.value][i]);
				}
			}
		}
	}



</script>


<script language=javascript>
  function test()
  {

		  
	  document.form1.Myinfudao2.value="";//��ʼ��
	  for(i=0;i<document.form1.Myinfudao.length;i++)
	   {
		   document.form1.Myinfudao2.value=document.form1.Myinfudao2.value+document.form1.Myinfudao.options[i].value+",";
		   if(i>10)
		   {
		   alert("��ѡ��Ŀ�Ŀ������10�������ʵ�ɾ�����ֿ�Ŀ��");
		   return (false);
		   }
	   } 
	   
	   
		  return true
  }

</script>


<%
sql="select * from in_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
%>

									<form  name="form1" method="POST" action="upinfo_in.asp"  onSubmit="return test()">
										<table border="0" width="100%" cellspacing="0" cellpadding="0" height="40" id="table5">
											<tr>
												<td height="40" colspan="3">
												<p align="center"><b>
												ѧԱ������������</b></td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">
												ѧԱ������</td>
											  <td width="35%" height="40" bgcolor="#FFFBF7"><input type="text" name="name" size="23" <%if Request.Cookies("login")<>"yes" then  response.Write("readonly") end if'����Ա��½�����޸�����%> style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("name")%>"></td>
												<td height="40" width="44%">
												  <span class="STYLE2">�޸�����ϵ����Ա</span></td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">
											  �Ա�<font color="#FF0000">*</font></td>
												<td height="40" width="35%">
                                                
                                                  <SELECT NAME=sex STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" size="1">
                                                  <OPTION VALUE="" selected >�Ա�</OPTION>
                                                   <OPTION VALUE="��" <%if rs("sex") ="��" then Response.Write "selected"%>>��</OPTION>
								                   <OPTION VALUE="Ů" <%if rs("sex") ="Ů" then Response.Write "selected"%>>Ů</OPTION>
								                  </SELECT>
                                                 </td>
												<td height="40" width="44%">&nbsp;</td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">���䣺<font color="#FF0000">*</font></td>
												<td height="40" width="35%">
												<input name="age" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("age")%>" size="10" maxlength="3"></td>
												<td height="40" width="44%">
												<font color="#FF0000">����</font></td>
											</tr>																						
											<tr>
												<td height="40" width="21%" align="right">���ڵ�����<font color="#FF0000">*</font></td>
												<td height="40" width="35%">
<%
			    set rss=server.createobject("adodb.recordset")
				sqls="select * from en_city where id="&int(rs("city"))
				rss.open sqls,conn,1,1
				if rss.eof then
				end if
				if rs("city") =0 then
				response.write "����"
				end if
               Cityid=rss("id")
               cityName=rss("shiName")
                rss.close
                set rss=nothing
				

			    set rssx=server.createobject("adodb.recordset")
				sqlsx="select * from en_city where id="&int(rs("town"))
				rssx.open sqlsx,conn,1,1
				if rssx.eof then
				end if
				if rs("town") ="" then
				response.write "����"
				end if
                townName=rssx("shiName")
                rssx.close
                set rssx=nothing
                %>
                              ��ǰ���ã�<font color=#ff0000><%=cityName%><%=townName%></font><br>
                               ���У�<select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #fff4e5">
          <option value="0" selected>ѡ�����</option>
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
%></select><br>
            ���أ�<select  size="1" name="town"  style=" font-size: 12px; background-color: #fff4e5" >
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
					 </select><br>
					 ������<input name="xian" value=<%=rs("xian")%> type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="10" maxlength="8"></td>
												<td height="40" width="44%">
												<font color=#ff0000>���޸��벻Ҫ���ã�</font>����޷�ѡ�����������ٵ�һ����Ӧ�ĳ��к���ѡ����û����������<font color=#ff0000>����</font>������Ҫ�ڳ����������ڵ�����²���Ч��</td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">������ʽ��<font color="#FF0000">*</font></td>
												<td height="40" width="35%"> 
<SELECT SIZE=1 NAME=fdfs STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE="0" <%if rs("fdfs") ="" then Response.Write "selected"%>>���������б���ѡ��</OPTION>
<OPTION VALUE=��Ա���� <%if rs("fdfs") ="��Ա����" then Response.Write "selected"%>>��Ա����</OPTION> 
<OPTION VALUE=ѧԱ���� <%if rs("fdfs") ="ѧԱ����" then Response.Write "selected"%>>ѧԱ����</OPTION> 
<OPTION VALUE=������ʽ <%if rs("fdfs") ="������ʽ" then Response.Write "selected"%>>������ʽ</OPTION> 
</SELECT></td>
												<td height="40" width="44%">&nbsp;</td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">�Ͷ�ѧУ��<font color="#FF0000">*</font></td>
												<td height="40" width="35%">
												<input name="school" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("school")%>" size="25" maxlength="25"></td>
												<td height="40" width="44%">����&ldquo;��&rdquo;</td>
											</tr>
											
											<tr>
											  <td height="40" align="right">�����꼶��<font color="#FF0000">*</font></td>
										      <td width="35%" height="0" bgcolor="#FFFBF7"><input name="zxnj" type="text" id="zxnj" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("zxnj")%>" size="23" maxlength="8"></td>
										      <td width="44%" height="0">�磺����������&ldquo;��&rdquo;</td>
										  </tr>
											<tr>
											  <td height="40" align="right">��Ҫ������Ŀ��<font color="#FF0000">*</font></td>
										      <td width="35%" height="0" bgcolor="#FFFBF7">
                                              
                                                 <table border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td><select  size=10 name=infudao style="width:100;border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #fff4e5">
                                                          <!--option value="0" selected  >���������б���ѡ��</option-->
                                                          <%
                                                            call listjob("")
                                                          %>
                                                        </select></td>
                                                        <td>
                                                        <INPUT onclick=JavaScript:addloc(document.form1.infudao,document.form1.Myinfudao) type=button value="ѡȡ>>" name=FTianJia><br>
                                                        <input onClick=JavaScript:delloc(document.form1.infudao,document.form1.Myinfudao) type=button value="<<ɾ��" name=FShanChu>
                                                        </td>
                                                        <td>
                                                    <select multiple size=10  name=Myinfudao style="width:100">
                                                              <%
                                                              set rs1_s=server.createobject("adodb.recordset")
                                                              sql2="select * from in_user where id="&clng(Request.Cookies("id"))
                                                              rs1_s.open sql2,conn,1,1
															  if rs1_s.recordcount<>0 then
																  infudao=rs1_s("infudao")
																  infudao = split(infudao,",")
																  For ai=0 to Ubound(infudao)-1
																  %>
	
																	 <option value="<%=infudao(ai)%>"><%=infudao(ai)%></option>
																  <%
	
																  Next
															  end if
                                                              rs1_s.close
                                                              set rs1_s=nothing
                                                              %>
                                                        </select>
                                                        <input type=hidden name="Myinfudao2"></td>
                                                      </tr>
                                                </table>
                                              
                                              </td>
										      <td width="44%" height="0">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right">ÿСʱ��֧����<font color="#FF0000">*</font></td>
										      <td width="35%" height="20" bgcolor="#FFFBF7"><input name="shixin" type="text" id="shixin" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("shixin")%>" size="10" maxlength="3">
									          Ԫ</td>
										      <td width="44%" height="0"><font color="#FF0000"> ���Э�̡� </font></td>
										  </tr>
											<tr>
											  <td height="40" align="right">��Ϣ��Ч�ڣ�<font color="#FF0000">*</font></td>
										      <td width="35%" height="20"><SELECT SIZE=1 NAME=yxq STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE="0" <%if rs("yxq") ="" then Response.Write "selected"%>>���������б���ѡ��</OPTION>
<OPTION VALUE=һ���� <%if rs("yxq") ="һ����" then Response.Write "selected"%>>һ����</OPTION> 
<OPTION VALUE=������ <%if rs("yxq") ="������" then Response.Write "selected"%>>������</OPTION> 
<OPTION VALUE=���� <%if rs("yxq") ="����" then Response.Write "selected"%>>����</OPTION> 
<OPTION VALUE=һ�� <%if rs("yxq") ="һ��" then Response.Write "selected"%>>һ��</OPTION> 
<OPTION VALUE=������Ч <%if rs("yxq") ="������Ч" then Response.Write "selected"%>>������Ч</OPTION>
</SELECT></td>
										      <td width="44%" height="40">&nbsp;</td>
										  </tr>
											
											<tr>
											  <td height="40" colspan="3" align="center" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
												<td width="21%" height="20" align="right">ѧԱ����Խ�ԱҪ��<font color="#FF0000">*</font></td>
											  <td width="35%" height="20"><textarea rows="10" name="xyjj" cols="40" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><%=rs("xyjj")%></textarea></td>
											  <td width="44%" height="20"><font color="#FF0000">200������</font></td>
											</tr>
											<tr>
											  <td height="20" colspan="3" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">�Ͽ�ʱ�䣺<font color="#FF0000">*</font></td>
											  <td height="40" colspan="2" bgcolor="#FFFBF7">
                                                       <table width="60%"  border="1" cellpadding="0"  cellspacing="0" bordercolor=#AAAAAA>
                                                            <tr>
                                                              <td><div align="center">��һ</div></td>
                                                              <td><div align="center">�ܶ�</div></td>
                                                              <td><div align="center">����</div></td>
                                                              <td><div align="center">����</div></td>
                                                            </tr>
                                                            <tr>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="��һ����" type="checkbox" name="times" <%if instr(rs("sksj"),"��һ����")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��һ����" type="checkbox" name="times" <%if instr(rs("sksj"),"��һ����")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��һ����" type="checkbox" name="times" <%if instr(rs("sksj"),"��һ����")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="�ܶ�����" type="checkbox" name="times" <%if instr(rs("sksj"),"�ܶ�����")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="�ܶ�����" type="checkbox" name="times" <%if instr(rs("sksj"),"�ܶ�����")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="�ܶ�����" type="checkbox" name="times" <%if instr(rs("sksj"),"�ܶ�����")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                            </tr>
                                                            <tr>
                                                              <td><div align="center">����</div></td>
                                                              <td><div align="center">����</div></td>
                                                              <td><div align="center">����</div></td>
                                                              <td>��</td>
                                                            </tr>
                                                            <tr>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                    <td>����</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" <%if instr(rs("sksj"),"��������")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><input id="times" value="ʱ����̸" type="checkbox" name="times"  <%if instr(rs("sksj"),"ʱ����̸")>0 then response.write "checked" end if %>/>
                                                                ʱ����̸</td>
                                                            </tr>
                                                            <tr>
                                                              <td colspan="4">��������</td>
                                                            </tr>
                                                            <tr>
                                                              <td colspan="4">
                                                              <select id="times" size="1" name="times">
                                                                <option value="1��/��" <%if instr(rs("sksj"),"1��/��")>0 then response.write "selected='selected'" end if %>>1</option>
                                                                <option value="2��/��" <%if instr(rs("sksj"),"2��/��")>0 then response.write "selected='selected'" end if %>>2</option>
                                                                <option value="3��/��" <%if instr(rs("sksj"),"3��/��")>0 then response.write "selected='selected'" end if %>>3</option>
                                                                <option value="4��/��" <%if instr(rs("sksj"),"4��/��")>0 then response.write "selected='selected'" end if %>>4</option>
                                                                <option value="5��/��" <%if instr(rs("sksj"),"5��/��")>0 then response.write "selected='selected'" end if %>>5</option>
                                                                <option value="6��/��" <%if instr(rs("sksj"),"6��/��")>0 then response.write "selected='selected'" end if %>>6</option>
                                                                <option value="7��/��" <%if instr(rs("sksj"),"7��/��")>0 then response.write "selected='selected'" end if %>>7</option>
                                                                <option value="8��/��" <%if instr(rs("sksj"),"8��/��")>0 then response.write "selected='selected'" end if %>>8</option>
                                                                <option value="9��/��" <%if instr(rs("sksj"),"9��/��")>0 then response.write "selected='selected'" end if %>>9</option>
                                                                <option value="10��/��" <%if instr(rs("sksj"),"10��/��")>0 then response.write "selected='selected'" end if %>>10</option>
                                                                <option value="11��/��" <%if instr(rs("sksj"),"11��/��")>0 then response.write "selected='selected'" end if %>>11</option>
                                                                <option value="12��/��" <%if instr(rs("sksj"),"12��/��")>0 then response.write "selected='selected'" end if %>>12</option>
                                                                <option value="13��/��" <%if instr(rs("sksj"),"13��/��")>0 then response.write "selected='selected'" end if %>>13</option>
                                                                <option value="14��/��" <%if instr(rs("sksj"),"14��/��")>0 then response.write "selected='selected'" end if %>>14</option>
                                                              </select>
                                                                ��/�ܡ�
                                                                <select id="times" size="1" name="times">
                                                                  <option value="1Сʱ/��"  <%if instr(rs("sksj"),"1Сʱ/��")>0 then response.write "selected='selected'" end if %>>1</option>
                                                                  <option value="1.5Сʱ/��"  <%if instr(rs("sksj"),"1.5Сʱ/��")>0 then response.write "selected='selected'" end if %>>1.5</option>
                                                                  <option value="2Сʱ/��"  <%if instr(rs("sksj"),"2Сʱ/��")>0 then response.write "selected='selected'" end if %>>2</option>
                                                                  <option value="2.5Сʱ/��"  <%if instr(rs("sksj"),"2.5Сʱ/��")>0 then response.write "selected='selected'" end if %>>2.5</option>
                                                                  <option value="3Сʱ/��"  <%if instr(rs("sksj"),"3Сʱ/��")>0 then response.write "selected='selected'" end if %>>3</option>
                                                                  <option value="3.5Сʱ/��"  <%if instr(rs("sksj"),"3.5Сʱ/��")>0 then response.write "selected='selected'" end if %>>3.5</option>
                                                                  <option value="4Сʱ/��"  <%if instr(rs("sksj"),"4Сʱ/��")>0 then response.write "selected='selected'" end if %>>4</option>
                                                                  <option value="4.5Сʱ/��"  <%if instr(rs("sksj"),"4.5Сʱ/��")>0 then response.write "selected='selected'" end if %>>4.5</option>
                                                                  <option value="5Сʱ/��"  <%if instr(rs("sksj"),"5Сʱ/��")>0 then response.write "selected='selected'" end if %>>5</option>
                                                                  <option value="5.5Сʱ/��"  <%if instr(rs("sksj"),"5.5Сʱ/��")>0 then response.write "selected='selected'" end if %>>5.5</option>
                                                                  <option value="6Сʱ/��"  <%if instr(rs("sksj"),"6Сʱ/��")>0 then response.write "selected='selected'" end if %>>6</option>
                                                                </select>
                                                                Сʱ/��</td>
                                                            </tr>
                                                          </table>
                                              
                                              </td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">�����ַ��</td>
										      <td height="40" bgcolor="#FFFBF7"><input name="address" type="text" id="address" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("address")%>" size="20" maxlength="30"></td>
										      <td height="40" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">�������룺</td>
										      <td height="40" bgcolor="#FFFBF7"><input name="posts" type="text" id="posts" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("posts")%>" size="20" maxlength="30"></td>
										      <td height="40" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">��ϵ�绰��<font color="#FF0000">*</font></td>
										      <td height="0" bgcolor="#FFFBF7"><input name="phone" type="text" id="phone" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("phone")%>" size="20" maxlength="30"></td>
										      <td height="0" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">�������䣺<font color="#FF0000">*</font></td>
										      <td height="0" bgcolor="#FFFBF7"><input name="email" type="text" id="email" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("email")%>" size="20" maxlength="30"></td>
										      <td height="0" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">QQ���룺</td>
										      <td height="0" bgcolor="#FFFBF7"><input name="oicq" type="text" id="oicq" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("oicq")%>" size="20" maxlength="30"></td>
										      <td height="0" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										      <td height="40" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										      <td height="40" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
												<td height="40" colspan="3" align="right" bgcolor="#FFFBF7">
												<p align="center">
											  <input type="submit" value="�ύ" name="B1"></td>
											</tr>
										</table>
									</form>
