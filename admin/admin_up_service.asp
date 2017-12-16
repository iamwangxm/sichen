<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
sql="select * from service where id="&clng(request("id"))
rs.open sql,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css.css"  type="text/css">
<title>网站公告修改</title>
<base target="_self">
</head>

<body bgcolor="#CAD7F7" style="text-align: center">
<script>
<!--
function checkform(){
if (form1.title.value ==""){
		alert("请输入留言主题！");
		form1.title.focus();
		return;}
if (form1.content.value ==""){
			alert("请输入留言内容！");
			form1.content.focus();
			return;}
	if  (document.form1.content.value.length>1000) {
	alert("您发表的留言大于所规定字数！");
	document.form1.content.focus();
	return}
form1.submit();
}



helpstat = false;
stprompt = true;
basic = false;
function thelp(swtch){
	if (swtch == 1){
		basic = false;
		stprompt = false;
		helpstat = true;
	} else if (swtch == 0) {
		helpstat = false;
		stprompt = false;
		basic = true;
	} else if (swtch == 2) {
		helpstat = false;
		basic = false;
		stprompt = true;
	}
}






function del(ID){
if(confirm('您确定要删除吗？'))
 {
 location.href="user_save.asp?info=guest_del&ID="+ID+""
 }
}
function FormMenu(targ,selObj,restore){ 
eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
if (restore) selObj.selectedIndex=0;
}




function AddText(NewCode) {
document.form1.content.value+=NewCode
}


function email() {
	if (helpstat) {
		alert("Email 标记\n插入 Email 超级链接\n用法1: [email]dgyyjj@126.com[/email]\n用法2: [email=dgyyjj@126.com]网傲[/email]");
	} else if (basic) {
		AddTxt="[email][/email]";
		AddText(AddTxt);
	} else { 
		txt2=prompt("链接显示的文字.\n如果为空，那么将只显示你的 Email 地址",""); 
		if (txt2!=null) {
			txt=prompt("Email 地址.","dgyyjj@126.com");      
			if (txt!=null) {
				if (txt2=="") {
					AddTxt="[email]"+txt+"[/email]";
				} else {
					AddTxt="[email="+txt+"]"+txt2;
					AddText(AddTxt);
					AddTxt="[/email]";
				} 
				AddText(AddTxt);	        
			}
		}
	}
}

function showsize(size) {
	if (helpstat) {
		alert("文字大小标记\n设置文字大小.\n可变范围 1 - 6.\n 1 为最小 6 为最大.\n用法: [size="+size+"]这是 "+size+" 文字[/size]");
	} else if (basic) {
		AddTxt="[size="+size+"][/size]";
		AddText(AddTxt);
	} else {                       
		txt=prompt("大小 "+size,"文字"); 
		if (txt!=null) {             
			AddTxt="[size="+size+"]"+txt;
			AddText(AddTxt);
			AddTxt="[/size]";
			AddText(AddTxt);
		}        
	}
}

function bold() {
	if (helpstat) {
		alert("加粗标记\n使文本加粗.\n用法: [b]这是加粗的文字[/b]");
	} else if (basic) {
		AddTxt="[b][/b]";
		AddText(AddTxt);
	} else {  
		txt=prompt("文字将被变粗.","文字");     
		if (txt!=null) {           
			AddTxt="[b]"+txt;
			AddText(AddTxt);
			AddTxt="[/b]";
			AddText(AddTxt);
		}       
	}
}

function italicize() {
	if (helpstat) {
		alert("斜体标记\n使文本字体变为斜体.\n用法: [i]这是斜体字[/i]");
	} else if (basic) {
		AddTxt="[i][/i]";
		AddText(AddTxt);
	} else {   
		txt=prompt("文字将变斜体","文字");     
		if (txt!=null) {           
			AddTxt="[i]"+txt;
			AddText(AddTxt);
			AddTxt="[/i]";
			AddText(AddTxt);
		}	        
	}
}

function quote() {
	if (helpstat){
		alert("引用标记\n引用一些文字.\n用法: [quote]引用内容[/quote]");
	} else if (basic) {
		AddTxt="[quote][/quote]";
		AddText(AddTxt);
	} else {   
		txt=prompt("被引用的文字","文字");     
		if(txt!=null) {          
			AddTxt="[quote]"+txt;
			AddText(AddTxt);
			AddTxt="[/quote]";
			AddText(AddTxt);
		}	        
	}
}

function showcolor(color) {
	if (helpstat) {
		alert("颜色标记\n设置文本颜色.  任何颜色名都可以被使用.\n用法: [color="+color+"]颜色要改变为"+color+"的文字[/color]");
	} else if (basic) {
		AddTxt="[color="+color+"][/color]";
		AddText(AddTxt);
	} else {  
     	txt=prompt("选择的颜色是: "+color,"文字");
		if(txt!=null) {
			AddTxt="[color="+color+"]"+txt;
			AddText(AddTxt);        
			AddTxt="[/color]";
			AddText(AddTxt);
		} 
	}
}

function center() {
 	if (helpstat) {
		alert("对齐标记\n使用这个标记, 可以使文本左对齐、居中、右对齐.\n用法: [align=center|left|right]要对齐的文本[/align]");
	} else if (basic) {
		AddTxt="[align=center|left|right][/align]";
		AddText(AddTxt);
	} else {  
		txt2=prompt("对齐样式\n输入 'center' 表示居中, 'left' 表示左对齐, 'right' 表示右对齐.","center");               
		while ((txt2!="") && (txt2!="center") && (txt2!="left") && (txt2!="right") && (txt2!=null)) {
			txt2=prompt("错误!\n类型只能输入 'center' 、 'left' 或者 'right'.","");               
		}
		txt=prompt("要对齐的文本","文本");     
		if (txt!=null) {          
			AddTxt="\r[align="+txt2+"]"+txt;
			AddText(AddTxt);
			AddTxt="[/align]";
			AddText(AddTxt);
		}	       
	}
}

function hyperlink() {
	if (helpstat) {
		alert("超级链接标记\n插入一个超级链接标记\n使用方法: [url]http://www.dgyyjj.com[/url]\nUSE: [url=http://www.dgyyjj.com]链接文字[/url]");
	} else if (basic) {
		AddTxt="[url][/url]";
		AddText(AddTxt);
	} else { 
		txt2=prompt("链接文本显示.\n如果不想使用, 可以为空, 将只显示超级链接地址. ",""); 
		if (txt2!=null) {
			txt=prompt("超级链接.","http://");      
			if (txt!=null) {
				if (txt2=="") {
					AddTxt="[url]"+txt;
					AddText(AddTxt);
					AddTxt="[/url]";
					AddText(AddTxt);
				} else {
					AddTxt="[url="+txt+"]"+txt2;
					AddText(AddTxt);
					AddTxt="[/url]";
					AddText(AddTxt);
				}         
			} 
		}
	}
}

function showcode() {
	if (helpstat) {
		alert("代码标记\n使用代码标记，可以使你的程序代码里面的 html 等标志不会被破坏.\n使用方法:\n [code]这里是代码文字[/code]");
	} else if (basic) {
		AddTxt="\r[code]\r[/code]";
		AddText(AddTxt);
	} else {   
		txt=prompt("输入代码","");     
		if (txt!=null) {          
			AddTxt="\r[code]"+txt;
			AddText(AddTxt);
			AddTxt="[/code]";
			AddText(AddTxt);
		}	       
	}
}

function list() {
	if (helpstat) {
		alert("列表标记\n建造一个文字或则数字列表.\n\nUSE: [list] [*]项目一[/*] [*]项目二[/*] [*]项目三[/*] [/list]");
	} else if (basic) {
		AddTxt=" [list][*]  [/*][*]  [/*][*]  [/*][/list]";
		AddText(AddTxt);
	} else {  
		txt=prompt("列表类型\n输入 'A' 表示有序列表, '1' 表示无序列表, 留空表示无序列表.","");               
		while ((txt!="") && (txt!="A") && (txt!="a") && (txt!="1") && (txt!=null)) {
			txt=prompt("错误!\n类型只能输入 'A' 、 '1' 或者留空.","");               
		}
		if (txt!=null) {
			if (txt=="") {
				AddTxt="[list]";
			} else {
				AddTxt="[list="+txt+"]";
			} 
			txt="1";
			while ((txt!="") && (txt!=null)) {
				txt=prompt("列表项\n空白表示结束列表",""); 
				if (txt!="") {             
					AddTxt+="[*]"+txt+"[/*]"; 
				}                   
			} 
			AddTxt+="[/list] ";
			AddText(AddTxt); 
		}
	}
}

function showfont(font) {
 	if (helpstat){
		alert("字体标记\n给文字设置字体.\n用法: [face="+font+"]改变文字字体为"+font+"[/face]");
	} else if (basic) {
		AddTxt="[face="+font+"][/face]";
		AddText(AddTxt);
	} else {                  
		txt=prompt("要设置字体的文字"+font,"文字");
		if (txt!=null) {             
			AddTxt="[face="+font+"]"+txt;
			AddText(AddTxt);
			AddTxt="[/face]";
			AddText(AddTxt);
		}        
	}  
}
function underline() {
  	if (helpstat) {
		alert("下划线标记\n给文字加下划线.\n用法: [u]要加下划线的文字[/u]");
	} else if (basic) {
		AddTxt="[u][/u]";
		AddText(AddTxt);
	} else {  
		txt=prompt("下划线文字.","文字");     
		if (txt!=null) {           
			AddTxt="[u]"+txt;
			AddText(AddTxt);
			AddTxt="[/u]";
			AddText(AddTxt);
		}	        
	}
}
function setfly() {
 	if (helpstat){
		alert("飞翔标记\n使文字飞行.\n用法: [fly]文字为这样文字[/fly]");
	} else if (basic) {
		AddTxt="[fly][/fly]";
		AddText(AddTxt);
	} else {                  
		txt=prompt("飞翔文字","文字");
		if (txt!=null) {             
			AddTxt="[fly]"+txt;
			AddText(AddTxt);
			AddTxt="[/fly]";
			AddText(AddTxt);
		}        
	}  
}

function move() {
	if (helpstat) {
		alert("移动标记\n使文字产生移动效果.\n用法: [move]要产生移动效果的文字[/move]");
	} else if (basic) {
		AddTxt="[move][/move]";
		AddText(AddTxt);
	} else {  
		txt=prompt("要产生移动效果的文字","文字");     
		if (txt!=null) {           
			AddTxt="[move]"+txt;
			AddText(AddTxt);
			AddTxt="[/move]";
			AddText(AddTxt);
		}       
	}
}

function shadow() {
	if (helpstat) {
               alert("阴影标记\n使文字产生阴影效果.\n用法: [SHADOW=宽度, 颜色, 边界]要产生阴影效果的文字[/SHADOW]");
	} else if (basic) {
		AddTxt="[SHADOW=255,blue,1][/SHADOW]";
		AddText(AddTxt);
	} else { 
		txt2=prompt("文字的长度、颜色和边界大小","255,blue,1"); 
		if (txt2!=null) {
			txt=prompt("要产生阴影效果的文字","文字");
			if (txt!=null) {
				if (txt2=="") {
					AddTxt="[SHADOW=255, blue, 1]"+txt;
					AddText(AddTxt);
					AddTxt="[/SHADOW]";
					AddText(AddTxt);
				} else {
					AddTxt="[SHADOW="+txt2+"]"+txt;
					AddText(AddTxt);
					AddTxt="[/SHADOW]";
					AddText(AddTxt);
				}         
			} 
		}
	}
}


function flash() {
	if (helpstat) {
		alert("Flash标记\n插入Flash\n用法： [img]http://ezRick.com/test.swf[/img]");
	} else if (basic) {
		AddTxt="\r[flash][/flash]";
		AddText(AddTxt);
	} else { 
		txt2=prompt("Flash窗口大小（宽度、高度）.\n如果不想使用, 可以为空. ","480,350"); 
		if (txt2!=null) {
			txt=prompt("Flash的URL","http://");      
			if (txt!=null) {
				if (txt2=="") {
					AddTxt="\r[flash]"+txt;
					AddText(AddTxt);
					AddTxt="[/flash]";
					AddText(AddTxt);
				} else {
					AddTxt="\r[flash="+txt2+"]"+txt;
					AddText(AddTxt);
					AddTxt="[/flash]";
					AddText(AddTxt);
				}         
			} 
		}
	}
}




function image() {
	if (helpstat){
		alert("图片标记\n插入图片\n用法： [img]http://www.dgyyjj.com/logo.gif[/img]");
	} else if (basic) {
		AddTxt="[img][/img]";
		AddText(AddTxt);
	} else {  
		txt=prompt("图片的 URL","http://");    
		if(txt!=null) {            
			AddTxt="\r[img]"+txt;
			AddText(AddTxt);
			AddTxt="[/img]";
			AddText(AddTxt);
		}	
	}
}
function glow() {
	if (helpstat) {
		alert("光晕标记\n使文字产生光晕效果.\n用法: [GLOW=宽度, 颜色, 边界]要产生光晕效果的文字[/GLOW]");
	} else if (basic) {
		AddTxt="[glow=255,red,2][/glow]";
		AddText(AddTxt);
	} else { 
		txt2=prompt("文字的长度、颜色和边界大小","255,red,2"); 
		if (txt2!=null) {
			txt=prompt("要产生光晕效果的文字.","文字");      
			if (txt!=null) {
				if (txt2=="") {
					AddTxt="[glow=255,red,2]"+txt;
					AddText(AddTxt);
					AddTxt="[/glow]";
					AddText(AddTxt);
				} else {
					AddTxt="[glow="+txt2+"]"+txt;
					AddText(AddTxt);
					AddTxt="[/glow]";
					AddText(AddTxt);
				}         
			} 
		}
	}
}
//-->
</script>

<form method="POST" name="form1" action="updata_service.asp">
						<p>　</p>
						<p>
                        <a href="admin_up_service.asp?id=1&what=法律申明">法律申明</a>&nbsp;
						<a href="admin_up_service.asp?id=2&what=关于我们">关于我们</a>&nbsp;
						<a href="admin_up_service.asp?id=3&what=资费标准">资费标准</a>&nbsp;
						<a href="admin_up_service.asp?id=4&what=常见问题">常见问题</a>&nbsp;
                        <a href="admin_up_service.asp?id=5&what=VIP与普通教员的差别">VIP与普通教员的差别</a>&nbsp;
                        <a href="admin_up_service.asp?id=6&what=付款方式">付款方式</a>&nbsp;
                        <a href="admin_up_service.asp?id=7&what=价格参考表">价格参考表</a>&nbsp;</p>
						<table border="0" width="605" cellspacing="0" cellpadding="0" height="428">
							<tr>
								<td height="23" background="images/admin_bg_1.gif" width="603" colspan="2" style="border-left: 1px solid #000000; border-right: 1px solid #000000; border-top: 1px solid #000000; border-bottom-width: 1px" align="center">
								<font color="#FFFFFF"><b><%=request("what")%>修改</b></font></td>
							</tr>
          
          <tr bgcolor="#F7F7F7">
            <td height="126" align="center" bgcolor="#F0F0F0" style="border-left: 1px solid #000000; border-right-width: 1px; border-top-width: 1px">
			<p align="center">内容：</td>
            <td align="left" bgcolor="#F0F0F0" style="border-right:1px solid #000000; border-left-width: 1px; border-top-width: 1px; border-bottom-width:1px">

            <textarea name="service" style="display:none" cols="1" rows="1"><%=rs("service")%></textarea>
            <iframe id="myEditor" src="Edit/editor.htm?id=service&ReadCookie=0" frameborder="0" scrolling="no" width="621" height="500"></iframe>
            
            </td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="35" bgcolor="#F0F0F0" width="44" style="border-left: 1px solid #000000; border-right-width: 1px; border-top-width: 1px; border-bottom-width: 1px" align="center">
			时间：</td>
            <td height="35" bgcolor="#F0F0F0" width="560" style="border-right: 1px solid #000000; border-top-width: 1px; border-bottom-width: 1px">
			<input type="radio" value="1" checked name="cht">更新&nbsp;&nbsp;&nbsp; 
			<input type="radio" name="cht" value="0">保留&nbsp;&nbsp;&nbsp;&nbsp; 
			当前历史时间为：<%=rs("chtime")%></td>
          </tr>
							<tr>
            <td height="37" colspan="2" width="603" bgcolor="#F0F0F0" style="border-left: 1px solid #000000; border-right: 1px solid #000000; border-top-width: 1px; border-bottom: 1px solid #000000">
			<p align="center"><input type="submit" value="提交" name="B1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="重置" name="B2"></td>
          					</tr>
						</table>
										<input type="hidden" name="id" value="<%=request("id")%>">
</form>
</body>

					</form>
<%
rs.close
set rs=nothing
set conn=nothing
%>
</html>