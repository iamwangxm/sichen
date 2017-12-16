<%
function UBBCode(strContent)
	set re = New RegExp	
	re.Global = True
	re.IgnoreCase = True

    re.Pattern="(\[IMG\])(.[^\[]*)(\[\/IMG\])"
    strContent=re.Replace(strContent,"<IMG SRC=""$2"" border=0 onload=""javascript:if(this.width>screen.width-333)this.width=screen.width-333""> ")
	
	re.Pattern = "\[url=(.[^\]]*)\](.[^\[]*)\[\/url]"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$2</a>")
	re.Pattern = "\[url](.[^\[]*)\[\/url]"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")
	re.Pattern = "^(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")
	re.Pattern = "(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")
	re.Pattern = "([^>=""])(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
	strContent = re.Replace(strContent,"$1<a target=_blank href=$2>$2</a>")
	re.Pattern = "^(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
	strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")

   

    	re.Pattern="\[HTML](.[^\[]*)\[\/HTML]"
    	strContent=re.Replace(strContent,"<SPAN><IMG src=pic/code.gif align=absBottom> HTML 代码片段如下:<BR><TEXTAREA style=""WIDTH: 94%; BACKGROUND-COLOR: #f7f7f7"" name=textfield rows=10>$1</TEXTAREA><BR><INPUT onclick=runEx() type=button value=运行此代码 name=Button> [Ctrl+A 全部选择   提示:你可先修改部分代码，再按运行]</SPAN><BR>")
    	re.Pattern="\[COLOR=(.[^\]]*)\](.[^\[]*)\[\/COLOR]"
    	strContent=re.Replace(strContent,"<font color=$1>$2</font>")
    	re.Pattern="\[FACE=(.[^\]]*)\](.[^\[]*)\[\/FACE]"
    	strContent=re.Replace(strContent,"<font face=$1>$2</font>")
    	re.Pattern="\[ALIGN=(.[^\]]*)\](.[^\[]*)\[\/ALIGN]"
    	strContent=re.Replace(strContent,"<p align=$1>$2</p>")
    	re.Pattern="\[QUOTE](.[^\[]*)\[\/QUOTE]"
    	strContent=re.Replace(strContent,"<BLOCKQUOTE><b>引用</b>:<HR>$1<HR></BLOCKQUOTE>")
    	re.Pattern="\[FLY](.[^\[]*)\[\/FLY]"
    	strContent=re.Replace(strContent,"<marquee width=90% behavior=alternate scrollamount=3>$1</marquee>")
    	re.Pattern="\[MOVE](.[^\[]*)\[\/MOVE]"
    	strContent=re.Replace(strContent,"<MARQUEE scrollamount=3>$1</marquee>")
    	re.Pattern="\[GLOW=(.[^\]]*),(.[^\]]*),(.[^\]]*)\](.[^\[]*)\[\/GLOW]"
    	strContent=re.Replace(strContent,"<table width=$1 style=""filter:glow(color=$2, strength=$3)"">$4</table>")
    	re.Pattern="\[SHADOW=(.[^\]]*),(.[^\]]*),(.[^\]]*)\](.[^\[]*)\[\/SHADOW]"
    	strContent=re.Replace(strContent,"<table width=$1 style=""filter:shadow(color=$2, strength=$3)"">$4</table>")

	re.Pattern = "\[b](.[^\[]*)\[\/b]"
	strContent = re.Replace(strContent,"<b>$1</b>")
	re.Pattern = "\[I](.[^\[]*)\[\/I]"
	strContent = re.Replace(strContent,"<I>$1</I>")
	re.Pattern = "\[u](.[^\[]*)\[\/u]"
	strContent = re.Replace(strContent,"<U>$1</U>")

    	re.Pattern ="\[size=1](.[^\[]*)\[\/size]"
    	strContent = re.Replace(strContent,"<font size=1>$1</font>")
    	re.Pattern ="\[size=2](.[^\[]*)\[\/size]"
    	strContent = re.Replace(strContent,"<font size=2>$1</font>")
    	re.Pattern ="\[size=3](.[^\[]*)\[\/size]"
    	strContent = re.Replace(strContent,"<font size=3>$1</font>")
    	re.Pattern ="\[size=4](.[^\[]*)\[\/size]"
    	strContent = re.Replace(strContent,"<font size=4>$1</font>")

        re.Pattern="(\[EMAIL\])(.[^\]]*)(\[\/EMAIL\])"
        strContent= re.Replace(strContent,"<A HREF=""mailto:$2"">$2</A>")
        re.Pattern="(\[EMAIL=(.[^\]]*)\])(.[^\]]*)(\[\/EMAIL\])"
        strContent= re.Replace(strContent,"<A HREF=""mailto:$2"" TARGET=_blank>$3</A>")
  
	re.Pattern="(\[FLASH\])(.[^\[]*)(\[\/FLASH\])"
	strContent= re.Replace(strContent,"<OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$2""><PARAM NAME=quality VALUE=high><embed src=""$2"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$2</embed></OBJECT>")
	re.Pattern="(\[FLASH=*([0-9]*),*([0-9]*)\])(.[^\[]*)(\[\/FLASH\])"
	strContent= re.Replace(strContent,"<a href=""$4"" TARGET=_blank style=""color:darkblue"">[全屏欣赏]</a><br><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=$2 height=$3><PARAM NAME=movie VALUE=""$4""><PARAM NAME=quality VALUE=high><embed src=""$4"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=$2 height=$3>$4</embed></OBJECT>")


	UBBCode = strContent
end function
%>