
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
	  
	  document.form1.Mycity2.value="";//��ʼ��
	  for(i=0;i<document.form1.Mycity.length;i++)
	   {
		   document.form1.Mycity2.value=document.form1.Mycity2.value+document.form1.Mycity.options[i].value+",";
		   if(i>10)
		   {
		   alert("��ѡ��ĵ���������10�������ʵ�ɾ�����ֵ�����");
		   return (false);
		   }
	   } 
	   	  
		  
	  document.form1.Myenfudao2.value="";//��ʼ��
	  for(i=0;i<document.form1.Myenfudao.length;i++)
	   {
		   document.form1.Myenfudao2.value=document.form1.Myenfudao2.value+document.form1.Myenfudao.options[i].value+",";
		   if(i>10)
		   {
		   alert("��ѡ��Ŀ�Ŀ������10�������ʵ�ɾ�����ֿ�Ŀ��");
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
												<p align="center"><b>��Ա��������</b></td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">��Ա������</td>
											    <td height="40"><INPUT TYPE="text" NAME="name" SIZE="20"  <%if Request.Cookies("login")<>"yes" then  response.Write("readonly") end if'����Ա��½�����޸�����%>  MAXLENGTH=20 VALUE="<%=rs("name")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
											  <td height="40"><span class="STYLE2">*�޸���������ϵ����Ա</span></td>
											</tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">���֤�ţ�</td>
											  <td height="40"><input name="idcard" type="text" id="idcard" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("idcard")%>" size="22" maxlength="18"  <%if Request.Cookies("login")<>"yes" then  response.Write("readonly") end if'����Ա��½�����޸����֤%>  /></td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">���壺</td>
											  <td height="40"><input name="nation" type="text" id="nation" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("nation")%>" size="4" maxlength="10" />
��</td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">������ݣ�<font color="#FF0000">*</font></td>
											  <td height="40"><input name="birthday" type="text" id="birthday" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("birthday")%>" size="4" maxlength="4" />
��</td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">����ʡ�ݣ�</td>
											  <td height="40"><input name="lzsf" type="text" id="lzsf" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("lzsf")%>" size="4" maxlength="10" />
ʡ</td>
											  <td height="40">&nbsp;</td>
										  </tr>
											
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">��Ա��ݣ�<font color="#FF0000">*</font></td>
												<td height="40" width="47%"> 
                                                  <SELECT SIZE=1 NAME=trade STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
                                                  
                                                  
                                                  <OPTION VALUE="0" <%if rs("trade") ="" then Response.Write "selected"%>>���������б���ѡ��</OPTION>
                                                  <OPTION VALUE=��Уѧ�� <%if rs("trade") ="��Уѧ��" then Response.Write "selected"%>>��У��ѧ��(�о���) ,������ѧ��</OPTION> 
                                                  <OPTION VALUE=��ʦ <%if rs("trade") ="��ʦ" then Response.Write "selected"%>>��ʦ(��ְ/����/��ְ/����)</OPTION> 
                                                  <OPTION VALUE=�⼮��ʿ <%if rs("trade") ="�⼮��ʿ" then Response.Write "selected"%>>�⼮��ʿ(����ѧ������̣�������Ա)</OPTION> 
                                                  <OPTION VALUE=���� <%if rs("trade") ="����" then Response.Write "selected"%>>����(�Ѿ���ҵ��У����Ա)</OPTION> 
                                                  </SELECT></td>
												<td height="40" width="30%">��</td>
											</tr>
											
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">��ҵ���ڶ�ѧУ��<font color="#FF0000">*</font></td>
											  <td height="40"><input name="school" type="text" id="school" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("school")%>" size="22" /></td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">��ҵ���ڶ�ѧ����<font color="#FF0000">*</font></td>
											  <td height="40"><input name="xueli" type="text" id="xueli" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("xueli")%>" size="22" /></td>
											  <td height="40">&nbsp;</td>
										  </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">��ҵ���ڶ�רҵ��</td>
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
												<td height="40" width="18%">ʱнҪ��<font color="#FF0000">*</font></td>
											  <td width="47%" height="40"> 
<INPUT TYPE="text" NAME="fund" SIZE="6" MAXLENGTH=6 VALUE="<%=rs("fund")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
											  Ԫ�����<font color="#FF0000"> ���Э�̡� </font></td>
												<td height="40" width="30%">��</td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">��Ա�Ա�</td>
											  <td height="40" width="47%"> 
<INPUT TYPE="radio"<%if rs("sex") ="��" then Response.Write "checked"%> VALUE="��" NAME="sex"> 
�� <INPUT TYPE="radio" <%if rs("sex") ="Ů" then Response.Write "checked"%> NAME="sex" VALUE="Ů"> 
Ů</td>
												<td height="40" width="30%">��</td>
											</tr>

											<tr>
											  <td width="4%" valign="top">&nbsp;</td>
												<td width="18%" height="40" valign="top">��������<font color="#FF0000">*</font></td>
												<td height="40">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                          <td width="176">
                                                       <select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #fff4e5;width:100;">
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
                                                              <select  name="town"  size="5"    style=" font-size: 12px; background-color: #fff4e5;width:100;" >
                                                              </select>
                                                          </td>
                                                          <td width="90">
                                                          <INPUT onclick=JavaScript:addloc(document.form1.town,document.form1.Mycity) type=button value="ѡȡ>>" name=FTianJia><br>
                                                          <input onClick=JavaScript:delloc(document.form1.town,document.form1.Mycity) type=button value="<<ɾ��" name=FShanChu>
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
								                <td width="30%" height="0"><font color=#ff0000>���޸��벻Ҫ���ã�</font>����޷�ѡ�����������ٵ�һ����Ӧ�ĳ��к���ѡ����û����������<font color=#ff0000>����</font>������Ҫ�ڳ����������ڵ�����²���Ч��</td>
	
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
											  <td height="40" valign="top">�ó���Ŀ��<font color="#FF0000">*</font></td>
											  <td height="40" >
                                                 <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                      <tr>
                                                        <td width="176"><select  size=10 name=enfudao style="width:100;border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #fff4e5">
                                                          <!--option value="0" selected  >���������б���ѡ��</option-->
                                                          <%
                                                            call listjob("")
                                                          %>
                                                        </select></td>
                                                        <td width="91">
                                                        <INPUT onclick=JavaScript:addloc(document.form1.enfudao,document.form1.Myenfudao) type=button value="ѡȡ>>" name=FTianJia><br>
                                                        <input onClick=JavaScript:delloc(document.form1.enfudao,document.form1.Myenfudao) type=button value="<<ɾ��" name=FShanChu>
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
											  <td height="40">�������飺</td>
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
											    <option value="11" <%if rs("fdjy") ="11" then Response.Write "selected"%>>����10</option>
											    </select>
��</td>
											  <td height="0">&nbsp;</td>
										  </tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">ÿ�����ٸ�����<font color="#FF0000">*</font></td>
											  <td width="47%" height="20"> 
<INPUT TYPE="text" NAME="mcsj" SIZE="5" MAXLENGTH=2 VALUE="<%=rs("mcsj")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
Сʱ</td>
												<td width="30%" height="0">��</td>
											</tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">����ʽ��<font color="#FF0000">*</font></td>
										      <td width="47%" height="0"><SELECT SIZE=1 NAME=fwff STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE="0" <%if rs("fwff") ="" then Response.Write "selected"%>>���������б���ѡ��</OPTION>
<OPTION VALUE=��Ա���� <%if rs("fwff") ="��Ա����" then Response.Write "selected"%>>��Ա����</OPTION> 
<OPTION VALUE=ѧԱ���� <%if rs("fwff") ="ѧԱ����" then Response.Write "selected"%>>ѧԱ����</OPTION> 
<OPTION VALUE=������ʽ <%if rs("fwff") ="������ʽ" then Response.Write "selected"%>>������ʽ</OPTION> 

</SELECT></td>
										      <td width="30%" height="0">&nbsp;</td>
									      </tr>
											<tr>
											  <td>&nbsp;</td>
											  <td height="40">��Ч���ޣ�<font color="#FF0000">*</font></td>
										      <td width="47%" height="20">
											  <SELECT SIZE=1 NAME=yxq STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE="0" <%if rs("yxq") ="" then Response.Write "selected"%>>���������б���ѡ��</OPTION>
<OPTION VALUE=һ���� <%if rs("yxq") ="һ����" then Response.Write "selected"%>>һ����</OPTION> 
<OPTION VALUE=������ <%if rs("yxq") ="������" then Response.Write "selected"%>>������</OPTION> 
<OPTION VALUE=���� <%if rs("yxq") ="����" then Response.Write "selected"%>>����</OPTION> 
<OPTION VALUE=һ�� <%if rs("yxq") ="һ��" then Response.Write "selected"%>>һ��</OPTION> 
<OPTION VALUE=������Ч <%if rs("yxq") ="������Ч" then Response.Write "selected"%>>������Ч</OPTION>
</SELECT></td>
										      <td width="30%" height="40">&nbsp;</td>
									      </tr>

											<tr>
											  <td>&nbsp;</td>
												<td height="40">
												  ��Ա��飺<font color="#FF0000">*</font></td>
												<td height="40"><p>
												  <textarea rows="10" name="jianj" cols="53" style="border:1px solid #000000; background-color: #FFfFFF; color: #000060; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1"><%=rs("jianj")%></textarea>
										        </p></td>
											  <td height="40">300������ </td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">Ŀǰסַ��<font color="#FF0000">*</font></td>
												<td width="47%" height="40" bgcolor="#FFFBF7"> 
<INPUT TYPE="text" NAME="address" SIZE="30" MAXLENGTH=40 VALUE="<%=rs("address")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
												<td height="40" width="30%">��</td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">�������룺</td>
												<td width="47%" height="40" bgcolor="#FFFBF7"> 
											  <INPUT TYPE="text" NAME="zip" SIZE="13" MAXLENGTH=6 VALUE="<%=rs("zip")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
												<td height="40" width="30%">��</td>
											</tr>
																					
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">��ϵ�绰��<font color="#FF0000">*</font></td>
											  <td height="40" colspan="2"> 
											   <% if Request.Cookies("vip")="true" or rs("rz")=true then %>
	 <INPUT TYPE="text" NAME="phone" SIZE="15"  MAXLENGTH=40 VALUE="<%=rs("phone")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
	 	 <%else%>
     <INPUT TYPE="text" NAME="phone" SIZE="15" readonly MAXLENGTH=40 VALUE="<%=rs("phone")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
         <%end if %>
											  
											  

<font color="#FF0000">��ͨ�û���ֹ�޸�,�޸��ṩ֤��[<a href="nomo.html" target="_blank">�鿴ԭ��</a>]</font></td>
											</tr>
											
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">�������䣺<font color="#FF0000">*</font></td>
												<td height="40" width="47%"> <INPUT TYPE="text" NAME="email" SIZE="20" MAXLENGTH=40 VALUE="<%=rs("email")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
												<td height="40" width="30%">��</td>
											</tr>
											
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">QQ���룺</td>
												<td height="40" width="47%"> 
<INPUT TYPE="text" NAME="qq" SIZE="20" MAXLENGTH=40 VALUE="<%=rs("qq")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"></td>
												<td height="40" width="30%">��</td>
											</tr>
											<tr>
											  <td width="4%">&nbsp;</td>
												<td height="40" width="18%">������վ��</td>
											  <td height="40" width="47%"> 
<INPUT TYPE="text" NAME="web" SIZE="15" MAXLENGTH=50 VALUE="<%=rs("web")%>" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
<a href="http://www.dgijh.com" target="_blank"><font color=#ff0000>���������˲���</font></a></td>
												<td height="40" width="30%">��											    </td>
											</tr>
											<tr>
												<td height="40" colspan="4">
												<p align="center">
												<input type="submit" value="���" name="B1"></td>
											</tr>
										</table>
</form>
                                    <span class="STYLE1">��ʾ������㡰��ɡ�����˵�����¼��ʱ�������µ�¼��д��ҳ���ݡ�</span>��
<%
rs.close
set rs=nothing
set conn=nothing
%>                                    