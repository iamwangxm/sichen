

<!--#include file="conn.asp"-->
<!--#include file="info.asp"-->
<!--#include file="unhtml.asp"-->

<!--#include file="art1_box.asp"-->

<title> <%=webname%></title>
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
		new Option('<%=trim(rs_s1("shiName"))%>','<%=trim(rs_s1("id"))%>'));
<%		else
%>
		new Option('<%=trim(rs_s1("shiName"))%>','<%=trim(rs_s1("id"))%>'),
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
		with (document.form100){
			if(city.value) {
				town.options.length=0;
				for(var i=0;i<selects[city.value].length;i++){
					town.add(selects[city.value][i]);
				}
			}
		}
	}
</script>


<!--#include file="top.asp"-->


<table border="0" width="950" cellspacing="0" cellpadding="0" id="table1" align="center">
<tr>
       <td valign="top" width="213" >
              <!--会员注册-->
              <div >
                  <b class="tl"></b><b class="tr"></b>
                  <div class="outer">
                      <div class="inner">
                      <img src="images/jjtel.gif" > 
                      <a href="reg_gr.asp"><img src="images/qjj.jpg"></a>
                      <a href="reg_dw.asp"><img src="images/zjj.jpg"></a>
                    
                      </div>
                  </div>
                  <b class="bl"></b><b class="br"></b>
              </div>
       </td>
       <td width="2"></td>
       <td valign="top" width="228">
          <!--#include file="kmflsearch_box.asp"-->       </td>
       <td width="1"></td>
       <td valign="top" width="247">
          <!--#include file="qyflsearch_box.asp"-->       </td>
       <td width="2"></td>
       <td valign="top" width="257">
               <!--搜索框-->
              <div class="rc-block2 voting-q ">
                  <b class="tl"></b><b class="tr"></b>
                  <div class="outer">
                      <div class="inner">
                          <div class="hd"><h3><a href="" target="_blank">会员搜索</a></h3>
                          </div>
                          <div class="bd"><!--#include file="search_box.asp"--></div>
                      </div>
                  </div>
                  <b class="bl"></b><b class="br"></b>
              </div>  
    </td>
</tr>


<tr>
<td colspan="7" height="90"><img src="adimages/indexbar.gif" width="950"  style="margin-bottom:10"></td>
</tr>


<tr>
        <td colspan="7">
                 <table width="100%" border="0" cellpadding="0" cellspacing="0">
                   <tr>
                         <td width="708"  valign="top">
                                <!--教员-->
                                <div class="rc-block2 voting-q">
                                    <b class="tl"></b><b class="tr"></b>
                                    <div class="outer">
                                        <div class="inner">
                                            <div class="hd"><h3><a href="" target="_blank">专业教师教员</a></h3><a href="grqz2.asp" class="more" target="_blank">更多</a>
                                            </div>
                                            <div class="bd"><!--#include file="new_zy1.asp"-->
                                            </div>
                                        </div>
                                    </div>
                                    <b class="bl"></b><b class="br"></b>
                                </div>
                         </td>
                         <td width="5" rowspan="3">
                         </td>
                         <td rowspan="3" valign="top">
                         
                                        <!--XXX --> 
                                        
                                        <div class="rc-block2 voting-q">
                                            <div class="outer">
                                                <div class="inner">


                                                    <img src="adimages/ad1.jpg" width="100%" height="240" />

                                                </div>
                                            </div>
                                        </div> 
                                                                 
                                        <!--XXX -->     
                                      <div class="rc-block2 voting-q">
                                            <b class="tl"></b><b class="tr"></b>
                                            <div class="outer">
                                                <div class="inner">
                                                    <div class="hd"><h3>推荐教员</h3><a href="" class="more" target="_blank"></a>
                                                    </div>
                                                    <div class="bd" style="margin-left:15">

                                                      <!--#include file="xjjy.asp"-->  

                                                    </div>
                                                </div>
                                            </div>
                                            <b class="bl"></b><b class="br"></b>
                                        </div>  

                                        <!--XXX -->     
                                        <div class="rc-block2 voting-q">
                                            <b class="tl"></b><b class="tr"></b>
                                            <div class="outer">
                                                <div class="inner">
                                                    <div class="hd"><h3>家教新闻</h3><a href="article1.asp" class="more" target="_blank">更多</a>
                                                    </div>
                                                  <ul style="margin-left:15">
                                                      <%call showart_list(1,12)%>
                                                  </ul>
                                              </div>
                                            </div>
                                            <b class="bl"></b><b class="br"></b>
                                        </div>  

                                        <!--XXX -->     
                                        <div class="rc-block2 voting-q">
                                            <b class="tl"></b><b class="tr"></b>
                                            <div class="outer">
                                                <div class="inner">
                                                    <div class="hd"><h3>家教技巧</h3><a href="article2.asp" class="more" target="_blank">更多</a>
                                                    </div>
                                                    <ul style="margin-left:15">
                                                      <%call showart_list(2,12)%>
                                                   </ul>
                                                </div>
                                            </div>
                                            <b class="bl"></b><b class="br"></b>
                                        </div>  
                                        
                                        
 

   
                         </td>
                   </tr>
                   <tr>
                           <td width="708"  valign="top">
                                    <!--在校大学生教员 -->  <br/><br/>
                                    <div class="rc-block2 voting-q">
                                        <b class="tl"></b><b class="tr"></b>
                                        <div class="outer">
                                            <div class="inner">
                                                <div class="hd"><h3><a href="" target="_blank">在校大学生教员</a></h3><a href="grqz2.asp" class="more" target="_blank">更多</a>
                                                </div>
                                                <div class="bd"><!--#include file="new_zy.asp"-->
                                                </div>
                                            </div>
                                        </div>
                                        <b class="bl"></b><b class="br"></b>
                                    </div>
                           </td>
                   </tr>
                   <tr>
                     <td  valign="top">
                                    <!--学员 -->  <br/><br/>
                                    <div class="rc-block2 voting-q">
                                        <b class="tl"></b><b class="tr"></b>
                                        <div class="outer">
                                            <div class="inner">
                                                <div class="hd"><h3><a href="" target="_blank">最新学员信息</a></h3><a href="qyzp.asp" class="more" target="_blank">更多</a>
                                                </div>
                                                <div class="bd"><!--#include file="new_xy.asp"-->
                                                </div>
                                            </div>
                                        </div>
                                        <b class="bl"></b><b class="br"></b>
                                    </div>
                     </td>
                   </tr>  
                   
                 </table>
        </td>
</tr>
</table>

<table border="0" width="950" cellspacing="0" cellpadding="0"  align="center">
<tr>
  <td valign="top" >
       <!--#include file="link_box.asp"-->
  </td>
</tr>
<tr>
  <td valign="top"  height="2">
  </td>
</tr>

</table>
       

<!--#include file="article_index.asp"-->


<%
set rs2=nothing
set rs=nothing
set conn=nothing
%>
<!--#include file="base.asp"-->