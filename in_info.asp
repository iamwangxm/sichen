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

		  
	  document.form1.Myinfudao2.value="";//初始化
	  for(i=0;i<document.form1.Myinfudao.length;i++)
	   {
		   document.form1.Myinfudao2.value=document.form1.Myinfudao2.value+document.form1.Myinfudao.options[i].value+",";
		   if(i>10)
		   {
		   alert("您选择的科目超过了10个！请适当删除部分科目！");
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
												学员基本资料设置</b></td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">
												学员姓名：</td>
											  <td width="35%" height="40" bgcolor="#FFFBF7"><input type="text" name="name" size="23" <%if Request.Cookies("login")<>"yes" then  response.Write("readonly") end if'管理员登陆可以修改姓名%> style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("name")%>"></td>
												<td height="40" width="44%">
												  <span class="STYLE2">修改请联系管理员</span></td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">
											  性别：<font color="#FF0000">*</font></td>
												<td height="40" width="35%">
                                                
                                                  <SELECT NAME=sex STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" size="1">
                                                  <OPTION VALUE="" selected >性别</OPTION>
                                                   <OPTION VALUE="男" <%if rs("sex") ="男" then Response.Write "selected"%>>男</OPTION>
								                   <OPTION VALUE="女" <%if rs("sex") ="女" then Response.Write "selected"%>>女</OPTION>
								                  </SELECT>
                                                 </td>
												<td height="40" width="44%">&nbsp;</td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">年龄：<font color="#FF0000">*</font></td>
												<td height="40" width="35%">
												<input name="age" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("age")%>" size="10" maxlength="3"></td>
												<td height="40" width="44%">
												<font color="#FF0000">周岁</font></td>
											</tr>																						
											<tr>
												<td height="40" width="21%" align="right">所在地区：<font color="#FF0000">*</font></td>
												<td height="40" width="35%">
<%
			    set rss=server.createobject("adodb.recordset")
				sqls="select * from en_city where id="&int(rs("city"))
				rss.open sqls,conn,1,1
				if rss.eof then
				end if
				if rs("city") =0 then
				response.write "不详"
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
				response.write "不详"
				end if
                townName=rssx("shiName")
                rssx.close
                set rssx=nothing
                %>
                              当前设置：<font color=#ff0000><%=cityName%><%=townName%></font><br>
                               城市：<select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #fff4e5">
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
%></select><br>
            区县：<select  size="1" name="town"  style=" font-size: 12px; background-color: #fff4e5" >
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
					 </select><br>
					 社区：<input name="xian" value=<%=rs("xian")%> type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="10" maxlength="8"></td>
												<td height="40" width="44%">
												<font color=#ff0000>不修改请不要设置；</font>如果无法选择镇区，请再点一下相应的城市后再选；如没有社区，请<font color=#ff0000>留空</font>，社区要在城市镇区存在的情况下才有效。</td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">辅导方式：<font color="#FF0000">*</font></td>
												<td height="40" width="35%"> 
<SELECT SIZE=1 NAME=fdfs STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE="0" <%if rs("fdfs") ="" then Response.Write "selected"%>>请在以下列表中选择</OPTION>
<OPTION VALUE=教员上门 <%if rs("fdfs") ="教员上门" then Response.Write "selected"%>>教员上门</OPTION> 
<OPTION VALUE=学员上门 <%if rs("fdfs") ="学员上门" then Response.Write "selected"%>>学员上门</OPTION> 
<OPTION VALUE=其它方式 <%if rs("fdfs") ="其它方式" then Response.Write "selected"%>>其它方式</OPTION> 
</SELECT></td>
												<td height="40" width="44%">&nbsp;</td>
											</tr>
											<tr>
												<td height="40" width="21%" align="right">就读学校：<font color="#FF0000">*</font></td>
												<td height="40" width="35%">
												<input name="school" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("school")%>" size="25" maxlength="25"></td>
												<td height="40" width="44%">可填&ldquo;无&rdquo;</td>
											</tr>
											
											<tr>
											  <td height="40" align="right">所在年级：<font color="#FF0000">*</font></td>
										      <td width="35%" height="0" bgcolor="#FFFBF7"><input name="zxnj" type="text" id="zxnj" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("zxnj")%>" size="23" maxlength="8"></td>
										      <td width="44%" height="0">如：初二，可填&ldquo;无&rdquo;</td>
										  </tr>
											<tr>
											  <td height="40" align="right">需要辅导科目：<font color="#FF0000">*</font></td>
										      <td width="35%" height="0" bgcolor="#FFFBF7">
                                              
                                                 <table border="0" cellspacing="0" cellpadding="0">
                                                      <tr>
                                                        <td><select  size=10 name=infudao style="width:100;border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #fff4e5">
                                                          <!--option value="0" selected  >请在以下列表中选择</option-->
                                                          <%
                                                            call listjob("")
                                                          %>
                                                        </select></td>
                                                        <td>
                                                        <INPUT onclick=JavaScript:addloc(document.form1.infudao,document.form1.Myinfudao) type=button value="选取>>" name=FTianJia><br>
                                                        <input onClick=JavaScript:delloc(document.form1.infudao,document.form1.Myinfudao) type=button value="<<删除" name=FShanChu>
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
											  <td height="40" align="right">每小时可支付：<font color="#FF0000">*</font></td>
										      <td width="35%" height="20" bgcolor="#FFFBF7"><input name="shixin" type="text" id="shixin" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("shixin")%>" size="10" maxlength="3">
									          元</td>
										      <td width="44%" height="0"><font color="#FF0000"> 可填“协商” </font></td>
										  </tr>
											<tr>
											  <td height="40" align="right">信息有效期：<font color="#FF0000">*</font></td>
										      <td width="35%" height="20"><SELECT SIZE=1 NAME=yxq STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE="0" <%if rs("yxq") ="" then Response.Write "selected"%>>请在以下列表中选择</OPTION>
<OPTION VALUE=一个月 <%if rs("yxq") ="一个月" then Response.Write "selected"%>>一个月</OPTION> 
<OPTION VALUE=三个月 <%if rs("yxq") ="三个月" then Response.Write "selected"%>>三个月</OPTION> 
<OPTION VALUE=半年 <%if rs("yxq") ="半年" then Response.Write "selected"%>>半年</OPTION> 
<OPTION VALUE=一年 <%if rs("yxq") ="一年" then Response.Write "selected"%>>一年</OPTION> 
<OPTION VALUE=长期有效 <%if rs("yxq") ="长期有效" then Response.Write "selected"%>>长期有效</OPTION>
</SELECT></td>
										      <td width="44%" height="40">&nbsp;</td>
										  </tr>
											
											<tr>
											  <td height="40" colspan="3" align="center" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
												<td width="21%" height="20" align="right">学员简介或对教员要求：<font color="#FF0000">*</font></td>
											  <td width="35%" height="20"><textarea rows="10" name="xyjj" cols="40" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"><%=rs("xyjj")%></textarea></td>
											  <td width="44%" height="20"><font color="#FF0000">200字以内</font></td>
											</tr>
											<tr>
											  <td height="20" colspan="3" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">上课时间：<font color="#FF0000">*</font></td>
											  <td height="40" colspan="2" bgcolor="#FFFBF7">
                                                       <table width="60%"  border="1" cellpadding="0"  cellspacing="0" bordercolor=#AAAAAA>
                                                            <tr>
                                                              <td><div align="center">周一</div></td>
                                                              <td><div align="center">周二</div></td>
                                                              <td><div align="center">周三</div></td>
                                                              <td><div align="center">周四</div></td>
                                                            </tr>
                                                            <tr>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>上午</td>
                                                                    <td>下午</td>
                                                                    <td>晚上</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="周一上午" type="checkbox" name="times" <%if instr(rs("sksj"),"周一上午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周一下午" type="checkbox" name="times" <%if instr(rs("sksj"),"周一下午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周一晚上" type="checkbox" name="times" <%if instr(rs("sksj"),"周一晚上")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>上午</td>
                                                                    <td>下午</td>
                                                                    <td>晚上</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="周二上午" type="checkbox" name="times" <%if instr(rs("sksj"),"周二上午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周二下午" type="checkbox" name="times" <%if instr(rs("sksj"),"周二下午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周二晚上" type="checkbox" name="times" <%if instr(rs("sksj"),"周二晚上")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>上午</td>
                                                                    <td>下午</td>
                                                                    <td>晚上</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="周三上午" type="checkbox" name="times" <%if instr(rs("sksj"),"周三上午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周三下午" type="checkbox" name="times" <%if instr(rs("sksj"),"周三下午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周三晚上" type="checkbox" name="times" <%if instr(rs("sksj"),"周三晚上")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>上午</td>
                                                                    <td>下午</td>
                                                                    <td>晚上</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="周四上午" type="checkbox" name="times" <%if instr(rs("sksj"),"周四上午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周四下午" type="checkbox" name="times" <%if instr(rs("sksj"),"周四下午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周四晚上" type="checkbox" name="times" <%if instr(rs("sksj"),"周四晚上")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                            </tr>
                                                            <tr>
                                                              <td><div align="center">周五</div></td>
                                                              <td><div align="center">周六</div></td>
                                                              <td><div align="center">周日</div></td>
                                                              <td>　</td>
                                                            </tr>
                                                            <tr>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>上午</td>
                                                                    <td>下午</td>
                                                                    <td>晚上</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="周五上午" type="checkbox" name="times" <%if instr(rs("sksj"),"周五上午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周五下午" type="checkbox" name="times" <%if instr(rs("sksj"),"周五下午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周五晚上" type="checkbox" name="times" <%if instr(rs("sksj"),"周五晚上")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>上午</td>
                                                                    <td>下午</td>
                                                                    <td>晚上</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="周六上午" type="checkbox" name="times" <%if instr(rs("sksj"),"周六上午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周六下午" type="checkbox" name="times" <%if instr(rs("sksj"),"周六下午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周六晚上" type="checkbox" name="times" <%if instr(rs("sksj"),"周六晚上")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                                <tbody>
                                                                  <tr>
                                                                    <td>上午</td>
                                                                    <td>下午</td>
                                                                    <td>晚上</td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td><input value="周日上午" type="checkbox" name="times" <%if instr(rs("sksj"),"周日上午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周日下午" type="checkbox" name="times" <%if instr(rs("sksj"),"周日下午")>0 then response.write "checked" end if %> /></td>
                                                                    <td><input value="周日晚上" type="checkbox" name="times" <%if instr(rs("sksj"),"周日晚上")>0 then response.write "checked" end if %> /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><input id="times" value="时间面谈" type="checkbox" name="times"  <%if instr(rs("sksj"),"时间面谈")>0 then response.write "checked" end if %>/>
                                                                时间面谈</td>
                                                            </tr>
                                                            <tr>
                                                              <td colspan="4">辅导次数</td>
                                                            </tr>
                                                            <tr>
                                                              <td colspan="4">
                                                              <select id="times" size="1" name="times">
                                                                <option value="1次/周" <%if instr(rs("sksj"),"1次/周")>0 then response.write "selected='selected'" end if %>>1</option>
                                                                <option value="2次/周" <%if instr(rs("sksj"),"2次/周")>0 then response.write "selected='selected'" end if %>>2</option>
                                                                <option value="3次/周" <%if instr(rs("sksj"),"3次/周")>0 then response.write "selected='selected'" end if %>>3</option>
                                                                <option value="4次/周" <%if instr(rs("sksj"),"4次/周")>0 then response.write "selected='selected'" end if %>>4</option>
                                                                <option value="5次/周" <%if instr(rs("sksj"),"5次/周")>0 then response.write "selected='selected'" end if %>>5</option>
                                                                <option value="6次/周" <%if instr(rs("sksj"),"6次/周")>0 then response.write "selected='selected'" end if %>>6</option>
                                                                <option value="7次/周" <%if instr(rs("sksj"),"7次/周")>0 then response.write "selected='selected'" end if %>>7</option>
                                                                <option value="8次/周" <%if instr(rs("sksj"),"8次/周")>0 then response.write "selected='selected'" end if %>>8</option>
                                                                <option value="9次/周" <%if instr(rs("sksj"),"9次/周")>0 then response.write "selected='selected'" end if %>>9</option>
                                                                <option value="10次/周" <%if instr(rs("sksj"),"10次/周")>0 then response.write "selected='selected'" end if %>>10</option>
                                                                <option value="11次/周" <%if instr(rs("sksj"),"11次/周")>0 then response.write "selected='selected'" end if %>>11</option>
                                                                <option value="12次/周" <%if instr(rs("sksj"),"12次/周")>0 then response.write "selected='selected'" end if %>>12</option>
                                                                <option value="13次/周" <%if instr(rs("sksj"),"13次/周")>0 then response.write "selected='selected'" end if %>>13</option>
                                                                <option value="14次/周" <%if instr(rs("sksj"),"14次/周")>0 then response.write "selected='selected'" end if %>>14</option>
                                                              </select>
                                                                次/周　
                                                                <select id="times" size="1" name="times">
                                                                  <option value="1小时/次"  <%if instr(rs("sksj"),"1小时/次")>0 then response.write "selected='selected'" end if %>>1</option>
                                                                  <option value="1.5小时/次"  <%if instr(rs("sksj"),"1.5小时/次")>0 then response.write "selected='selected'" end if %>>1.5</option>
                                                                  <option value="2小时/次"  <%if instr(rs("sksj"),"2小时/次")>0 then response.write "selected='selected'" end if %>>2</option>
                                                                  <option value="2.5小时/次"  <%if instr(rs("sksj"),"2.5小时/次")>0 then response.write "selected='selected'" end if %>>2.5</option>
                                                                  <option value="3小时/次"  <%if instr(rs("sksj"),"3小时/次")>0 then response.write "selected='selected'" end if %>>3</option>
                                                                  <option value="3.5小时/次"  <%if instr(rs("sksj"),"3.5小时/次")>0 then response.write "selected='selected'" end if %>>3.5</option>
                                                                  <option value="4小时/次"  <%if instr(rs("sksj"),"4小时/次")>0 then response.write "selected='selected'" end if %>>4</option>
                                                                  <option value="4.5小时/次"  <%if instr(rs("sksj"),"4.5小时/次")>0 then response.write "selected='selected'" end if %>>4.5</option>
                                                                  <option value="5小时/次"  <%if instr(rs("sksj"),"5小时/次")>0 then response.write "selected='selected'" end if %>>5</option>
                                                                  <option value="5.5小时/次"  <%if instr(rs("sksj"),"5.5小时/次")>0 then response.write "selected='selected'" end if %>>5.5</option>
                                                                  <option value="6小时/次"  <%if instr(rs("sksj"),"6小时/次")>0 then response.write "selected='selected'" end if %>>6</option>
                                                                </select>
                                                                小时/次</td>
                                                            </tr>
                                                          </table>
                                              
                                              </td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">具体地址：</td>
										      <td height="40" bgcolor="#FFFBF7"><input name="address" type="text" id="address" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("address")%>" size="20" maxlength="30"></td>
										      <td height="40" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">邮政编码：</td>
										      <td height="40" bgcolor="#FFFBF7"><input name="posts" type="text" id="posts" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("posts")%>" size="20" maxlength="30"></td>
										      <td height="40" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">联系电话：<font color="#FF0000">*</font></td>
										      <td height="0" bgcolor="#FFFBF7"><input name="phone" type="text" id="phone" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("phone")%>" size="20" maxlength="30"></td>
										      <td height="0" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">电子信箱：<font color="#FF0000">*</font></td>
										      <td height="0" bgcolor="#FFFBF7"><input name="email" type="text" id="email" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("email")%>" size="20" maxlength="30"></td>
										      <td height="0" align="right" bgcolor="#FFFBF7">&nbsp;</td>
										  </tr>
											<tr>
											  <td height="40" align="right" bgcolor="#FFFBF7">QQ号码：</td>
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
											  <input type="submit" value="提交" name="B1"></td>
											</tr>
										</table>
									</form>
