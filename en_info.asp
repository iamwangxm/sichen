
<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="area.asp"-->
<SCRIPT src="moveloc.js" type=text/javascript></SCRIPT>

<script language=JavaScript>
<%
   dim i_1,j_1
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
		new Option('<%=trim(rs_s1("shiName"))%>','<%=trim(rs_s1("id"))&"|"&trim(rs_s("id"))%>'));
<%		else
%>
		new Option('<%=trim(rs_s1("shiName"))%>','<%=trim(rs_s1("id"))&"|"&trim(rs_s("id"))%>'),
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
	  
	  document.form1.Mycity2.value="";//初始化
	  for(i=0;i<document.form1.Mycity.length;i++)
	   {
		   document.form1.Mycity2.value=document.form1.Mycity2.value+document.form1.Mycity.options[i].value+",";
		   if(i>10)
		   {
		   alert("您选择的地区超过了10个！请适当删除部分地区！");
		   return (false);
		   }
	   } 
	   	  
		  
	  document.form1.Myenfudao2.value="";//初始化
	  for(i=0;i<document.form1.Myenfudao.length;i++)
	   {
		   document.form1.Myenfudao2.value=document.form1.Myenfudao2.value+document.form1.Myenfudao.options[i].value+",";
		   if(i>10)
		   {
		   alert("您选择的科目超过了10个！请适当删除部分科目！");
		   return (false);
		   }
	   } 
	   
	   
		  return true
  }
  function reset_form()
  {
   document.form1.name.value="";
   document.form1.pwd.value="";
   document.form1.user.value="";
   document.form1.name.focus;
  }
</script>


<%
sql="select * from en_user where id="&clng(Request.Cookies("id"))
rs.open sql,conn,1,1
if rs.eof or rs.bof then
          rs.close 
		  response.redirect "nodata.html"
           
end if 
%>

<form name="form1" method="POST" action="upinfo_en.asp" onSubmit="return test()">
										<table border="0" cellpadding="0" cellspacing="0" id="table5">
											<tr>
												<td height="40" colspan="4">
												<p align="center"><b>教员资料设置</b></td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">教员姓名：</td>
											    <td height="40"><INPUT TYPE="text" NAME="name" SIZE="20"  <%if Request.Cookies("login")<>"yes" then  response.Write("readonly") end if'管理员登陆可以修改姓名%>  MAXLENGTH=20 VALUE="<%=rs("name")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
											  <td height="40"><span class="STYLE2">*修改姓名请联系管理员</span></td>
											</tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">身份证号：</td>
											  <td height="40"><input name="idcard" type="text" id="idcard" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("idcard")%>" size="22" maxlength="18"  <%if Request.Cookies("login")<>"yes" then  response.Write("readonly") end if'管理员登陆可以修改身份证%>  /></td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">民族：</td>
											  <td height="40"><input name="nation" type="text" id="nation" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("nation")%>" size="4" maxlength="10" />
族</td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">出生年份：<font color="#FF0000">*</font></td>
											  <td height="40"><input name="birthday" type="text" id="birthday" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("birthday")%>" size="4" maxlength="4" />
年</td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">来自省份：</td>
											  <td height="40"><input name="lzsf" type="text" id="lzsf" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("lzsf")%>" size="4" maxlength="10" />
省</td>
											  <td height="40">&nbsp;</td>
										  </tr>
											
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">教员身份：<font color="#FF0000">*</font></td>
												<td height="40" width="47%"> 
                                                  <SELECT SIZE=1 NAME=trade STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
                                                  
                                                  
                                                  <OPTION VALUE="0" <%if rs("trade") ="" then Response.Write "selected"%>>请在以下列表中选择</OPTION>
                                                  <OPTION VALUE=在校学生 <%if rs("trade") ="在校学生" then Response.Write "selected"%>>在校大学生(研究生) ,不含留学生</OPTION> 
                                                  <OPTION VALUE=教师 <%if rs("trade") ="教师" then Response.Write "selected"%>>教师(在职/进修/离职/退休)</OPTION> 
                                                  <OPTION VALUE=外籍人士 <%if rs("trade") ="外籍人士" then Response.Write "selected"%>>外籍人士(含留学生、外教，海归人员)</OPTION> 
                                                  <OPTION VALUE=其它 <%if rs("trade") ="其它" then Response.Write "selected"%>>其他(已经毕业离校的人员)</OPTION> 
                                                  </SELECT></td>
												<td height="40" width="30%">　</td>
											</tr>
											
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">毕业或在读学校：<font color="#FF0000">*</font></td>
											  <td height="40"><input name="school" type="text" id="school" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("school")%>" size="22" /></td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">毕业或在读学历：<font color="#FF0000">*</font></td>
											  <td height="40"><input name="xueli" type="text" id="xueli" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("xueli")%>" size="22" /></td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">毕业或在读专业：</td>
											  <td height="40"><input name="special" type="text" id="special" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("special")%>" size="22" /></td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">&nbsp;</td>
											  <td height="40">&nbsp;</td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">时薪要求：<font color="#FF0000">*</font></td>
											  <td width="47%" height="40"> 
<INPUT TYPE="text" NAME="fund" SIZE="6" MAXLENGTH=6 VALUE="<%=rs("fund")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
											  元人民币<font color="#FF0000"> 可填“协商” </font></td>
												<td height="40" width="30%">　</td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">教员性别：</td>
											  <td height="40" width="47%"> 
<INPUT TYPE="radio"<%if rs("sex") ="男" then Response.Write "checked"%> VALUE="男" NAME="sex"> 
男 <INPUT TYPE="radio" <%if rs("sex") ="女" then Response.Write "checked"%> NAME="sex" VALUE="女"> 
女</td>
												<td height="40" width="30%">　</td>
											</tr>

											<tr>
											  <td width="4%" valign="top">&nbsp;</td>
												<td width="18%" height="40" valign="top">服务区域：<font color="#FF0000">*</font></td>
												<td height="40">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                          <td width="176">
                                                       <select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #fff4e5;width:100;">
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
                                                              <select  name="town"  size="5"    style=" font-size: 12px; background-color: #fff4e5;width:100;" >
                                                              </select>
                                                          </td>
                                                          <td width="90">
                                                          <INPUT onclick=JavaScript:addloc(document.form1.town,document.form1.Mycity) type=button value="选取>>" name=FTianJia><br>
                                                          <input onClick=JavaScript:delloc(document.form1.town,document.form1.Mycity) type=button value="<<删除" name=FShanChu>
                                                          </td>
                                                          <td width="218">
                                                    <select multiple size=6  name=Mycity style="width:100">
                                                              <%
                                                              set rs1_s=server.createobject("adodb.recordset")
                                                              sql2="select * from en_user where id="&clng(Request.Cookies("id"))
                                                              rs1_s.open sql2,conn,1,1
															  if rs1_s.recordcount<>0 then
																  servercity=rs1_s("servercity")
																  servercity = split(servercity,",")
																  For ai=0 to Ubound(servercity)-1
																  %>
	
																	 <option value="<%=servercity(ai)%>"><%=ShowTown(servercity(ai))%></option>
																  <%
	
																  Next
															  end if
                                                              rs1_s.close
                                                              set rs1_s=nothing
                                                              %>
                                                          </select><input type=hidden name="Mycity2"></td>
                                                        </tr>
                                                      </table>  
                                                </td>
								                <td width="30%" height="0"><font color=#ff0000>不修改请不要设置；</font>如果无法选择镇区，请再点一下相应的城市后再选；如没有社区，请<font color=#ff0000>留空</font>，社区要在城市镇区存在的情况下才有效。</td>
	
											</tr>
                                            
											<tr>
											  <td valign="top">&nbsp;</td>
											  <td height="15" valign="top">&nbsp;</td>
											  <td height="15">&nbsp;</td>
											  <td height="15">&nbsp;</td>
											  <td width="1%" height="15">&nbsp;</td>
										  </tr>
											<tr>
											  <td valign="top">&nbsp;</td>
											  <td height="40" valign="top">擅长科目：<font color="#FF0000">*</font></td>
											  <td height="40" >
                                                 <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                      <tr>
                                                        <td width="176"><select  size=10 name=enfudao style="width:100;border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #fff4e5">
                                                          <!--option value="0" selected  >请在以下列表中选择</option-->
                                                          <%
                                                            call listjob("")
                                                          %>
                                                        </select></td>
                                                        <td width="91">
                                                        <INPUT onclick=JavaScript:addloc(document.form1.enfudao,document.form1.Myenfudao) type=button value="选取>>" name=FTianJia><br>
                                                        <input onClick=JavaScript:delloc(document.form1.enfudao,document.form1.Myenfudao) type=button value="<<删除" name=FShanChu>
                                                        </td>
                                                        <td width="217">
<select multiple size=10  name=Myenfudao style="width:100">
                                                              <%
                                                              set rs1_s=server.createobject("adodb.recordset")
                                                              sql2="select * from en_user where id="&clng(Request.Cookies("id"))
                                                              rs1_s.open sql2,conn,1,1
															  if rs1_s.recordcount<>0 then
																  enfudao=rs1_s("enfudao")
																  enfudao = split(enfudao,",")
																  For ai=0 to Ubound(enfudao)-1
																  %>
	
																	 <option value="<%=enfudao(ai)%>"><%=enfudao(ai)%></option>
																  <%
	
																  Next
															  end if
                                                              rs1_s.close
                                                              set rs1_s=nothing
                                                              %>
                                                        </select><input type=hidden name="Myenfudao2"></td>
                                                      </tr>
                                                </table>                                        
                                              
                                              </td>
											  <td height="0">&nbsp;</td>
											  <td height="40">&nbsp;</td>
									      </tr>
                                          
                                                                                      
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">辅导经验：</td>
											  <td height="20"><select name="fdjy" size="1" id="fdjy" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1">
											    <option value="1" <%if rs("fdjy") ="1" then Response.Write "selected"%>>1</option>
											    <option value="2" <%if rs("fdjy") ="2" then Response.Write "selected"%>>2</option>
											    <option value="3" <%if rs("fdjy") ="3" then Response.Write "selected"%>>3</option>
											    <option value="4" <%if rs("fdjy") ="4" then Response.Write "selected"%>>4</option>
											    <option value="5" <%if rs("fdjy") ="5" then Response.Write "selected"%>>5</option>
											    <option value="6" <%if rs("fdjy") ="6" then Response.Write "selected"%>>6</option>
											    <option value="7" <%if rs("fdjy") ="7" then Response.Write "selected"%>>7</option>
											    <option value="8" <%if rs("fdjy") ="8" then Response.Write "selected"%>>8</option>
											    <option value="9" <%if rs("fdjy") ="9" then Response.Write "selected"%>>9</option>
											    <option value="10" <%if rs("fdjy") ="10" then Response.Write "selected"%>>10</option>
											    <option value="11" <%if rs("fdjy") ="11" then Response.Write "selected"%>>大于10</option>
											    </select>
年</td>
											  <td height="0">&nbsp;</td>
										  </tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">每次最少辅导：<font color="#FF0000">*</font></td>
											  <td width="47%" height="20"> 
<INPUT TYPE="text" NAME="mcsj" SIZE="5" MAXLENGTH=2 VALUE="<%=rs("mcsj")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
小时</td>
												<td width="30%" height="0">　</td>
											</tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">服务方式：<font color="#FF0000">*</font></td>
										      <td width="47%" height="0"><SELECT SIZE=1 NAME=fwff STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE="0" <%if rs("fwff") ="" then Response.Write "selected"%>>请在以下列表中选择</OPTION>
<OPTION VALUE=教员上门 <%if rs("fwff") ="教员上门" then Response.Write "selected"%>>教员上门</OPTION> 
<OPTION VALUE=学员上门 <%if rs("fwff") ="学员上门" then Response.Write "selected"%>>学员上门</OPTION> 
<OPTION VALUE=其它方式 <%if rs("fwff") ="其它方式" then Response.Write "selected"%>>其它方式</OPTION> 

</SELECT></td>
										      <td width="30%" height="0">&nbsp;</td>
									      </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">有效期限：<font color="#FF0000">*</font></td>
										      <td width="47%" height="20">
											  <SELECT SIZE=1 NAME=yxq STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE="0" <%if rs("yxq") ="" then Response.Write "selected"%>>请在以下列表中选择</OPTION>
<OPTION VALUE=一个月 <%if rs("yxq") ="一个月" then Response.Write "selected"%>>一个月</OPTION> 
<OPTION VALUE=三个月 <%if rs("yxq") ="三个月" then Response.Write "selected"%>>三个月</OPTION> 
<OPTION VALUE=半年 <%if rs("yxq") ="半年" then Response.Write "selected"%>>半年</OPTION> 
<OPTION VALUE=一年 <%if rs("yxq") ="一年" then Response.Write "selected"%>>一年</OPTION> 
<OPTION VALUE=长期有效 <%if rs("yxq") ="长期有效" then Response.Write "selected"%>>长期有效</OPTION>
</SELECT></td>
										      <td width="30%" height="40">&nbsp;</td>
									      </tr>

											<tr>
											  <td>&nbsp;</td>
												<td height="40">
												  教员简介：<font color="#FF0000">*</font></td>
												<td height="40"><p>
												  <textarea rows="10" name="jianj" cols="53" style="border:1px solid #000000; background-color: #FFfFFF; color: #000060; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1"><%=rs("jianj")%></textarea>
										        </p></td>
											  <td height="40">300字以内 </td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">目前住址：<font color="#FF0000">*</font></td>
												<td width="47%" height="40" bgcolor="#FFFBF7"> 
<INPUT TYPE="text" NAME="address" SIZE="30" MAXLENGTH=40 VALUE="<%=rs("address")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
												<td height="40" width="30%">　</td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">邮政编码：</td>
												<td width="47%" height="40" bgcolor="#FFFBF7"> 
											  <INPUT TYPE="text" NAME="zip" SIZE="13" MAXLENGTH=6 VALUE="<%=rs("zip")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
												<td height="40" width="30%">　</td>
											</tr>
																					
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">联系电话：<font color="#FF0000">*</font></td>
											  <td height="40" colspan="2"> 
											   <% if Request.Cookies("vip")="true" or rs("rz")=true then %>
	 <INPUT TYPE="text" NAME="phone" SIZE="15"  MAXLENGTH=40 VALUE="<%=rs("phone")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
	 	 <%else%>
     <INPUT TYPE="text" NAME="phone" SIZE="15" readonly MAXLENGTH=40 VALUE="<%=rs("phone")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
         <%end if %>
											  
											  

<font color="#FF0000">普通用户禁止修改,修改提供证件[<a href="nomo.html" target="_blank">查看原因</a>]</font></td>
											</tr>
											
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">电子信箱：<font color="#FF0000">*</font></td>
												<td height="40" width="47%"> <INPUT TYPE="text" NAME="email" SIZE="20" MAXLENGTH=40 VALUE="<%=rs("email")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
												<td height="40" width="30%">　</td>
											</tr>
											
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">QQ号码：</td>
												<td height="40" width="47%"> 
<INPUT TYPE="text" NAME="qq" SIZE="20" MAXLENGTH=40 VALUE="<%=rs("qq")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
												<td height="40" width="30%">　</td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">个人网站：</td>
											  <td height="40" width="47%"> 
<INPUT TYPE="text" NAME="web" SIZE="15" MAXLENGTH=50 VALUE="<%=rs("web")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
<a href="http://www.dgijh.com" target="_blank"><font color=#ff0000>免费申请个人博客</font></a></td>
												<td height="40" width="30%">　											    </td>
											</tr>
											<tr>
												<td height="40" colspan="4">
												<p align="center">
												<input type="submit" value="完成" name="B1"></td>
											</tr>
										</table>
</form>
                                    <span class="STYLE1">提示：如果点“完成”出错，说明你登录超时，请重新登录埴写本页内容。</span>　
<%
rs.close
set rs=nothing
set conn=nothing
%>                                    