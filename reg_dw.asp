<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->

<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=webname%> - �û�ע��</title>

<%
   if Request.QueryString("inid")<>"" then 
      Response.Cookies("inid")=Request.QueryString("inid")
   else
      Response.Cookies("inid")=""
   end if

   Response.Cookies("enid")=""'���
%>




<SCRIPT src="moveloc.js" 
type=text/javascript></SCRIPT>
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
<style type="text/css">
<!--
.STYLE2 {	color: #0066FF;
	font-weight: bold;
}
.STYLE5 {color: #FF0000; font-weight: bold; }
.STYLE13 {color: #FFFF00; font-weight: bold; }
.STYLE15 {
	font-size: 16pt;
	color: #FF0000;
}
-->
</style>
</head>

<body>
<!--#include file="top.asp"-->
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="421" align="center">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD" valign="top" bgcolor="#FEFBF4">
			<div align="center">
				<table border="0" cellspacing="0" cellpadding="0" id="table2" height="377">
					<tr>
						<td height="116" width="214">
						<img border="0" src="images/regtop1.gif"></td>
						<td height="86" width="237">��</td>
						<td height="86" width="128">&nbsp;</td>
						<td height="86" width="58">��</td>
					</tr>
					<tr>
						<td colspan="4" valign="top">
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
      if (document.form1.name.value==""){
	      alert("�������û�����")
		  document.form1.name.focus();
		  return false
		    }
			
	      if (document.form1.pwd.value==""){
	      alert("���������룡");
		  document.form1.pwd.focus();
		  return false
		  } 
		  
		  if (document.form1.pwd.value!=document.form1.pwd1.value){
	      alert("�����������벻һ�£�");
		  document.form1.pwd.focus();
		  return false
		  } 
		  
          if (document.form1.question.value==""){
	      alert("�������������⣡")
		  document.form1.question.focus();
		  return false
		  }
			
          if (document.form1.answer.value==""){
	      alert("����������𰸣�")
		  document.form1.answer.focus();
		  return false
		  }
		  
          if (document.form1.email.value==""){
	      alert("�������ʼ���")
		  document.form1.email.focus();
		  return false
		  }
		  
          if (document.form1.phone.value==""){
	      alert("������绰���룡");
		  document.form1.phone.focus();
		  return false
		  }
		  
          if (document.form1.zpname.value==""){
	      alert("����������������");
		  document.form1.zpname.focus();
		  return false
		  }
		  
		  
          if (document.form1.idcard.value==""){
	      alert("���������֤�ţ�");
		  document.form1.idcard.focus();
		  return false
		  }	  
		  
		  
          if (document.form1.sex.value==""){
	      alert("��ѡ���Ա�");
		  document.form1.sex.focus();
		  return false
		  }	  
		  		  
          if (document.form1.birthday.value==""){
	      alert("���������ĳ�����ݣ�");
		  document.form1.birthday.focus();
		  return false
		  }	  
		  		  
          if (document.form1.address.value==""){
	      alert("��������Ŀǰ��סַ��");
		  document.form1.address.focus();
		  return false
		  }	  
		  
          if (document.form1.trade.value=="0"){
	      alert("��ѡ����Ŀǰ����ݣ�");
		  document.form1.trade.focus();
		  return false
		  }	  		  
		  
          if (document.form1.school.value==""){
	      alert("�������ҵ���ڶ�ѧУ��");
		  document.form1.school.focus();
		  return false
		  }	 
		  
          if (document.form1.xueli.value==""){
	      alert("�������ҵ���ڶ�ѧ����");
		  document.form1.xueli.focus();
		  return false
		  }	 
		  
          if (document.form1.Mycity2.value==""){
	      alert("��ѡ����������")
		  document.form1.Mycity.focus();
		  return false
		  }	
			
			
          if (document.form1.Myenfudao2.value==""){
	      alert("��ѡ���ó���Ŀ��")
		  document.form1.Myenfudao.focus();
		  return false
		    }	
			
			
          if (document.form1.fund.value==""){
	      alert("������ʱнҪ��")
		  document.form1.fund.focus();
		  return false
		    }	
			
			
          if (document.form1.jianj.value==""){
	      alert("�������Ա��飡");
		  document.form1.jianj.focus();
		  return false
		  }	 
		  
  
		  
		  
		  if (document.form1.code.value==""){
	      alert("��������֤�룡")
		  document.form1.code.focus();
		  return false
		    }

		  return true
  }
  function reset_form()
  {
   document.form1.name.value="";
   document.form1.pwd.value="";
   document.form1.userr.value="";
   document.form1.name.focus;
  }
</script>

						<form name="form1" method="POST" action="regdata.asp" onSubmit="return test()">
						  <div align="center">
								<table border="0" cellspacing="0" cellpadding="0" id="table3" height="1129">
									<tr>
										<td height="30" colspan="3">
										<b>����д������Ϣ��</b>��<span class="STYLE4">�������ȷ��д��</span><font color=ff0000>���ϲ�ʵ�������ߣ�����ɾ������</font></td>
										<td width="291" height="0"></td>
									</tr>
									<tr>
									  <td height="30" colspan="4"><img src="imagen/ddd.gif" width="16" height="16"><a href="cookie.asp" target="_blank"><strong>�����������������Ƿ�֧�ֱ�վ�ṩ�ķ���</strong></a></td>
							      </tr>
									<tr>
										<td width="88" height="30">�� �� ����<font color="#FF0000">*</font></td>
										<td height="30" colspan="2">
								    <input name="name" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td width="291" height="30">
										��¼ʹ�ã�15���ַ���,ֻ������(a-z),(A-Z),(0-9)</td>
									</tr>
									<tr>
										<td width="88" height="30">��&nbsp;&nbsp;&nbsp; 
									  �룺<font color="#FF0000">*</font></td>
										<td height="30" colspan="2">
								    <input name="pwd" type="password" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td width="291" height="30">��</td>
									</tr>
									<tr>
										<td width="88" height="30">����ȷ�ϣ�<font color="#FF0000">*</font></td>
										<td height="30" colspan="2">
								    <input name="pwd1" type="password" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td width="291" height="30">��</td>
									</tr>
									<tr>
										<td width="88" height="30">�������⣺<font color="#FF0000">*</font></td>
									  <td height="30" colspan="2">
								    <input name="question" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="25"></td>
										<td width="291" height="30">�����������ʾ����</td>
									</tr>
									<tr>
										<td width="88" height="30">����𰸣�<font color="#FF0000">*</font></td>
										<td height="30" colspan="2">
								    <input name="answer" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="25"></td>
										<td width="291" height="30">
										�����������ʾ����𰸣�����ȡ������</td>
									</tr>
									<tr>
										<td width="88" height="30">�����ʼ���<font color="#FF0000">*</font></td>
										<td height="15" colspan="2">
								    <input name="email" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="50"></td>
										<td width="291" height="15"><font color=#ff0000>ѧԱ������ϵʱʹ�ã�һ��Ҫ��ȷ</font></td>
									</tr>
									<tr>
									  <td width="88" height="26">��ϵ�绰��<font color="#FF0000">*</font></td>
									  <td height="26" colspan="2"><input name="phone" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="13"></td>
								      <td width="291" height="26"><font color=#ff0000>ѧԱ������ϵʱʹ�ã�ע����������޸�</font></td>
								  </tr>
									<tr>
									  <td height="30">QQ�ţ�</td>
									  <td height="15" colspan="2"><input name="qq" type="text" id="qq" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="13"></td>
									  <td height="15">&nbsp;</td>
								  </tr>
									<tr>
										<td width="88" height="30">�û����</td>
										<td height="15" colspan="2">
											<select size="1" name="user" >
											<option value="2" selected>��Ա[��ʦ]</option>
											</select></td> <% =user %>
										<td width="291" height="15">��</td>
									</tr>
									<tr>
									 <td height="30">��Ա������<font color="#FF0000">*</font></td>
								      <td height="0" colspan="2"><input name="zpname" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="20" maxlength="10"> </td>
								      <td width="291" height="0"><span class="STYLE5">ע����ܸ��ģ�</span>���ĺ��֣�����ģ�����վѧԱ���ܿ���ȫ��</td>
									</tr>
                                    
                                    <tr>
                                      <td height="30">���֤�ţ�<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><input name="idcard" type="text" id="idcard" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="22" maxlength="18"></td>
                                      <td height="0">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td height="30">�Ա�<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><SELECT NAME=sex STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" size="1">
                                        <OPTION VALUE="" selected >�Ա�</OPTION>
                                        <OPTION VALUE="��">��</OPTION>
								        <OPTION VALUE="Ů">Ů</OPTION>
								        </SELECT></td>
                                      <td height="0">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td height="30">���壺</td>
                                      <td height="4" colspan="2"><input name="nation" type="text" id="nation" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="4" maxlength="10">
                                        ��</td>
                                      <td height="0">�磺����</td>
                                    </tr>
                                    <tr>
                                      <td height="30">������ݣ�<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><input name="birthday" type="text" id="birthday" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="4" maxlength="4">
                                        ��</td>
                                      <td height="0">�磺1980</td>
                                    </tr>
                                    <tr>
                                      <td height="30">����ʡ�ݣ�</td>
                                      <td height="4" colspan="2"><input name="lzsf" type="text" id="lzsf" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="4" maxlength="10">
                                        ʡ</td>
                                      <td height="0">�磺�㶫ʡ</td>
                                    </tr>
                                    <tr>
                                      <td height="30">Ŀǰסַ��<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><input name="address" type="text" id="address" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="35"></td>
                                      <td height="0">&nbsp;</td>
                                    </tr>
                                    <tr>
									  <td height="30">��Ա��ݣ�<font color="#FF0000">*</font></td>
								      <td height="4" colspan="2">
                                      <SELECT SIZE=1 NAME=trade STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color:#fff4e5"> 
                                      <OPTION VALUE="0" selected >���������б���ѡ��</OPTION>
                                      <OPTION VALUE=��Уѧ��>��У��ѧ��(�о���) ,������ѧ��</OPTION>
                                      <OPTION VALUE=��ʦ>��ʦ(��ְ/����/��ְ/����)</OPTION>
                                      <OPTION VALUE=�⼮��ʿ>�⼮��ʿ(����ѧ������̣�������Ա)</OPTION>
                                      <OPTION VALUE=����>����(�Ѿ���ҵ��У����Ա)</OPTION>
                                      </SELECT>
                                      </td>
								      <td width="291" height="0">&nbsp;</td>
								  </tr>  
                                  
                                  <tr>
                                    <td height="30">��ҵ �� �ڶ�ѧУ��<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><input name="school" type="text" id="school" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="22"></td>
                                      <td height="0">�磺������ѧ</td>
                                  </tr>
                                  <tr>
                                    <td height="30">��ҵ �� �ڶ�ѧ����<font color="#FF0000">*</font></td>
                                    <td height="4" colspan="2"><input name="xueli" type="text" id="xueli" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="22"></td>
                                    <td height="0">�磺���ơ���ר������</td>
                                  </tr>
                                  <tr>
                                    <td height="30">��ҵ �� �ڶ�רҵ��</td>
                                    <td height="4" colspan="2"><input name="special" type="text" id="special" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="22"></td>
                                    <td height="0">�磺����Ӣ��</td>
                                  </tr>
                                  <tr>
									  <td height="30"></td>
								      <td height="4" colspan="2"></td>
								      <td width="291" height="0"></td>
								  </tr>   
                                  
                                                                                                      
									<tr>
									  <td height="30" valign="top">���������<font color="#FF0000">*</font></td>
								      <td height="90" colspan="2">
                                      <!--br>
					 ������<input name="xian" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="20" maxlength="8"-->
                     
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
									    <tr>
									      <td>
<select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #fff4e5;width:100;">
                                                      <option value="0" selected>ѡ�����</option>
                                                      <%  tmpCityid=0
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
                                                                      <!--option value="0" selected >ѡ������      </option-->
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
                                              </select>
                                          </td>
									      <td>
                                          <INPUT onclick=JavaScript:addloc(document.form1.town,document.form1.Mycity) type=button value="ѡȡ>>" name=FTianJia><br>
                                          <input onClick=JavaScript:delloc(document.form1.town,document.form1.Mycity) type=button value="<<ɾ��" name=FShanChu>
                                          </td>
									      <td>
                                          <select multiple size=6  name=Mycity style="width:100"></select><input type=hidden name="Mycity2">
                                          </td>
								        </tr>
								      </table>
                     
                                      </td>
								      <td width="291" height="0"><font color=#ff0000>ѧԱ��ѯʹ�ã�һ��Ҫ��ȷ��</font>����޷�ѡ�����������ٵ�һ����Ӧ�ĳ��к���ѡ�����û����������<font color=#ff0000>����</font>��</td>
								  </tr>
                                  
                                  <tr>
									  <td height="30"></td>
								      <td height="4" colspan="2"></td>
								      <td width="291" height="0"></td>
								  </tr>                                  
									
							    <tr>
									  <td height="30" valign="top">�ó���Ŀ��<font color="#FF0000">*</font></td>
									  <td height="4" colspan="2">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
									    <tr>
									      <td><select  size=10 name=enfudao style="width:100;border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #fff4e5">
									        <!--option value="0" selected  >���������б���ѡ��</option-->
									        <%
											  call listjob("")
											%>
								          </select></td>
									      <td>
                                          <INPUT onclick=JavaScript:addloc(document.form1.enfudao,document.form1.Myenfudao) type=button value="ѡȡ>>" name=FTianJia><br>
                                          <input onClick=JavaScript:delloc(document.form1.enfudao,document.form1.Myenfudao) type=button value="<<ɾ��" name=FShanChu>
                                          </td>
									      <td><select multiple size=10  name=Myenfudao style="width:100"></select><input type=hidden 
                              name="Myenfudao2"></td>
								        </tr>
								      </table></td>
									  <td height="0">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="30">&nbsp;</td>
									  <td height="4" colspan="2">&nbsp;</td>
									  <td height="0">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="30">����ʽ��</td>
									  <td height="4" colspan="2">
                                      <SELECT SIZE=1 NAME=fwff STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
                                        <OPTION VALUE="0">���������б���ѡ��</OPTION>
                                        <OPTION VALUE="��Ա����" selected>��Ա����</OPTION> 
                                        <OPTION VALUE="ѧԱ����">ѧԱ����</OPTION> 
                                        <OPTION VALUE="������ʽ">������ʽ</OPTION> 
                                        
                                      </SELECT></td>
									  <td height="0">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="30">�������飺</td>
								      <td height="4" colspan="2"><SELECT NAME=fdjy size="1" id="fdjy" STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1">
								        <OPTION VALUE="1">1</OPTION>
								        <OPTION VALUE="2">2</OPTION>
								        <OPTION VALUE="3">3</OPTION>
								        <OPTION VALUE="4">4</OPTION>
								        <OPTION VALUE="5">5</OPTION>
								        <OPTION VALUE="6">6</OPTION>
								        <OPTION VALUE="7">7</OPTION>                                                                                                                                                                                                        
								        <OPTION VALUE="8">8</OPTION>                                                                                                                                                                                                                                                
								        <OPTION VALUE="9">9</OPTION>                                                                                                                                                                                                        
								        <OPTION VALUE="10">10</OPTION>                                                                                                                                                                                                        
								        <OPTION VALUE="11">����10</OPTION>                                                                                                                                                                                                                                                                                                                                                                        
							          </SELECT>
								        ��</td>
								      <td width="291" height="0">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="30">ʱнҪ��<font color="#FF0000">*</font></td>
									  <td height="4" colspan="2"><INPUT TYPE="text" NAME="fund" SIZE="6" MAXLENGTH=6 STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
Ԫ�����<font color="#FF0000"> ����&ldquo;Э��&rdquo; </font></td>
									  <td height="0">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="30">��Ա��飺<font color="#FF0000">*</font></td>
									  <td height="4" colspan="2"><textarea rows="8" name="jianj" cols="50" style="border:1px solid #000000; background-color: #FFfFFF; color: #000060; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1"></textarea></td>
									  <td height="0"><font color=#ff0000>300������</font></td>
								  </tr>
									
									<tr>
									  <td height="30">��Ч���ޣ�</td>
									  <td height="30" colspan="2"><SELECT SIZE=1 NAME=yxq STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
                                      <OPTION VALUE="0" >���������б���ѡ��</OPTION>
                                      <OPTION VALUE="һ����">һ����</OPTION> 
                                      <OPTION VALUE="������">������</OPTION> 
                                      <OPTION VALUE="����">����</OPTION> 
                                      <OPTION VALUE="һ��" selected>һ��</OPTION> 
                                      <OPTION VALUE="������Ч">������Ч</OPTION>
                                      </SELECT></td>
									  <td height="30">&nbsp;</td>
								  </tr>
									<tr>
										<td width="88" height="30">�� ֤ �룺</td>
										<td width="33" height="30">
									  <input type="text" name="code" size="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									  <td width="187" height="30"><%call getcode()%></td>
										<td width="291" height="30">�����֤��ͼƬ��ˢ����֤�롣</td>
									</tr>
									<tr>
										<td height="20" colspan="4" bgcolor="#000000"><div align="center"><span class="STYLE13">������Ŀ������ȷ��д�����ϲ�ʵ�������ߣ�����</span><strong><font color=ff0000>ɾ��������</font></strong></div></td>
									</tr>
									<tr>
									  <td width="88" height="63">&nbsp;</td>
									  <td width="33" height="63">&nbsp;</td>
								      <td width="187" height="63"><input type="submit" value="�ύ" name="B1"></td>
								      <td width="291" height="63">&nbsp;</td>
								  </tr>
						    </table>
							    <p><br> 
						       <font color=#0099FF>ע��ɹ������¼���롰��Ա���ġ�������������ϸ����¼�����Ϣ��������</font>						  </p>
						  </div>
						</form>
						</td>
					</tr>
			  </table>
			</div>
			</td>
		</tr>
	</table>

<!--#include file="base.asp"-->
</body>

</html>