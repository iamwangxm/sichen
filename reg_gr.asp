<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=webname%> - 用户注册</title>

<%
   if Request.QueryString("enid")<>"" then 
      Response.Cookies("enid")=Request.QueryString("enid")
   else
      Response.Cookies("enid")=""
   end if 
   Response.Cookies("inid")="" '清空  
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
	selects['0']=new Array(new Option('镇区不限','0'));
<%
	for i=1 to rs_s.recordcount
%>
	selects['<%=rs_s("cityNo")%>']=new Array(

new Option('选择镇区','0'),
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
          if (document.form1.user.value=="0"){
	      alert("请选择会员类别！");
		  document.form1.user.focus();
		  return false
		  }
		  
          if (document.form1.phone.value==""){
	      alert("请输入联系电话！")
		  document.form1.phone.focus();
		  return false
		    }
			
          if (document.form1.sex.value==""){
	      alert("请输入性别！")
		  document.form1.sex.focus();
		  return false
		    }
			
          if (document.form1.age.value==""){
	      alert("请输入年龄！")
		  document.form1.age.focus();
		  return false
		    }
			
          if (document.form1.town.value=="0"){
	      alert("请输入地区！")
		  document.form1.town.focus();
		  return false
		    }
			
          if (document.form1.zxnj.value==""){
	      alert("请输入所在年级！")
		  document.form1.zxnj.focus();
		  return false
		    }		
			
			
          if (document.form1.Myinfudao2.value==""){
	      alert("请选择辅导科目！")
		  document.form1.infudao.focus();
		  return false
		    }	
			
          if (document.form1.school.value==""){
	      alert("请输入就读学校！")
		  document.form1.school.focus();
		  return false
		    }	
			
          if (document.form1.fdfs.value=="0"){
	      alert("请选择辅导方式！")
		  document.form1.fdfs.focus();
		  return false
		    }
			
          if (document.form1.shixin.value==""){
	      alert("请输入支付报酬！")
		  document.form1.shixin.focus();
		  return false
		    }			
			
          if (document.form1.xyjj.value==""){
	      alert("请输入学员简介！")
		  document.form1.xyjj.focus();
		  return false
		    }	
			
          if (document.form1.yxq.value=="0"){
	      alert("请输入信息有效期！")
		  document.form1.yxq.focus();
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
								<table border="0" width="930" cellspacing="0" cellpadding="0" id="table3" height="720">
									<tr>
										<td height="20" colspan="5">
										<b>√填写基本信息：</b>　<span class="STYLE4">请务必正确填写！</span><font color=ff0000>资料不实或乱填者，将作删除处理！</font></td>
									</tr>
									<tr>
									  <td height="35" colspan="4"><img src="imagen/ddd.gif" width="16" height="16"><a href="cookie.asp" target="_blank"><strong>点这里检测你的浏览器是否支持本站提供的服务？</strong></a></td>
								      <td width="116" height="21">&nbsp;</td>
								  </tr>
									<tr>
										<td width="170" height="25">用 户 名：<font color="#FF0000">*</font></td>
									  <td height="25" colspan="4"><input name="name" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15">
									   登录使用，15个字符内,只能输入(a-z),(A-Z),(0-9)</td>
									</tr>
									<tr>
										<td width="59" height="25">密&nbsp;&nbsp;&nbsp;  
									  码：<font color="#FF0000">*</font></td>
										<td height="25" colspan="2">
									  <input name="pwd" type="password" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td height="25" colspan="2">　</td>
									</tr>
									<tr>
										<td width="59" height="25">密码确认：<font color="#FF0000">*</font></td>
										<td height="25" colspan="2">
									  <input name="pwd1" type="password" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="15"></td>
										<td height="25" colspan="2">　</td>
									</tr>
									<tr>
										<td width="59" height="25">密码问题：<font color="#FF0000">*</font></td>
										<td height="25" colspan="4">
									  <input name="question" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="20">									   
									  忘记密码的提示问题，用于取回密码</td>
									</tr>
									<tr>
										<td width="59" height="25">密码答案：<font color="#FF0000">*</font></td>
										<td height="25" colspan="4">
									  <input name="answer" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="20">
									  忘记密码的提示问题答案，用于取回密码</td>
									</tr>
									<tr>
										<td width="59" height="25">电子邮件：<font color="#FF0000">*</font></td>
										<td height="25" colspan="2">
									  <input name="email" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="50"> 
									  教员联系您所使用，一定要正确！ </td>
										<td height="25" colspan="2">　</td>
									</tr>
									<tr>
									  <td width="59" height="25">联系电话：<font color="#FF0000">*</font></td>
									  <td height="25" colspan="2"><input name="phone" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="13">  
									  教员联系您所使用，一定要正确！</td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
										<td width="59" height="25">用户类别：</td>
										<td height="25" colspan="2">
											<select size="1" name="user">																											                                            <option value="1">学员[家长]</option>
									  </select></td> <% =user %>
										<td height="25" colspan="2">　</td>
									</tr>
									<tr>
									 <td height="25">学员姓名：<font color="#FF0000">*</font></td>
								      <td height="25" colspan="4"><input name="zpname" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="10">								        
								      <span class="STYLE6">注册后不能更改！</span>中文汉字，请放心，非本站教员无法查看到全名</td>
							      </tr>
									<tr>
									  <td height="25">性别：<font color="#FF0000">*</font></td>
									  <td height="25" colspan="2">
                                        <SELECT NAME=sex STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" size="1">
                                        <OPTION VALUE="" selected >性别</OPTION>
                                        <OPTION VALUE="男">男</OPTION>
								        <OPTION VALUE="女">女</OPTION>
								        </SELECT>
                                      </td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">年龄：<font color="#FF0000">*</font></td>
								      <td height="25" colspan="4"><input name="age" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="10" maxlength="3">								        
								      <font color="#FF0000">（单位周岁）</font></td>
							      </tr>
									<tr>
									  <td height="25">所在地区：<font color="#FF0000">*</font></td>
								      <td height="90" colspan="2">城市：<select size="1" name="city" onChange=chsel() style=" font-size: 12px; background-color: #fff4e5">
          <option value="0" selected>选择城市</option>
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
            镇区：<select size="1" size="18" name="town"  style=" font-size: 12px; background-color: #fff4e5" >
                        <option value="0" >选择镇区</option>
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
					 社区：<input name="xian" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="20" maxlength="8">
					 <font color=#ff0000>教员查询使用，一定要正确；</font>如果无法选择镇区，请再点一下相应的城市后，再选择，如果没有社区，请<font color=#ff0000>留空</font>。</td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">所在年级：<font color="#FF0000">*</font></td>
								      <td height="25" colspan="4"><input name="zxnj" type="text" id="zxnj" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="10" maxlength="8"> 
								        教员查询条件用，如：初二，可填&ldquo;无&rdquo;</td>
							      </tr>
									<tr>
									  <td>&nbsp;</td>
									  <td colspan="4">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25" valign="top">需要辅导科目:<font color="#FF0000">*</font></td>
								      <td height="4" colspan="2">
                                     <table width="50%" border="0" cellspacing="0" cellpadding="0">
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
									  <td height="25">就读学校：<font color="#FF0000">*</font></td>
								      <td height="25" colspan="2"><input name="school" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="25" maxlength="25">
							          可填&ldquo;无&rdquo;</td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">辅导方式：<font color="#FF0000">*</font></td>
								      <td height="25" colspan="2"><SELECT NAME=fdfs STYLE="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" size="1">
                                        <OPTION VALUE="0" selected >请选择辅导方式</OPTION>
                                        <OPTION VALUE=学员上门>教员上门</OPTION>
								        <OPTION VALUE=学员上门>学员上门</OPTION>
								        <OPTION VALUE=其它方式>其它方式</OPTION>
								        </SELECT></td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="25">每小时可支付：<font color="#FF0000">*</font></td>
								      <td height="25" colspan="2"><input name="shixin" type="text" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" size="6" maxlength="5"> 
							          元，<font color="#FF0000"> 可填“协商” </font> </td>
								      <td height="25" colspan="2">&nbsp;</td>
								  </tr>
									<tr>
									  <td height="15">学员简介或对教员要求：<font color="#FF0000">*</font></td>
								      <td height="15" colspan="2"><TEXTAREA NAME="xyjj" COLS="50" ROWS="5" id="xyjj" STYLE="border: 1px solid #333333; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFFFFF"></TEXTAREA>
							          <font color="#FF0000">200字内</font></td>
								      <td height="15" colspan="2"><BR></td>
								  </tr>
									
									<tr>
										<td width="59" height="30">上课时间：<font color="#FF0000">*</font></td>
										<td height="220" colspan="3">
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
                                                                    <td><input value="周一上午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周一下午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周一晚上" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="周二上午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周二下午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周二晚上" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="周三上午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周三下午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周三晚上" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="周四上午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周四下午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周四晚上" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="周五上午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周五下午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周五晚上" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="周六上午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周六下午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周六晚上" type="checkbox" name="times" /></td>
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
                                                                    <td><input value="周日上午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周日下午" type="checkbox" name="times" /></td>
                                                                    <td><input value="周日晚上" type="checkbox" name="times" /></td>
                                                                  </tr>
                                                                </tbody>
                                                              </table></td>
                                                              <td><input id="times" value="时间面谈" type="checkbox" name="times" />
                                                                时间面谈</td>
                                                            </tr>
                                                            <tr>
                                                              <td colspan="4">辅导次数</td>
                                                            </tr>
                                                            <tr>
                                                              <td colspan="4"><select id="times" size="1" name="times">
                                                                <option selected="selected" value="1次/周">1</option>
                                                                <option value="2次/周">2</option>
                                                                <option value="3次/周">3</option>
                                                                <option value="4次/周">4</option>
                                                                <option value="5次/周">5</option>
                                                                <option value="6次/周">6</option>
                                                                <option value="7次/周">7</option>
                                                                <option value="8次/周">8</option>
                                                                <option value="9次/周">9</option>
                                                                <option value="10次/周">10</option>
                                                                <option value="11次/周">11</option>
                                                                <option value="12次/周">12</option>
                                                                <option value="13次/周">13</option>
                                                                <option value="14次/周">14</option>
                                                              </select>
                                                                次/周　
                                                                <select id="times" size="1" name="times">
                                                                  <option value="1小时/次">1</option>
                                                                  <option value="1.5小时/次">1.5</option>
                                                                  <option selected="selected" value="2小时/次">2</option>
                                                                  <option value="2.5小时/次">2.5</option>
                                                                  <option value="3小时/次">3</option>
                                                                  <option value="3.5小时/次">3.5</option>
                                                                  <option value="4小时/次">4</option>
                                                                  <option value="4.5小时/次">4.5</option>
                                                                  <option value="5小时/次">5</option>
                                                                  <option value="5.5小时/次">5.5</option>
                                                                  <option value="6小时/次">6</option>
                                                                </select>
                                                                小时/次</td>
                                                            </tr>
                                                          </table>                                        
                                        
                                        </td>
								    </tr>
                                    
									<tr>
									  <td height="30">信息有效期：<font color="#FF0000">*</font></td>
									  <td height="30" colspan="3">
                                        <SELECT SIZE=1 NAME=yxq STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
                                        <OPTION VALUE="0" >请在以下列表中选择</OPTION>
                                        <OPTION VALUE=一个月 >一个月</OPTION> 
                                        <OPTION VALUE=三个月 >三个月</OPTION> 
                                        <OPTION VALUE=半年 >半年</OPTION> 
                                        <OPTION VALUE=一年 >一年</OPTION> 
                                        <OPTION VALUE=长期有效 >长期有效</OPTION>
                                        </SELECT>
                                      </td>
								  </tr>
									<tr>
										<td width="59" height="30">验 证 码：</td>
										<td width="53" height="30">
									  <input type="text" name="code" size="4" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"></td>
									  <td height="30" colspan="2"><%call getcode()%>点击验证码图片可刷新验证码。</td>
									</tr>
                                                                        
									<tr>
										<td height="20" colspan="5" bgcolor="#000000"><div align="center"><span class="STYLE13">所有项目必须正确填写！资料不实或乱填者，将作</span><strong><font color=ff0000>删除处理！！</font></strong></div></td>
									</tr>
									<tr>
									  <td width="59" height="60">&nbsp;</td>
									  <td width="53" height="60">&nbsp;</td>
								      <td width="701" height="60"><input type="submit" value="提交" name="B1"></td>
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