<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=webname%> - �û�ע��</title>

<%
   if Request.QueryString("enid")<>"" then 
      Response.Cookies("enid")=Request.QueryString("enid")
   else
      Response.Cookies("enid")=""
   end if 
   Response.Cookies("inid")="" '���  
%>


<SCRIPT src="moveloc.js" 
type=text/javascript></SCRIPT>


<script language=JavaScript>
<%dim i_1,j_1
	set rs_s=server.createobject("adodb.recordset")
	sql="select * from city order by cityorder"
	rs_s.open sql,conn,1,1
%>
	var selects=[];
	selects['0']=new Array(new Option('��������','0'));
<%
	for i=1 to rs_s.recordcount
%>
	selects['<%=rs_s("cityNo")%>']=new Array(

new Option('ѡ������','0'),
<%
	set rs_s1=server.createobject("adodb.recordset")
	sql="select * from town where Cityid="&rs_s("id")&" order by TownOrder"
	rs_s1.open sql,conn,1,1
	if rs_s1.recordcount>0 then 
	%>


	<%		for j=1 to rs_s1.recordcount
		if j=rs_s1.recordcount then 
%>
		new Option('<%=trim(rs_s1("townname"))%>','<%=trim(rs_s1("TownNo"))%>'));
<%		else
%>
		new Option('<%=trim(rs_s1("townname"))%>','<%=trim(rs_s1("TownNo"))%>'),
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
.STYLE2 {
	color: #0066FF;
	font-weight: bold;
}
.STYLE6 {color: #FF0000; font-weight: bold; }
.STYLE13 {color: #FFFF00; font-weight: bold; }
.STYLE14 {
	color: #FF0033;
	font-weight: bold;
	font-size: 12px;
}
.STYLE17 {
	font-size: 16pt;
	color: #FF0000;
}
-->
</style>
</head>

<body>
<!--#include file="top.asp"-->
<div align="center">
	<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" height="421">
		<tr>
			<td style="border-left: 1px solid #B8D5AD; border-right: 1px solid #B8D5AD; border-top: 1px solid #B8D5AD" valign="top" bgcolor="#FEFBF4">
			<div align="center">
				<table border="0" cellspacing="0" cellpadding="0" id="table2" height="941">
					<tr>
						<td height="116" width="214">
						<img border="0" src="images/regtop.gif"></td>
						<td height="116" width="237">&nbsp;</td>
						<td height="116" width="128">&nbsp;</td>
						<td height="116" width="58">&nbsp;</td>
				  </tr>
					<tr>
						<td colspan="4" valign="top">
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
          if (document.form1.user.value=="0"){
	      alert("��ѡ���Ա���");
		  document.form1.user.focus();
		  return false
		  }
		  
          if (document.form1.phone.value==""){
	      alert("��������ϵ�绰��")
		  document.form1.phone.focus();
		  return false
		    }
			
          if (document.form1.sex.value==""){
	      alert("�������Ա�")
		  document.form1.sex.focus();
		  return false
		    }
			
          if (document.form1.age.value==""){
	      alert("���������䣡")
		  document.form1.age.focus();
		  return false
		    }
			
          if (document.form1.town.value=="0"){
	      alert("�����������")
		  document.form1.town.focus();
		  return false
		    }
			
          if (document.form1.zxnj.value==""){
	      alert("�����������꼶��")
		  document.form1.zxnj.focus();
		  return false
		    }		
			
			
          if (document.form1.Myinfudao2.value==""){
	      alert("��ѡ�񸨵���Ŀ��")
		  document.form1.infudao.focus();
		  return false
		    }	
			
          if (document.form1.school.value==""){
	      alert("������Ͷ�ѧУ��")
		  document.form1.school.focus();
		  return false
		    }	
			
          if (document.form1.fdfs.value=="0"){
	      alert("��ѡ�񸨵���ʽ��")
		  document.form1.fdfs.focus();
		  return false
		    }
			
          if (document.form1.shixin.value==""){
	      alert("������֧�����꣡")
		  document.form1.shixin.focus();
		  return false
		    }			
			
          if (document.form1.xyjj.value==""){
	      alert("������ѧԱ��飡")
		  document.form1.xyjj.focus();
		  return false
		    }	
			
          if (document.form1.yxq.value=="0"){
	      alert("��������Ϣ��Ч�ڣ�")
		  document.form1.yxq.focus();
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
								<table border="0" width="930" cellspacing="0" cellpadding="0" id="table3" height="720">
									<tr>
										<td height="20" colspan="5">
										<b>����д������Ϣ��</b>��<span class="STYLE4">�������ȷ��д��</span><font color=ff0000>���ϲ�ʵ�������ߣ�����ɾ������</font></td>
									</tr>
									<tr>
									  <td height="35" colspan="4"><img src="imagen/ddd.gif" width="16" height="16"><a href="cookie.asp" target="_blank"><strong>�����������������Ƿ�֧�ֱ�վ�ṩ�ķ���</strong></a></td>
								      <td width="116" height="21">&nbsp;</td>
								  </tr>
									<tr>
										<td width="170" height="25">�� �� ����<font color="#FF0000">*</font></td>
									  <td height="25" colspan="4"><input name="name" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15">
									   ��¼ʹ�ã�15���ַ���,ֻ������(a-z),(A-Z),(0-9)</td>
									</tr>
									<tr>
										<td width="59" height="25">��&nbsp;&nbsp;&nbsp;  
									  �룺<font color="#FF0000">*</font></td>
										<td height="25" colspan="2">
									  <input name="pwd" type="password" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td height="25" colspan="2">��</td>
									</tr>
									<tr>
										<td width="59" height="25">����ȷ�ϣ�<font color="#FF0000">*</font></td>
										<td height="25" colspan="2">
									  <input name="pwd1" type="password" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td height="25" colspan="2">��</td>
									</tr>
									<tr>
										<td width="59" height="25">�������⣺<font color="#FF0000">*</font></td>
										<td height="25" colspan="4">
									  <input name="question" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="20">									   
									  �����������ʾ���⣬����ȡ������</td>
									</tr>
									<tr>
										<td width="59" height="25">����𰸣�<font color="#FF0000">*</font></td>
										<td height="25" colspan="4">
									  <input name="answer" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="20">
									  �����������ʾ����𰸣�����ȡ������</td>
									</tr>
									<tr>
										<td width="59" height="25">�����ʼ���<font color="#FF0000">*</font></td>
										<td height="25" colspan="2">
									  <input name="email" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="50"> 
									  ��Ա��ϵ����ʹ�ã�һ��Ҫ��ȷ�� </td>
										<td height="25" colspan="2">��</td>
									</tr>
									<tr>
									  <td width="59" height="25">��ϵ�绰��<font color="#FF0000">*</font></td>
									  <td height="25" colspan="2"><input name="phone" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="13">  
									  ��Ա��ϵ����ʹ�ã�һ��Ҫ��ȷ��</td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
										<td width="59" height="25">�û����</td>
										<td height="25" colspan="2">
											<select size="1" name="user">																											                                            <option value="1">ѧԱ[�ҳ�]</option>
									  </select></td> <% =user %>
										<td height="25" colspan="2">��</td>
									</tr>
									<tr>
									 <td height="25">ѧԱ������<font color="#FF0000">*</font></td>
								      <td height="25" colspan="4"><input name="zpname" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="10">								        
								      <span class="STYLE6">ע����ܸ��ģ�</span>���ĺ��֣�����ģ��Ǳ�վ��Ա�޷��鿴��ȫ��</td>
							      </tr>
									<tr>
									  <td height="25">�Ա�<font color="#FF0000">*</font></td>
									  <td height="25" colspan="2">
                                        <SELECT NAME=sex STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" size="1">
                                        <OPTION VALUE="" selected >�Ա�</OPTION>
                                        <OPTION VALUE="��">��</OPTION>
								        <OPTION VALUE="Ů">Ů</OPTION>
								        </SELECT>
                                      </td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">���䣺<font color="#FF0000">*</font></td>
								      <td height="25" colspan="4"><input name="age" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="10" maxlength="3">								        
								      <font color="#FF0000">����λ���꣩</font></td>
							      </tr>
									<tr>
									  <td height="25">���ڵ�����<font color="#FF0000">*</font></td>
								      <td height="90" colspan="2">���У�<select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #fff4e5">
          <option value="0" selected>ѡ�����</option>
          <%dim tmpCityid
tmpCityid=0
city=int(city)
town=int(town)
set rs1_s=server.createobject("adodb.recordset")
sql2="select * from city  order by cityorder"
rs1_s.open sql2,conn,1,1
while not rs1_s.eof


           if rs1_s("cityNo") =city  then
     
          tmpCityid=rs1_s("id")
%>
          <option value="<%=rs1_s("cityNo")%>" selected ><%=trim(rs1_s("cityName"))%></option>
          <%
     else
%>
          <option value="<%=rs1_s("cityNo")%>" ><%=trim(rs1_s("cityName"))%></option>
            <%
     end if        
 
    rs1_s.movenext
wend
rs1_s.close
set rs1_s=nothing
%></select><br>
            ������<select size="1" size="18" name="town"  style=" font-size: 12px; background-color: #fff4e5" >
                        <option value="0" >ѡ������</option>
 <%
set rs1_s=server.createobject("adodb.recordset")
sql2="select * from town where Cityid="&tmpCityid&" order by TownOrder"
rs1_s.open sql2,conn,1,1
while not rs1_s.eof
%><option value="<%=rs1_s("TownNo")%>" <%if town=rs1_s("TownNo") then%>selected<%end if%>><%=trim(rs1_s("townname"))%></option>
          <%
    rs1_s.movenext
wend
rs1_s.close
set rs1_s=nothing
%>
					 </select><br>
					 ������<input name="xian" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="20" maxlength="8">
					 <font color=#ff0000>��Ա��ѯʹ�ã�һ��Ҫ��ȷ��</font>����޷�ѡ�����������ٵ�һ����Ӧ�ĳ��к���ѡ�����û����������<font color=#ff0000>����</font>��</td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">�����꼶��<font color="#FF0000">*</font></td>
								      <td height="25" colspan="4"><input name="zxnj" type="text" id="zxnj" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="10" maxlength="8"> 
								        ��Ա��ѯ�����ã��磺����������&ldquo;��&rdquo;</td>
							      </tr>
									<tr>
									  <td>&nbsp;</td>
									  <td colspan="4">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25" valign="top">��Ҫ������Ŀ:<font color="#FF0000">*</font></td>
								      <td height="4" colspan="2">
                                     <table width="50%" border="0" cellspacing="0" cellpadding="0">
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
									      <td><select multiple size=10  name=Myinfudao style="width:100"></select><input type=hidden name="Myinfudao2"></td>
								        </tr>
								      </table>

                                      </td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="10">&nbsp;</td>
									  <td height="10" colspan="2">&nbsp;</td>
									  <td colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">�Ͷ�ѧУ��<font color="#FF0000">*</font></td>
								      <td height="25" colspan="2"><input name="school" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="25">
							          ����&ldquo;��&rdquo;</td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">������ʽ��<font color="#FF0000">*</font></td>
								      <td height="25" colspan="2"><SELECT NAME=fdfs STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" size="1">
                                        <OPTION VALUE="0" selected >��ѡ�񸨵���ʽ</OPTION>
                                        <OPTION VALUE=ѧԱ����>��Ա����</OPTION>
								        <OPTION VALUE=ѧԱ����>ѧԱ����</OPTION>
								        <OPTION VALUE=������ʽ>������ʽ</OPTION>
								        </SELECT></td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">ÿСʱ��֧����<font color="#FF0000">*</font></td>
								      <td height="25" colspan="2"><input name="shixin" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="6" maxlength="5"> 
							          Ԫ��<font color="#FF0000"> ���Э�̡� </font> </td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="15">ѧԱ����Խ�ԱҪ��<font color="#FF0000">*</font></td>
								      <td height="15" colspan="2"><TEXTAREA NAME="xyjj" COLS="50" ROWS="5" id="xyjj" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF"></TEXTAREA>
							          <font color="#FF0000">200����</font></td>
								      <td height="15" colspan="2"><BR></td>
								  </tr>
									
									<tr>
										<td width="59" height="30">�Ͽ�ʱ�䣺<font color="#FF0000">*</font></td>
										<td height="220" colspan="3">
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
                                                                    <td><input value="��һ����" type="checkbox" name="times" /></td>
                                                                    <td><input value="��һ����" type="checkbox" name="times" /></td>
                                                                    <td><input value="��һ����" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="�ܶ�����" type="checkbox" name="times" /></td>
                                                                    <td><input value="�ܶ�����" type="checkbox" name="times" /></td>
                                                                    <td><input value="�ܶ�����" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                    <td><input value="��������" type="checkbox" name="times" /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><input id="times" value="ʱ����̸" type="checkbox" name="times" />
                                                                ʱ����̸</td>
                                                            </tr>
                                                            <tr>
                                                              <td colspan="4">��������</td>
                                                            </tr>
                                                            <tr>
                                                              <td colspan="4"><select id="times" size="1" name="times">
                                                                <option selected="selected" value="1��/��">1</option>
                                                                <option value="2��/��">2</option>
                                                                <option value="3��/��">3</option>
                                                                <option value="4��/��">4</option>
                                                                <option value="5��/��">5</option>
                                                                <option value="6��/��">6</option>
                                                                <option value="7��/��">7</option>
                                                                <option value="8��/��">8</option>
                                                                <option value="9��/��">9</option>
                                                                <option value="10��/��">10</option>
                                                                <option value="11��/��">11</option>
                                                                <option value="12��/��">12</option>
                                                                <option value="13��/��">13</option>
                                                                <option value="14��/��">14</option>
                                                              </select>
                                                                ��/�ܡ�
                                                                <select id="times" size="1" name="times">
                                                                  <option value="1Сʱ/��">1</option>
                                                                  <option value="1.5Сʱ/��">1.5</option>
                                                                  <option selected="selected" value="2Сʱ/��">2</option>
                                                                  <option value="2.5Сʱ/��">2.5</option>
                                                                  <option value="3Сʱ/��">3</option>
                                                                  <option value="3.5Сʱ/��">3.5</option>
                                                                  <option value="4Сʱ/��">4</option>
                                                                  <option value="4.5Сʱ/��">4.5</option>
                                                                  <option value="5Сʱ/��">5</option>
                                                                  <option value="5.5Сʱ/��">5.5</option>
                                                                  <option value="6Сʱ/��">6</option>
                                                                </select>
                                                                Сʱ/��</td>
                                                            </tr>
                                                          </table>                                        
                                        
                                        </td>
								    </tr>
                                    
									<tr>
									  <td height="30">��Ϣ��Ч�ڣ�<font color="#FF0000">*</font></td>
									  <td height="30" colspan="3">
                                        <SELECT SIZE=1 NAME=yxq STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
                                        <OPTION VALUE="0" >���������б���ѡ��</OPTION>
                                        <OPTION VALUE=һ���� >һ����</OPTION> 
                                        <OPTION VALUE=������ >������</OPTION> 
                                        <OPTION VALUE=���� >����</OPTION> 
                                        <OPTION VALUE=һ�� >һ��</OPTION> 
                                        <OPTION VALUE=������Ч >������Ч</OPTION>
                                        </SELECT>
                                      </td>
								  </tr>
									<tr>
										<td width="59" height="30">�� ֤ �룺</td>
										<td width="53" height="30">
									  <input type="text" name="code" size="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									  <td height="30" colspan="2"><%call getcode()%>�����֤��ͼƬ��ˢ����֤�롣</td>
									</tr>
                                                                        
									<tr>
										<td height="20" colspan="5" bgcolor="#000000"><div align="center"><span class="STYLE13">������Ŀ������ȷ��д�����ϲ�ʵ�������ߣ�����</span><strong><font color=ff0000>ɾ��������</font></strong></div></td>
									</tr>
									<tr>
									  <td width="59" height="60">&nbsp;</td>
									  <td width="53" height="60">&nbsp;</td>
								      <td width="701" height="60"><input type="submit" value="�ύ" name="B1"></td>
								      <td height="60" colspan="2">&nbsp;</td>
								  </tr>
							</table>
							    
						  </div>
						</form>
						</td>
					</tr>
			  </table>
			</div>
			</td>
	  </tr>
	</table>
</div>
<!--#include file="base.asp"-->
</body>

</html>