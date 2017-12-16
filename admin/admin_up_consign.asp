<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
sql="select * from consign where id="&clng(request("id"))
rs.open sql,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>委托招聘添加</title>
<base target="_self">
</head>

<body bgcolor="#CAD7F7" style="text-align: center">

<p align="center">
						<table border="0" width="461" cellspacing="0" cellpadding="0" height="214">
							<tr>
								<td height="25" background="images/admin_bg_1.gif" width="459" style="border-left: 1px solid #000000; border-right: 1px solid #000000; border-top: 1px solid #000000; border-bottom-width: 1px">
								<p align="center"><font color="#FFFFFF"><b>
								委托招聘修改</b></font></td>
							</tr>
							<tr>
								<td width="460" align="center" bgcolor="#F0F0F0" style="border-left: 1px solid #000000; border-right-width: 1px; border-top-width: 1px; border-bottom: 1px dotted #000000">
								<form method="POST" action="updata_consign.asp">
										<table border="0" width="520" cellspacing="0" cellpadding="0" id="table5">
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">
												招聘公司：</td>
												<td height="40" width="430" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="3"> 
<input type="text" name="company" size="30" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("company")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">
												联系地址：</td>
												<td height="40" width="430" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="3"> 
<input type="text" name="address" size="30" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("address")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">
												联系电话：</td>
												<td height="40" width="430" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="3"> 
<input type="text" name="tel" size="30" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("tel")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">
												联 系 人：</td>
												<td height="40" width="430" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="3"> 
<input type="text" name="person" size="30" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("person")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">
												公司网站：</td>
												<td height="40" width="430" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="3"> 
<input type="text" name="url" size="30" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("url")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">具体职位：</td>
												<td height="40" width="397" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="3"> 
<INPUT MAXLENGTH=30 SIZE=30 NAME=jtzw STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF" value="<%=rs("jtzw")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">工作地区：</td>
												<td height="40" width="397" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" colspan="3"> 
<input type="text" name="hka" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("hka")%>"> &nbsp; 所在镇区<INPUT MAXLENGTH=30 SIZE=9 NAME=town STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF" value="<%=rs("town")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">招聘人数：</td>
												<td height="40" width="131" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<INPUT MAXLENGTH=10  SIZE=4 NAME=zpnum STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF" value="<%=rs("zpnum")%>"> 
人</td>
												<td height="40" width="82" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE" align="center"> 
年龄要求：</td>
												<td height="40" width="172" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<INPUT MAXLENGTH=30 SIZE=7 NAME=nianlings STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF" value="<%=rs("nianlings")%>"> 
岁</td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">专业要求：</td>
												<td height="40" width="131" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<input type="text" name="zyes" size="19" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("zyes")%>"></td>
												<td height="40" width="82" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE" align="center"> 
户籍要求：</td>
												<td height="40" width="172" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<input type="text" name="hkas" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("hkas")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">学历要求：</td>
												<td height="40" width="131" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
<SELECT SIZE=1 NAME=edus STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=不限 <%if rs("edus") ="不限" then Response.Write "selected"%>>不限</OPTION>
<OPTION VALUE=初中 <%if rs("edus") ="初中" then Response.Write "selected"%>>初中</OPTION>
<OPTION VALUE=高中 <%if rs("edus") ="高中" then Response.Write "selected"%>>高中</OPTION>
<OPTION VALUE=中技 <%if rs("edus") ="中技" then Response.Write "selected"%>>中技</OPTION> 
<OPTION VALUE=中专 <%if rs("edus") ="中专" then Response.Write "selected"%>>中专</OPTION>
<OPTION VALUE=大专 <%if rs("edus") ="大专" then Response.Write "selected"%>>大专</OPTION> 
<OPTION VALUE=本科 <%if rs("edus") ="本科" then Response.Write "selected"%>>本科</OPTION>
<OPTION VALUE=硕士 <%if rs("edus") ="硕士" then Response.Write "selected"%>>硕士</OPTION> 
<OPTION VALUE=博士 <%if rs("edus") ="博士" then Response.Write "selected"%>>博士</OPTION> 
</SELECT></td>
												<td height="40" width="82" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE" align="center">
目前住地：</td>
												<td height="40" width="172" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
<input type="text" name="hkbs" size="20" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("hkbs")%>"></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">外语要求：</td>
												<td height="40" width="131" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<SELECT SIZE=1 NAME=languages STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=不限 <%if rs("languages") ="不限" then Response.Write "selected"%>>不限</OPTION>
<OPTION VALUE=英语 <%if rs("languages") ="英语" then Response.Write "selected"%>>英语</OPTION> 
<OPTION VALUE=日语 <%if rs("languages") ="日语" then Response.Write "selected"%>>日语</OPTION> 
<OPTION VALUE=法语 <%if rs("languages") ="法语" then Response.Write "selected"%>>法语</OPTION> 
<OPTION VALUE=德语 <%if rs("languages") ="德语" then Response.Write "selected"%>>德语</OPTION> 
<OPTION VALUE=俄语 <%if rs("languages") ="俄语" then Response.Write "selected"%>>俄语</OPTION> 
<OPTION VALUE=朝鲜语 <%if rs("languages") ="朝鲜语" then Response.Write "selected"%>>朝鲜语</OPTION> 
<OPTION VALUE=西班牙语 <%if rs("languages") ="西班牙语" then Response.Write "selected"%>>西班牙语</OPTION> 
<OPTION VALUE=阿拉伯语 <%if rs("languages") ="阿拉伯语" then Response.Write "selected"%>>阿拉伯语</OPTION> 
<OPTION VALUE=其它 <%if rs("languages") ="其它" then Response.Write "selected"%>>其它</OPTION></SELECT></td>
												<td height="40" width="82" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE" align="center"> 
普通话程度：</td>
												<td height="40" width="172" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<SELECT SIZE=1 NAME=pthuas STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=标准 <%if rs("pthuas") ="标准" then Response.Write "selected"%>>标准</OPTION>
<OPTION VALUE=优秀 <%if rs("pthuas") ="优秀" then Response.Write "selected"%>>优秀</OPTION> 
<OPTION VALUE=良好 <%if rs("pthuas") ="良好" then Response.Write "selected"%>>良好</OPTION>
<OPTION VALUE=一般 <%if rs("pthuas") ="一般" then Response.Write "selected"%>>一般</OPTION> 
<OPTION VALUE=较差 <%if rs("pthuas") ="较差" then Response.Write "selected"%>>较差</OPTION>
</SELECT></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">性别要求：</td>
												<td height="40" width="131" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<SELECT SIZE=1 NAME=sexs STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=不限 <%if rs("sexs") ="不限" then Response.Write "selected"%>>不限</OPTION>
<OPTION VALUE=男 <%if rs("sexs") ="男" then Response.Write "selected"%>>男</OPTION>
<OPTION VALUE=女 <%if rs("sexs") ="女" then Response.Write "selected"%>>女</OPTION>
</SELECT></td>
												<td height="40" width="82" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE" align="center"> 
工作性质：</td>
												<td height="40" width="172" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<SELECT SIZE=1 NAME=jobtypes STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=全职 <%if rs("jobtypes") ="全职" then Response.Write "selected"%>>全职</OPTION>
<OPTION VALUE=兼职 <%if rs("jobtypes") ="兼职" then Response.Write "selected"%>>兼职</OPTION>
<OPTION VALUE=两者兼可 <%if rs("jobtypes") ="两者兼可" then Response.Write "selected"%>>两者兼可</OPTION>
</SELECT></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">婚姻状况：</td>
												<td height="40" width="131" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<SELECT SIZE=1 NAME=marrys STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=不限 <%if rs("marrys") ="不限" then Response.Write "selected"%>>不限</OPTION>
<OPTION VALUE=未婚 <%if rs("marrys") ="未婚" then Response.Write "selected"%>>未婚</OPTION>
<OPTION VALUE=已婚 <%if rs("marrys") ="已婚" then Response.Write "selected"%>>已婚</OPTION>
<OPTION VALUE=离异 <%if rs("marrys") ="离异" then Response.Write "selected"%>>离异</OPTION>
</SELECT></td>
												<td height="40" width="82" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE" align="center"> 
计算机能力：</td>
												<td height="40" width="172" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<SELECT SIZE=1 NAME=computers STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=不限 <%if rs("computers") ="不限" then Response.Write "selected"%>>不限</OPTION>
<OPTION VALUE=一般 <%if rs("computers") ="一般" then Response.Write "selected"%>>一般</OPTION>
<OPTION VALUE=精通 <%if rs("computers") ="精通" then Response.Write "selected"%>>精通</OPTION>
<OPTION VALUE=优秀 <%if rs("computers") ="优秀" then Response.Write "selected"%>>优秀</OPTION>
<OPTION VALUE=良好 <%if rs("computers") ="良好" then Response.Write "selected"%>>良好</OPTION>
<OPTION VALUE=较差 <%if rs("computers") ="较差" then Response.Write "selected"%>>较差</OPTION>
</SELECT></td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">提供食宿：</td>
												<td height="40" width="131" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
<SELECT SIZE=1 NAME=shisus STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=不提供 <%if rs("shisus") ="不提供" then Response.Write "selected"%>>不提供</OPTION>
<OPTION VALUE=提供 <%if rs("shisus") ="提供" then Response.Write "selected"%>>提供</OPTION>
<OPTION VALUE=只提供吃 <%if rs("shisus") ="只提供吃" then Response.Write "selected"%>>只提供吃</OPTION>
<OPTION VALUE=只提供住 <%if rs("shisus") ="只提供住" then Response.Write "selected"%>>只提供住</OPTION> 
</SELECT></td>
												<td height="40" width="82" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE" align="center"> 
												薪金水平：</td>
												<td height="40" width="172" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 
												<input type="text" name="moneys" size="9" style="border-style: solid; border-width: 1px; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" value="<%=rs("moneys")%>">(不填表示面议)</td>
											</tr>
											<tr>
												<td height="40" width="74" align="center" style="border-left: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE">有效期限：</td>
												<td height="40" width="131" style="border: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">  
<SELECT SIZE=1 NAME=youxiaos STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"> 
<OPTION VALUE=长期有效 <%if rs("youxiaos") ="长期有效" then Response.Write "selected"%>>长期有效</OPTION>
<OPTION VALUE=一星期 <%if rs("youxiaos") ="一星期" then Response.Write "selected"%>>一星期</OPTION>
<OPTION VALUE=半个月 <%if rs("youxiaos") ="半个月" then Response.Write "selected"%>>半个月</OPTION>
<OPTION VALUE=一个月 <%if rs("youxiaos") ="一个月" then Response.Write "selected"%>>一个月</OPTION> 
<OPTION VALUE=三个月 <%if rs("youxiaos") ="三个月" then Response.Write "selected"%>>三个月</OPTION>
<OPTION VALUE=半年 <%if rs("youxiaos") ="半年" then Response.Write "selected"%>>半年</OPTION>
<OPTION VALUE=一年 <%if rs("youxiaos") ="一年" then Response.Write "selected"%>>一年</OPTION>
<OPTION VALUE=两年 <%if rs("youxiaos") ="两年" then Response.Write "selected"%>>两年</OPTION> 
<OPTION VALUE=三年 <%if rs("youxiaos") ="三年" then Response.Write "selected"%>>三年</OPTION>
<OPTION VALUE=三年以上 <%if rs("youxiaos") ="三年以上" then Response.Write "selected"%>>三年以上</OPTION>
</SELECT></td>
												<td height="40" width="82" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px" bgcolor="#DFF3DE"> 　</td>
												<td height="40" width="172" style="border-right: 1px solid #C0C0C0; border-top: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px"> 　</td>
											</tr>
											<tr>
												<td height="40" width="490" align="center" colspan="4" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0" bgcolor="#DFF3DE">岗位职责描述及其它要求</td>
											</tr>
											<tr>
												<td height="40" width="490" align="center" colspan="4" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top-width: 1px; border-bottom: 1px solid #C0C0C0"> 
												<TEXTAREA ROWS="8" NAME="zptext" COLS="64" STYLE="border: 1px solid #000000; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; background-color: #FFfFFF"><%=rs("zptext")%></TEXTAREA></td>
											</tr>
											<tr>
												<td height="40" width="520" align="center" colspan="4">
												<input type="submit" value="提交" name="B1"></td>
											</tr>
											</table>
									<input type="hidden" name="id" value="<%=rs("id")%>">
									</form>
									</td>
							</tr>
							</table>
					
</p>
</body>
</html>
<%
rs.close
set rs=nothing
set conn=nothing
%>