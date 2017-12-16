<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
response.end
end if
sql="select * from notice where id=1"
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

<form method="POST" name="form1" action="updata_notice.asp">
						<p>　</p>
						<table border="0" width="605" cellspacing="0" cellpadding="0" height="428">
							<tr>
								<td height="23" background="images/admin_bg_1.gif" width="603" colspan="2" style="border-left: 1px solid #000000; border-right: 1px solid #000000; border-top: 1px solid #000000; border-bottom-width: 1px" align="center">
								<font color="#FFFFFF"><b>网站公告修改</b></font></td>
							</tr>
          <tr bgcolor="#F7F7F7">
            <td height="44" align="center" bgcolor="#F0F0F0" style="border-left: 1px solid #000000; border-right-width: 1px; border-top-width: 1px; border-bottom-width: 1px">　</td>
            <td align="left" bgcolor="#F0F0F0" style="border-left-width: 1px; border-right: 1px solid #000000; border-top-width: 1px; border-bottom-width: 1px">UBB：<img src="../images/editorimages/icon_editor_bold.gif" alt="粗体" width="18" height="18" border="0" onClick=bold() style='cursor:hand'> 
			<img onClick=italicize() src="../images/editorimages/icon_editor_italicize.gif" alt="斜体" border="0" style='cursor:hand'> 
			<img onClick=underline() src="../images/editorimages/icon_editor_underline.gif" alt="下划线" border="0" style='cursor:hand'> 
			<img onClick=center() src="../images/editorimages/icon_editor_center.gif" alt="居中" border="0" style='cursor:hand'> 
			<img src="../images/editorimages/icon_editor_image.gif" alt="插入图片" border="0" onClick=image() width="18" height="18" style='cursor:hand'> 
			<img onClick=hyperlink() src="../images/editorimages/icon_editor_url.gif" alt="超级连接" border="0" style='cursor:hand'> 
			<img onClick=email() src="../images/editorimages/icon_editor_email.gif" alt="Email连接" border="0" style='cursor:hand'> 
			<img onClick=quote() src="../images/editorimages/icon_editor_quote.gif" alt="引用" border="0" style='cursor:hand'> 
			<img onClick=list() src="../images/editorimages/icon_editor_list.gif" alt="目录" border="0" style='cursor:hand'> 
			<img onClick=setfly() alt=飞行字 src="../images/editorimages/fly.gif" border=0 style='cursor:hand'> 
			<img onClick=move() alt=移动字 src="../images/editorimages/move.gif" border=0 style='cursor:hand'> 
			<img onClick=glow() alt=发光字 src="../images/editorimages/glow.gif" border=0 style='cursor:hand'> 
			<img onClick=shadow() alt=阴影字 src="../images/editorimages/shadow.gif" border=0 style='cursor:hand'> <br>
			字体:<select onChange=showfont(this.options[this.selectedIndex].value) name=font>
    <option value="宋体" selected>宋体</option>
    <option value="楷体_GB2312">楷体</option>
    <option value="新宋体">新宋体</option>
    <option value="黑体">黑体</option>
    <option value="隶书">隶书</option>
    <option value="Andale Mono">Andale Mono</option>
    <option value=Arial>Arial</option>
    <option value="Arial Black">Arial Black</option>
    <option value="Book Antiqua">Book Antiqua</option>
    <option value="Century Gothic">Century Gothic</option>
    <option value="Comic Sans MS">Comic Sans MS</option>
    <option value="Courier New">Courier New</option>
    <option value=Georgia>Georgia</option>
    <option value=Impact>Impact</option>
    <option value=Tahoma>Tahoma</option>
    <option value="Times New Roman" >Times New Roman</option>
    <option value="Trebuchet MS">Trebuchet MS</option>
    <option value="Script MT Bold">Script MT Bold</option>
    <option value=Stencil>Stencil</option>
    <option value=Verdana>Verdana</option>
    <option value="Lucida Console">Lucida Console</option>
  </select>字体大小:<select name="size" onChange="showsize(this.options[this.selectedIndex].value)">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3" selected>3</option>
  <option value="4">4</option>
</select><font face="宋体" color=#333333>颜色</font><font color=#333333>:</font><select onChange=showcolor(this.options[this.selectedIndex].value) name=color>
  <option style="background-color:#F0F8FF;color: #F0F8FF" value="#F0F8FF">
	#F0F8FF</option>
  <option style="background-color:#FAEBD7;color: #FAEBD7" value="#FAEBD7">
	#FAEBD7</option>
  <option style="background-color:#00FFFF;color: #00FFFF" value="#00FFFF">
	#00FFFF</option>
  <option style="background-color:#7FFFD4;color: #7FFFD4" value="#7FFFD4">
	#7FFFD4</option>
  <option style="background-color:#F0FFFF;color: #F0FFFF" value="#F0FFFF">
	#F0FFFF</option>
  <option style="background-color:#F5F5DC;color: #F5F5DC" value="#F5F5DC">
	#F5F5DC</option>
  <option style="background-color:#FFE4C4;color: #FFE4C4" value="#FFE4C4">
	#FFE4C4</option>
  <option value="#000000" selected style="background-color:#000000;color: #000000">
	#000000</option>
  <option style="background-color:#FFEBCD;color: #FFEBCD" value="#FFEBCD">
	#FFEBCD</option>
  <option style="background-color:#0000FF;color: #0000FF" value="#0000FF">
	#0000FF</option>
  <option style="background-color:#8A2BE2;color: #8A2BE2" value="#8A2BE2">
	#8A2BE2</option>
  <option style="background-color:#A52A2A;color: #A52A2A" value="#A52A2A">
	#A52A2A</option>
  <option style="background-color:#DEB887;color: #DEB887" value="#DEB887">
	#DEB887</option>
  <option style="background-color:#5F9EA0;color: #5F9EA0" value="#5F9EA0">
	#5F9EA0</option>
  <option style="background-color:#7FFF00;color: #7FFF00" value="#7FFF00">
	#7FFF00</option>
  <option style="background-color:#D2691E;color: #D2691E" value="#D2691E">
	#D2691E</option>
  <option style="background-color:#FF7F50;color: #FF7F50" value="#FF7F50">
	#FF7F50</option>
  <option style="background-color:#6495ED;color: #6495ED" value="#6495ED">
	#6495ED</option>
  <option style="background-color:#FFF8DC;color: #FFF8DC" value="#FFF8DC">
	#FFF8DC</option>
  <option style="background-color:#DC143C;color: #DC143C" value="#DC143C">
	#DC143C</option>
  <option style="background-color:#00FFFF;color: #00FFFF" value="#00FFFF">
	#00FFFF</option>
  <option style="background-color:#00008B;color: #00008B" value="#00008B">
	#00008B</option>
  <option style="background-color:#008B8B;color: #008B8B" value="#008B8B">
	#008B8B</option>
  <option style="background-color:#B8860B;color: #B8860B" value="#B8860B">
	#B8860B</option>
  <option style="background-color:#A9A9A9;color: #A9A9A9" value="#A9A9A9">
	#A9A9A9</option>
  <option style="background-color:#006400;color: #006400" value="#006400">
	#006400</option>
  <option style="background-color:#BDB76B;color: #BDB76B" value="#BDB76B">
	#BDB76B</option>
  <option style="background-color:#8B008B;color: #8B008B" value="#8B008B">
	#8B008B</option>
  <option style="background-color:#556B2F;color: #556B2F" value="#556B2F">
	#556B2F</option>
  <option style="background-color:#FF8C00;color: #FF8C00" value="#FF8C00">
	#FF8C00</option>
  <option style="background-color:#9932CC;color: #9932CC" value="#9932CC">
	#9932CC</option>
  <option style="background-color:#8B0000;color: #8B0000" value="#8B0000">
	#8B0000</option>
  <option style="background-color:#E9967A;color: #E9967A" value="#E9967A">
	#E9967A</option>
  <option style="background-color:#8FBC8F;color: #8FBC8F" value="#8FBC8F">
	#8FBC8F</option>
  <option style="background-color:#483D8B;color: #483D8B" value="#483D8B">
	#483D8B</option>
  <option style="background-color:#2F4F4F;color: #2F4F4F" value="#2F4F4F">
	#2F4F4F</option>
  <option style="background-color:#00CED1;color: #00CED1" value="#00CED1">
	#00CED1</option>
  <option style="background-color:#9400D3;color: #9400D3" value="#9400D3">
	#9400D3</option>
  <option style="background-color:#FF1493;color: #FF1493" value="#FF1493">
	#FF1493</option>
  <option style="background-color:#00BFFF;color: #00BFFF" value="#00BFFF">
	#00BFFF</option>
  <option style="background-color:#696969;color: #696969" value="#696969">
	#696969</option>
  <option style="background-color:#1E90FF;color: #1E90FF" value="#1E90FF">
	#1E90FF</option>
  <option style="background-color:#B22222;color: #B22222" value="#B22222">
	#B22222</option>
  <option style="background-color:#FFFAF0;color: #FFFAF0" value="#FFFAF0">
	#FFFAF0</option>
  <option style="background-color:#228B22;color: #228B22" value="#228B22">
	#228B22</option>
  <option style="background-color:#FF00FF;color: #FF00FF" value="#FF00FF">
	#FF00FF</option>
  <option style="background-color:#DCDCDC;color: #DCDCDC" value="#DCDCDC">
	#DCDCDC</option>
  <option style="background-color:#F8F8FF;color: #F8F8FF" value="#F8F8FF">
	#F8F8FF</option>
  <option style="background-color:#FFD700;color: #FFD700" value="#FFD700">
	#FFD700</option>
  <option style="background-color:#DAA520;color: #DAA520" value="#DAA520">
	#DAA520</option>
  <option style="background-color:#808080;color: #808080" value="#808080">
	#808080</option>
  <option style="background-color:#008000;color: #008000" value="#008000">
	#008000</option>
  <option style="background-color:#ADFF2F;color: #ADFF2F" value="#ADFF2F">
	#ADFF2F</option>
  <option style="background-color:#F0FFF0;color: #F0FFF0" value="#F0FFF0">
	#F0FFF0</option>
  <option style="background-color:#FF69B4;color: #FF69B4" value="#FF69B4">
	#FF69B4</option>
  <option style="background-color:#CD5C5C;color: #CD5C5C" value="#CD5C5C">
	#CD5C5C</option>
  <option style="background-color:#4B0082;color: #4B0082" value="#4B0082">
	#4B0082</option>
  <option style="background-color:#FFFFF0;color: #FFFFF0" value="#FFFFF0">
	#FFFFF0</option>
  <option style="background-color:#F0E68C;color: #F0E68C" value="#F0E68C">
	#F0E68C</option>
  <option style="background-color:#E6E6FA;color: #E6E6FA" value="#E6E6FA">
	#E6E6FA</option>
  <option style="background-color:#FFF0F5;color: #FFF0F5" value="#FFF0F5">
	#FFF0F5</option>
  <option style="background-color:#7CFC00;color: #7CFC00" value="#7CFC00">
	#7CFC00</option>
  <option style="background-color:#FFFACD;color: #FFFACD" value="#FFFACD">
	#FFFACD</option>
  <option style="background-color:#ADD8E6;color: #ADD8E6" value="#ADD8E6">
	#ADD8E6</option>
  <option style="background-color:#F08080;color: #F08080" value="#F08080">
	#F08080</option>
  <option style="background-color:#E0FFFF;color: #E0FFFF" value="#E0FFFF">
	#E0FFFF</option>
  <option style="background-color:#FAFAD2;color: #FAFAD2" value="#FAFAD2">
	#FAFAD2</option>
  <option style="background-color:#90EE90;color: #90EE90" value="#90EE90">
	#90EE90</option>
  <option style="background-color:#D3D3D3;color: #D3D3D3" value="#D3D3D3">
	#D3D3D3</option>
  <option style="background-color:#FFB6C1;color: #FFB6C1" value="#FFB6C1">
	#FFB6C1</option>
  <option style="background-color:#FFA07A;color: #FFA07A" value="#FFA07A">
	#FFA07A</option>
  <option style="background-color:#20B2AA;color: #20B2AA" value="#20B2AA">
	#20B2AA</option>
  <option style="background-color:#87CEFA;color: #87CEFA" value="#87CEFA">
	#87CEFA</option>
  <option style="background-color:#778899;color: #778899" value="#778899">
	#778899</option>
  <option style="background-color:#B0C4DE;color: #B0C4DE" value="#B0C4DE">
	#B0C4DE</option>
  <option style="background-color:#FFFFE0;color: #FFFFE0" value="#FFFFE0">
	#FFFFE0</option>
  <option style="background-color:#00FF00;color: #00FF00" value="#00FF00">
	#00FF00</option>
  <option style="background-color:#32CD32;color: #32CD32" value="#32CD32">
	#32CD32</option>
  <option style="background-color:#FAF0E6;color: #FAF0E6" value="#FAF0E6">
	#FAF0E6</option>
  <option style="background-color:#FF00FF;color: #FF00FF" value="#FF00FF">
	#FF00FF</option>
  <option style="background-color:#800000;color: #800000" value="#800000">
	#800000</option>
  <option style="background-color:#66CDAA;color: #66CDAA" value="#66CDAA">
	#66CDAA</option>
  <option style="background-color:#0000CD;color: #0000CD" value="#0000CD">
	#0000CD</option>
  <option style="background-color:#BA55D3;color: #BA55D3" value="#BA55D3">
	#BA55D3</option>
  <option style="background-color:#9370DB;color: #9370DB" value="#9370DB">
	#9370DB</option>
  <option style="background-color:#3CB371;color: #3CB371" value="#3CB371">
	#3CB371</option>
  <option style="background-color:#7B68EE;color: #7B68EE" value="#7B68EE">
	#7B68EE</option>
  <option style="background-color:#00FA9A;color: #00FA9A" value="#00FA9A">
	#00FA9A</option>
  <option style="background-color:#48D1CC;color: #48D1CC" value="#48D1CC">
	#48D1CC</option>
  <option style="background-color:#C71585;color: #C71585" value="#C71585">
	#C71585</option>
  <option style="background-color:#191970;color: #191970" value="#191970">
	#191970</option>
  <option style="background-color:#F5FFFA;color: #F5FFFA" value="#F5FFFA">
	#F5FFFA</option>
  <option style="background-color:#FFE4E1;color: #FFE4E1" value="#FFE4E1">
	#FFE4E1</option>
  <option style="background-color:#FFE4B5;color: #FFE4B5" value="#FFE4B5">
	#FFE4B5</option>
  <option style="background-color:#FFDEAD;color: #FFDEAD" value="#FFDEAD">
	#FFDEAD</option>
  <option style="background-color:#000080;color: #000080" value="#000080">
	#000080</option>
  <option style="background-color:#FDF5E6;color: #FDF5E6" value="#FDF5E6">
	#FDF5E6</option>
  <option style="background-color:#808000;color: #808000" value="#808000">
	#808000</option>
  <option style="background-color:#6B8E23;color: #6B8E23" value="#6B8E23">
	#6B8E23</option>
  <option style="background-color:#FFA500;color: #FFA500" value="#FFA500">
	#FFA500</option>
  <option style="background-color:#FF4500;color: #FF4500" value="#FF4500">
	#FF4500</option>
  <option style="background-color:#DA70D6;color: #DA70D6" value="#DA70D6">
	#DA70D6</option>
  <option style="background-color:#EEE8AA;color: #EEE8AA" value="#EEE8AA">
	#EEE8AA</option>
  <option style="background-color:#98FB98;color: #98FB98" value="#98FB98">
	#98FB98</option>
  <option style="background-color:#AFEEEE;color: #AFEEEE" value="#AFEEEE">
	#AFEEEE</option>
  <option style="background-color:#DB7093;color: #DB7093" value="#DB7093">
	#DB7093</option>
  <option style="background-color:#FFEFD5;color: #FFEFD5" value="#FFEFD5">
	#FFEFD5</option>
  <option style="background-color:#FFDAB9;color: #FFDAB9" value="#FFDAB9">
	#FFDAB9</option>
  <option style="background-color:#CD853F;color: #CD853F" value="#CD853F">
	#CD853F</option>
  <option style="background-color:#FFC0CB;color: #FFC0CB" value="#FFC0CB">
	#FFC0CB</option>
  <option style="background-color:#DDA0DD;color: #DDA0DD" value="#DDA0DD">
	#DDA0DD</option>
  <option style="background-color:#B0E0E6;color: #B0E0E6" value="#B0E0E6">
	#B0E0E6</option>
  <option style="background-color:#800080;color: #800080" value="#800080">
	#800080</option>
  <option style="background-color:#FF0000;color: #FF0000" value="#FF0000">
	#FF0000</option>
  <option style="background-color:#BC8F8F;color: #BC8F8F" value="#BC8F8F">
	#BC8F8F</option>
  <option style="background-color:#4169E1;color: #4169E1" value="#4169E1">
	#4169E1</option>
  <option style="background-color:#8B4513;color: #8B4513" value="#8B4513">
	#8B4513</option>
  <option style="background-color:#FA8072;color: #FA8072" value="#FA8072">
	#FA8072</option>
  <option style="background-color:#F4A460;color: #F4A460" value="#F4A460">
	#F4A460</option>
  <option style="background-color:#2E8B57;color: #2E8B57" value="#2E8B57">
	#2E8B57</option>
  <option style="background-color:#FFF5EE;color: #FFF5EE" value="#FFF5EE">
	#FFF5EE</option>
  <option style="background-color:#A0522D;color: #A0522D" value="#A0522D">
	#A0522D</option>
  <option style="background-color:#C0C0C0;color: #C0C0C0" value="#C0C0C0">
	#C0C0C0</option>
  <option style="background-color:#87CEEB;color: #87CEEB" value="#87CEEB">
	#87CEEB</option>
  <option style="background-color:#6A5ACD;color: #6A5ACD" value="#6A5ACD">
	#6A5ACD</option>
  <option style="background-color:#708090;color: #708090" value="#708090">
	#708090</option>
  <option style="background-color:#FFFAFA;color: #FFFAFA" value="#FFFAFA">
	#FFFAFA</option>
  <option style="background-color:#00FF7F;color: #00FF7F" value="#00FF7F">
	#00FF7F</option>
  <option style="background-color:#4682B4;color: #4682B4" value="#4682B4">
	#4682B4</option>
  <option style="background-color:#D2B48C;color: #D2B48C" value="#D2B48C">
	#D2B48C</option>
  <option style="background-color:#008080;color: #008080" value="#008080">
	#008080</option>
  <option style="background-color:#D8BFD8;color: #D8BFD8" value="#D8BFD8">
	#D8BFD8</option>
  <option style="background-color:#FF6347;color: #FF6347" value="#FF6347">
	#FF6347</option>
  <option style="background-color:#40E0D0;color: #40E0D0" value="#40E0D0">
	#40E0D0</option>
  <option style="background-color:#EE82EE;color: #EE82EE" value="#EE82EE">
	#EE82EE</option>
  <option style="background-color:#F5DEB3;color: #F5DEB3" value="#F5DEB3">
	#F5DEB3</option>
  <option style="background-color:#FFFFFF;color: #FFFFFF" value="#FFFFFF">
	#FFFFFF</option>
  <option style="background-color:#F5F5F5;color: #F5F5F5" value="#F5F5F5">
	#F5F5F5</option>
  <option style="background-color:#FFFF00;color: #FFFF00" value="#FFFF00">
	#FFFF00</option>
  <option style="background-color:#9ACD32;color: #9ACD32" value="#9ACD32">
	#9ACD32</option>
</select></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="126" align="center" bgcolor="#F0F0F0" style="border-left: 1px solid #000000; border-right-width: 1px; border-top-width: 1px">
			<p align="center">内容：</td>
            <td align="left" bgcolor="#F0F0F0" style="border-right:1px solid #000000; border-left-width: 1px; border-top-width: 1px; border-bottom-width:1px">
			<textarea name="notice" cols="75" rows="25" id="content"><%=rs("notice")%></textarea></td>
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