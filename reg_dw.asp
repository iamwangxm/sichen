<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->

<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title><%=webname%> - 用户注册</title>

<%
   if Request.QueryString("inid")<>"" then 
      Response.Cookies("inid")=Request.QueryString("inid")
   else
      Response.Cookies("inid")=""
   end if

   Response.Cookies("enid")=""'清空
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
						<td height="86" width="237">　</td>
						<td height="86" width="128">&nbsp;</td>
						<td height="86" width="58">　</td>
					</tr>
					<tr>
						<td colspan="4" valign="top">
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
      if (document.form1.name.value==""){
	      alert("请输入用户名！")
		  document.form1.name.focus();
		  return false
		    }
			
	      if (document.form1.pwd.value==""){
	      alert("请输入密码！");
		  document.form1.pwd.focus();
		  return false
		  } 
		  
		  if (document.form1.pwd.value!=document.form1.pwd1.value){
	      alert("两次密码输入不一致！");
		  document.form1.pwd.focus();
		  return false
		  } 
		  
          if (document.form1.question.value==""){
	      alert("请输入密码问题！")
		  document.form1.question.focus();
		  return false
		  }
			
          if (document.form1.answer.value==""){
	      alert("请输入密码答案！")
		  document.form1.answer.focus();
		  return false
		  }
		  
          if (document.form1.email.value==""){
	      alert("请输入邮件！")
		  document.form1.email.focus();
		  return false
		  }
		  
          if (document.form1.phone.value==""){
	      alert("请输入电话号码！");
		  document.form1.phone.focus();
		  return false
		  }
		  
          if (document.form1.zpname.value==""){
	      alert("请输入您的姓名！");
		  document.form1.zpname.focus();
		  return false
		  }
		  
		  
          if (document.form1.idcard.value==""){
	      alert("请输入身份证号！");
		  document.form1.idcard.focus();
		  return false
		  }	  
		  
		  
          if (document.form1.sex.value==""){
	      alert("请选择性别！");
		  document.form1.sex.focus();
		  return false
		  }	  
		  		  
          if (document.form1.birthday.value==""){
	      alert("请输入您的出生年份！");
		  document.form1.birthday.focus();
		  return false
		  }	  
		  		  
          if (document.form1.address.value==""){
	      alert("请输入您目前的住址！");
		  document.form1.address.focus();
		  return false
		  }	  
		  
          if (document.form1.trade.value=="0"){
	      alert("请选择您目前的身份！");
		  document.form1.trade.focus();
		  return false
		  }	  		  
		  
          if (document.form1.school.value==""){
	      alert("请输入毕业或在读学校！");
		  document.form1.school.focus();
		  return false
		  }	 
		  
          if (document.form1.xueli.value==""){
	      alert("请输入毕业或在读学历！");
		  document.form1.xueli.focus();
		  return false
		  }	 
		  
          if (document.form1.Mycity2.value==""){
	      alert("请选择服务地区！")
		  document.form1.Mycity.focus();
		  return false
		  }	
			
			
          if (document.form1.Myenfudao2.value==""){
	      alert("请选择擅长科目！")
		  document.form1.Myenfudao.focus();
		  return false
		    }	
			
			
          if (document.form1.fund.value==""){
	      alert("请输入时薪要求！")
		  document.form1.fund.focus();
		  return false
		    }	
			
			
          if (document.form1.jianj.value==""){
	      alert("请输入教员简介！");
		  document.form1.jianj.focus();
		  return false
		  }	 
		  
  
		  
		  
		  if (document.form1.code.value==""){
	      alert("请输入验证码！")
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
										<b>√填写基本信息：</b>　<span class="STYLE4">请务必正确填写！</span><font color=ff0000>资料不实或乱填者，将作删除处理！</font></td>
										<td width="291" height="0"></td>
									</tr>
									<tr>
									  <td height="30" colspan="4"><img src="imagen/ddd.gif" width="16" height="16"><a href="cookie.asp" target="_blank"><strong>点这里检测你的浏览器是否支持本站提供的服务？</strong></a></td>
							      </tr>
									<tr>
										<td width="88" height="30">用 户 名：<font color="#FF0000">*</font></td>
										<td height="30" colspan="2">
								    <input name="name" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td width="291" height="30">
										登录使用，15个字符内,只能输入(a-z),(A-Z),(0-9)</td>
									</tr>
									<tr>
										<td width="88" height="30">密&nbsp;&nbsp;&nbsp; 
									  码：<font color="#FF0000">*</font></td>
										<td height="30" colspan="2">
								    <input name="pwd" type="password" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td width="291" height="30">　</td>
									</tr>
									<tr>
										<td width="88" height="30">密码确认：<font color="#FF0000">*</font></td>
										<td height="30" colspan="2">
								    <input name="pwd1" type="password" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td width="291" height="30">　</td>
									</tr>
									<tr>
										<td width="88" height="30">密码问题：<font color="#FF0000">*</font></td>
									  <td height="30" colspan="2">
								    <input name="question" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="25"></td>
										<td width="291" height="30">忘记密码的提示问题</td>
									</tr>
									<tr>
										<td width="88" height="30">密码答案：<font color="#FF0000">*</font></td>
										<td height="30" colspan="2">
								    <input name="answer" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="25"></td>
										<td width="291" height="30">
										忘记密码的提示问题答案，用于取回密码</td>
									</tr>
									<tr>
										<td width="88" height="30">电子邮件：<font color="#FF0000">*</font></td>
										<td height="15" colspan="2">
								    <input name="email" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="50"></td>
										<td width="291" height="15"><font color=#ff0000>学员与你联系时使用，一定要正确</font></td>
									</tr>
									<tr>
									  <td width="88" height="26">联系电话：<font color="#FF0000">*</font></td>
									  <td height="26" colspan="2"><input name="phone" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="13"></td>
								      <td width="291" height="26"><font color=#ff0000>学员与你联系时使用，注册后不能随意修改</font></td>
								  </tr>
									<tr>
									  <td height="30">QQ号：</td>
									  <td height="15" colspan="2"><input name="qq" type="text" id="qq" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="13"></td>
									  <td height="15">&nbsp;</td>
								  </tr>
									<tr>
										<td width="88" height="30">用户类别：</td>
										<td height="15" colspan="2">
											<select size="1" name="user" >
											<option value="2" selected>教员[教师]</option>
											</select></td> <% =user %>
										<td width="291" height="15">　</td>
									</tr>
									<tr>
									 <td height="30">教员姓名：<font color="#FF0000">*</font></td>
								      <td height="0" colspan="2"><input name="zpname" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="20" maxlength="10"> </td>
								      <td width="291" height="0"><span class="STYLE5">注册后不能更改！</span>中文汉字，请放心，仅本站学员才能看到全名</td>
									</tr>
                                    
                                    <tr>
                                      <td height="30">身份证号：<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><input name="idcard" type="text" id="idcard" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="22" maxlength="18"></td>
                                      <td height="0">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td height="30">性别：<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><SELECT NAME=sex STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" size="1">
                                        <OPTION VALUE="" selected >性别</OPTION>
                                        <OPTION VALUE="男">男</OPTION>
								        <OPTION VALUE="女">女</OPTION>
								        </SELECT></td>
                                      <td height="0">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td height="30">民族：</td>
                                      <td height="4" colspan="2"><input name="nation" type="text" id="nation" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="4" maxlength="10">
                                        族</td>
                                      <td height="0">如：汉族</td>
                                    </tr>
                                    <tr>
                                      <td height="30">出生年份：<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><input name="birthday" type="text" id="birthday" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="4" maxlength="4">
                                        年</td>
                                      <td height="0">如：1980</td>
                                    </tr>
                                    <tr>
                                      <td height="30">来自省份：</td>
                                      <td height="4" colspan="2"><input name="lzsf" type="text" id="lzsf" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="4" maxlength="10">
                                        省</td>
                                      <td height="0">如：广东省</td>
                                    </tr>
                                    <tr>
                                      <td height="30">目前住址：<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><input name="address" type="text" id="address" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="35"></td>
                                      <td height="0">&nbsp;</td>
                                    </tr>
                                    <tr>
									  <td height="30">教员身份：<font color="#FF0000">*</font></td>
								      <td height="4" colspan="2">
                                      <SELECT SIZE=1 NAME=trade STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color:#fff4e5"> 
                                      <OPTION VALUE="0" selected >请在以下列表中选择</OPTION>
                                      <OPTION VALUE=在校学生>在校大学生(研究生) ,不含留学生</OPTION>
                                      <OPTION VALUE=教师>教师(在职/进修/离职/退休)</OPTION>
                                      <OPTION VALUE=外籍人士>外籍人士(含留学生、外教，海归人员)</OPTION>
                                      <OPTION VALUE=其它>其他(已经毕业离校的人员)</OPTION>
                                      </SELECT>
                                      </td>
								      <td width="291" height="0">&nbsp;</td>
								  </tr>  
                                  
                                  <tr>
                                    <td height="30">毕业 或 在读学校：<font color="#FF0000">*</font></td>
                                      <td height="4" colspan="2"><input name="school" type="text" id="school" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="22"></td>
                                      <td height="0">如：北京大学</td>
                                  </tr>
                                  <tr>
                                    <td height="30">毕业 或 在读学历：<font color="#FF0000">*</font></td>
                                    <td height="4" colspan="2"><input name="xueli" type="text" id="xueli" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="22"></td>
                                    <td height="0">如：本科、大专、高中</td>
                                  </tr>
                                  <tr>
                                    <td height="30">毕业 或 在读专业：</td>
                                    <td height="4" colspan="2"><input name="special" type="text" id="special" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="22"></td>
                                    <td height="0">如：商务英语</td>
                                  </tr>
                                  <tr>
									  <td height="30"></td>
								      <td height="4" colspan="2"></td>
								      <td width="291" height="0"></td>
								  </tr>   
                                  
                                                                                                      
									<tr>
									  <td height="30" valign="top">服务地区：<font color="#FF0000">*</font></td>
								      <td height="90" colspan="2">
                                      <!--br>
					 社区：<input name="xian" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="20" maxlength="8"-->
                     
                                       <table width="100%" border="0" cellspacing="0" cellpadding="0">
									    <tr>
									      <td>
<select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #fff4e5;width:100;">
                                                      <option value="0" selected>选择城市</option>
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
                                                                      <!--option value="0" selected >选择镇区      </option-->
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
                                          <INPUT onclick=JavaScript:addloc(document.form1.town,document.form1.Mycity) type=button value="选取>>" name=FTianJia><br>
                                          <input onClick=JavaScript:delloc(document.form1.town,document.form1.Mycity) type=button value="<<删除" name=FShanChu>
                                          </td>
									      <td>
                                          <select multiple size=6  name=Mycity style="width:100"></select><input type=hidden name="Mycity2">
                                          </td>
								        </tr>
								      </table>
                     
                                      </td>
								      <td width="291" height="0"><font color=#ff0000>学员查询使用，一定要正确；</font>如果无法选择镇区，请再点一下相应的城市后，再选择，如果没有社区，请<font color=#ff0000>留空</font>。</td>
								  </tr>
                                  
                                  <tr>
									  <td height="30"></td>
								      <td height="4" colspan="2"></td>
								      <td width="291" height="0"></td>
								  </tr>                                  
									
							    <tr>
									  <td height="30" valign="top">擅长科目：<font color="#FF0000">*</font></td>
									  <td height="4" colspan="2">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
									    <tr>
									      <td><select  size=10 name=enfudao style="width:100;border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #fff4e5">
									        <!--option value="0" selected  >请在以下列表中选择</option-->
									        <%
											  call listjob("")
											%>
								          </select></td>
									      <td>
                                          <INPUT onclick=JavaScript:addloc(document.form1.enfudao,document.form1.Myenfudao) type=button value="选取>>" name=FTianJia><br>
                                          <input onClick=JavaScript:delloc(document.form1.enfudao,document.form1.Myenfudao) type=button value="<<删除" name=FShanChu>
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
									  <td height="30">服务方式：</td>
									  <td height="4" colspan="2">
                                      <SELECT SIZE=1 NAME=fwff STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
                                        <OPTION VALUE="0">请在以下列表中选择</OPTION>
                                        <OPTION VALUE="教员上门" selected>教员上门</OPTION> 
                                        <OPTION VALUE="学员上门">学员上门</OPTION> 
                                        <OPTION VALUE="其它方式">其它方式</OPTION> 
                                        
                                      </SELECT></td>
									  <td height="0">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="30">辅导经验：</td>
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
								        <OPTION VALUE="11">大于10</OPTION>                                                                                                                                                                                                                                                                                                                                                                        
							          </SELECT>
								        年</td>
								      <td width="291" height="0">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="30">时薪要求：<font color="#FF0000">*</font></td>
									  <td height="4" colspan="2"><INPUT TYPE="text" NAME="fund" SIZE="6" MAXLENGTH=6 STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF">
元人民币<font color="#FF0000"> 可填&ldquo;协商&rdquo; </font></td>
									  <td height="0">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="30">教员简介：<font color="#FF0000">*</font></td>
									  <td height="4" colspan="2"><textarea rows="8" name="jianj" cols="50" style="border:1px solid #000000; background-color: #FFfFFF; color: #000060; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1"></textarea></td>
									  <td height="0"><font color=#ff0000>300字以内</font></td>
								  </tr>
									
									<tr>
									  <td height="30">有效期限：</td>
									  <td height="30" colspan="2"><SELECT SIZE=1 NAME=yxq STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
                                      <OPTION VALUE="0" >请在以下列表中选择</OPTION>
                                      <OPTION VALUE="一个月">一个月</OPTION> 
                                      <OPTION VALUE="三个月">三个月</OPTION> 
                                      <OPTION VALUE="半年">半年</OPTION> 
                                      <OPTION VALUE="一年" selected>一年</OPTION> 
                                      <OPTION VALUE="长期有效">长期有效</OPTION>
                                      </SELECT></td>
									  <td height="30">&nbsp;</td>
								  </tr>
									<tr>
										<td width="88" height="30">验 证 码：</td>
										<td width="33" height="30">
									  <input type="text" name="code" size="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									  <td width="187" height="30"><%call getcode()%></td>
										<td width="291" height="30">点击验证码图片可刷新验证码。</td>
									</tr>
									<tr>
										<td height="20" colspan="4" bgcolor="#000000"><div align="center"><span class="STYLE13">所有项目必须正确填写！资料不实或乱填者，将作</span><strong><font color=ff0000>删除处理！！</font></strong></div></td>
									</tr>
									<tr>
									  <td width="88" height="63">&nbsp;</td>
									  <td width="33" height="63">&nbsp;</td>
								      <td width="187" height="63"><input type="submit" value="提交" name="B1"></td>
								      <td width="291" height="63">&nbsp;</td>
								  </tr>
						    </table>
							    <p><br> 
						       <font color=#0099FF>注册成功后，请登录进入“会员中心”继续完成你的详细资料录入和信息发布！！</font>						  </p>
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