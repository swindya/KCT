<%@ Import Namespace="System" %>
<%@ Page Language="VB" %>

<script runat="server">
  Public Function ServerSideFunction(input As Integer) As Integer
    ServerSideFunction = 12 + input
  End Function
</script>

<script language= "vb" type="text/vb" runat="server">
    'Dim FullName As String
</script>

<% Dim a As Integer = 10 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>ASP.NET inline</title>
</head>
<body>
<% =ServerSideFunction(a) %>

<%
	Dim FullName As String
	Const DateOfBirth As Date = #12/5/1974#
    FullName = "Paul Bertrand Yamaguchi"
%>

<%
    Response.Write("<br>Full Name: " & FullName)
	Response.Write("<br>")
	Response.Write(DateOfBirth)
%>
</body>
</html>