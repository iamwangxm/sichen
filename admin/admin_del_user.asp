<!--#include file="../conn.asp"-->
<%
if Request.Cookies("login")<>"yes" then
  response.write "<script language=JavaScript>" & chr(13) & "alert('您还未登陆或者超时,请重登陆！');"&"window.location.href = '../'"&" </script>"
  response.end
end if
if request("ttype")="1" then
  sql="select pic from in_user where id="&clng(request("id"))
  rs.Open sql,conn,1,1
  pic=rs("pic")
  rs.close
  if pic<>"" then
	set objfso=server.createobject("scripting.filesystemobject")
	file=server.mappath("..\")+".\"+pic
	objfso.deletefile file
	set objfso=nothing
  end if
  sql="DELETE FROM endepot WHERE inid="&clng(request("id"))
  conn.execute(sql)
  sql="DELETE FROM indepot WHERE inid="&clng(request("id"))
  conn.execute(sql)
  
  sql="DELETE FROM enorder WHERE inid="&clng(request("id"))
  conn.execute(sql)
  sql="DELETE FROM inorder WHERE inid="&clng(request("id"))
  conn.execute(sql)
  
  sql="DELETE FROM message WHERE tid="&clng(request("id"))&" and ttype='1'"
  conn.execute(sql)
  sql="DELETE FROM message WHERE fid="&clng(request("id"))&" and ftype='1'"
  conn.execute(sql)
  sql="DELETE FROM in_user WHERE id="&clng(request("id"))
  conn.execute(sql)
  set rs=nothing
  set conn=nothing
  response.write "<script language=JavaScript>" & chr(13) & "alert('删除成功,即将返回！');"&"window.location.href = 'admin_inuser.asp'"&" </script>"
end if


if request("ttype")="2" then

  
  sql="DELETE FROM endepot WHERE enid="&clng(request("id"))
  conn.execute(sql)
  sql="DELETE FROM indepot WHERE enid="&clng(request("id"))
  conn.execute(sql)
  
  sql="DELETE FROM enorder WHERE enid="&clng(request("id"))
  conn.execute(sql)
  sql="DELETE FROM inorder WHERE enid="&clng(request("id"))
  conn.execute(sql)
  
  
  sql="DELETE FROM message WHERE tid="&clng(request("id"))&" and ttype='2'"
  conn.execute(sql)
  sql="DELETE FROM message WHERE fid="&clng(request("id"))&" and ftype='2'"
  conn.execute(sql)
  
  sql="DELETE FROM en_user WHERE id="&clng(request("id"))
  conn.execute(sql)
    
  set rs=nothing
  set conn=nothing
  response.write "<script language=JavaScript>" & chr(13) & "alert('删除成功,即将返回！');"&"window.location.href = 'admin_enuser.asp'"&" </script>"
end if
%>