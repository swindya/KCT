<%@ Import Namespace="System" %>
<%@ Page Language="VB" %>

<script runat="server">
  Public Function ServerSideFunction(input As String) As String
    ServerSideFunction = "Hello " & input
  End Function
</script>

<% Dim pageVariable As String = "world" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>ASP.NET inline</title>
</head>
<body>
<% =ServerSideFunction(pageVariable) %>
</body>
</html>