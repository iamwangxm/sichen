
<html>
<head>
<LINK  type="text/css" rel="stylesheet" href="imagen/newdefault.css"/>
<link type="text/css" rel="stylesheet" href="iknow_base.css" />
<link type="text/css" rel="stylesheet" href="home.css" />
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<meta name="keywords" content="思辰教育,家教网,上海家教,家教,专业家教,家教兼职" />
<meta name="description" content="思辰教育家教系统提供大量优秀专业教师，大学生家教教员资料，可助你快速找到家教，是找家教的首选平台" />
<style type="text/css">

#container { margin-left:140; width:950px;}
#sidebar { float:left; width:250px; height:84px;}
#content { float:right; width:678px; height:84px; }/*因为是固定宽度，采用左右浮动方法可有效避免ie 3像素bug*/

</style>
<script>
	//设为首页
function SetHome(obj,url){
    try{
        obj.style.behavior='url(#default#homepage)';
        obj.setHomePage(url);
    }catch(e){
        if(window.netscape){
            try{
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }catch(e){
                alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
            }
        }else{
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
        }
    }
}
 
	//收藏本站
function AddFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" height=25>
	<tr>
	<td background="images/gray_bg.gif"><font color="#990000">【思辰家教网】上海首家免费的家教服务平台，是请家教、做家教的首选网站！客服电话：<b><%=tel%></b> </font></td>
    <td background="images/gray_bg.gif">
    <img src="images/collection_ico1.gif" border="0" align="absmiddle" /> <A href="javascript:void(0);" onclick="SetHome(this,document.domain);">设为首页</A> &nbsp;&nbsp;<img src="images/collection_ico.gif" border="0" align="absmiddle" />
<A href="javascript:void(0);" onclick="AddFavorite('思辰家教',location.href)">收藏本站</A>
    </td>
	</tr>
</table>

<div id="container">
  <div id="sidebar" align="center"><a href="index.asp"><img id="logoimg" src="images/logotop.png" width="150" height="90" ></a></div>
  <div id="content" align="right"><img src="images/topbar.gif" width="516" height="74" border="0" usemap="#Map"></div>
</div>

<TABLE width=950 border=0 align="center" cellPadding=0 cellSpacing=0>
<tr><td>
<div id="menu" class="menu has-sub-menu">
<div class="main-menu" style="clear:both;">
	<div class="outer">
		<div class="inner">
			<ul>
				<li><a href="index.asp">首 页</a></li>
				<li><a href="grqz2.asp">教员信息</a></li>
				<li><a href="qyzp.asp">学员信息</a></li>
				<li><a href="article1.asp">家教新闻</a></li>
				<li><a href="article2.asp">家教技巧</a></li>
                <li><a href="guest.asp">留言本</a></li>
                <li><a href="register.asp">会员注册</a></li>
                <li><a href="control.asp">会员中心</a></li>
                                             
			</ul>
			<span class="total"></span>
		</div>
	</div>
</div>
	<div class="sub-menu">
	<ul>
		<li><!--#include file="login_box.asp"--></li>
	</ul>
</div>
</div>
</div>
</td>
</tr>
</table>
<map name="Map"><area shape="rect" coords="433,7,492,71" href="article1.asp"><area shape="rect" coords="351,7,410,71" href="grqz2.asp"><area shape="rect" coords="26,6,85,70" href="index.asp"><area shape="rect" coords="271,7,330,71" href="reg_dw.asp"><area shape="rect" coords="188,7,247,71" href="qyzp.asp">
  <area shape="rect" coords="107,7,166,71" href="reg_gr.asp">
</map>
