<!---->
<div id="imgADPlayer">
</div>
 
<script language="JavaScript" type="text/javascript">
	var focus_width=460    /*»ÃµÆÆ¬ÐÂÎÅÍ¼Æ¬¿í¶È*/
	var focus_height=215   
	var text_height=0    
	var swf_height = focus_height+text_height
 
	var pics = '';
	var links = '';
	var texts = '';
 
	function ati(url, img, title)
	{
		if(pics != '')
		{
			pics = "|" + pics;
			links = "|" + links;
			texts = "|" + texts;
		}
 
		pics = escape(img) + pics;
		links = escape(url) + links;
		texts = title + texts;
	}
                </script>
 
                <script language="JavaScript" type="text/javascript"> 
 
ati('', 'adimages/2010821181559365.jpg', '');
 
ati('', 'adimages/201082118146320.jpg', '');
 
ati('', 'adimages/2010624112534688.jpg', '');
 
ati('', 'adimages/201082303039312.jpg', '');
 
document.write('<embed  src="adimages/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#DADADA" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash"/>');
                </script>
 
<!---->
