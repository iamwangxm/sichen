
<html>
<head>
<LINK  type="text/css" rel="stylesheet" href="imagen/newdefault.css"/>
<link type="text/css" rel="stylesheet" href="iknow_base.css" />
<link type="text/css" rel="stylesheet" href="home.css" />
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<meta name="keywords" content="˼������,�ҽ���,�Ϻ��ҽ�,�ҽ�,רҵ�ҽ�,�ҽ̼�ְ" />
<meta name="description" content="˼�������ҽ�ϵͳ�ṩ��������רҵ��ʦ����ѧ���ҽ̽�Ա���ϣ�����������ҵ��ҽ̣����Ҽҽ̵���ѡƽ̨" />
<style type="text/css">

#container { margin-left:140; width:950px;}
#sidebar { float:left; width:250px; height:84px;}
#content { float:right; width:678px; height:84px; }/*��Ϊ�ǹ̶���ȣ��������Ҹ�����������Ч����ie 3����bug*/

</style>
<script>
	//��Ϊ��ҳ
function SetHome(obj,url){
    try{
        obj.style.behavior='url(#default#homepage)';
        obj.setHomePage(url);
    }catch(e){
        if(window.netscape){
            try{
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }catch(e){
                alert("��Ǹ���˲�����������ܾ���\n\n�����������ַ�����롰about:config�����س�Ȼ��[signed.applets.codebase_principal_support]����Ϊ'true'");
            }
        }else{
            alert("��Ǹ������ʹ�õ�������޷���ɴ˲�����\n\n����Ҫ�ֶ�����"+url+"������Ϊ��ҳ��");
        }
    }
}
 
	//�ղر�վ
function AddFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            alert("��Ǹ������ʹ�õ�������޷���ɴ˲�����\n\n�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
        }
    }
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" height=25>
	<tr>
	<td background="images/gray_bg.gif"><font color="#990000">��˼���ҽ������Ϻ��׼���ѵļҽ̷���ƽ̨������ҽ̡����ҽ̵���ѡ��վ���ͷ��绰��<b><%=tel%></b> </font></td>
    <td background="images/gray_bg.gif">
    <img src="images/collection_ico1.gif" border="0" align="absmiddle" /> <A href="javascript:void(0);" onclick="SetHome(this,document.domain);">��Ϊ��ҳ</A> &nbsp;&nbsp;<img src="images/collection_ico.gif" border="0" align="absmiddle" />
<A href="javascript:void(0);" onclick="AddFavorite('˼���ҽ�',location.href)">�ղر�վ</A>
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
				<li><a href="index.asp">�� ҳ</a></li>
				<li><a href="grqz2.asp">��Ա��Ϣ</a></li>
				<li><a href="qyzp.asp">ѧԱ��Ϣ</a></li>
				<li><a href="article1.asp">�ҽ�����</a></li>
				<li><a href="article2.asp">�ҽ̼���</a></li>
                <li><a href="guest.asp">���Ա�</a></li>
                <li><a href="register.asp">��Աע��</a></li>
                <li><a href="control.asp">��Ա����</a></li>
                                             
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
