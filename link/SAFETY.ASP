<%
if (session("FJfkda32KL")<>"fda232LKfd") and  (Request.Cookies("login")<>"yes") then
response.redirect "../admin/login.asp"
response.end
end if
%>