<%@ Language="VBScript" %>

<%

Option Explicit

Response.Buffer = True

 Dim bCookiesEnabled

   bCookiesEnabled = Request.Cookies("Cookie_test")

   bCookiesEnabled = (bCookiesEnabled = "true")

   Response.Redirect "Cookie.asp" & "?Cookies=" & bCookiesEnabled

%>

