<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="uploaddoc.aspx.vb" Inherits="uploaddoc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	
<script runat="server">
'Sub submit(Source As Object, e As EventArgs)
'button2.Text="You clicked me!"
'End Sub
</script>


<%
'lbl1.Text="The date and time is " & now()
'lbl2.Text="The datetime is " & now()
%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>

    <form id="form1" runat="server">
    <div>
        Upload Document:<br />
        <br />
		<asp:fileupload ID="Fileupload1" runat="server"></asp:fileupload>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclientclick="return confirm('Are you sure you want to Proceed ?');" Text="Upload" />
    </div>
	<div>
	<h3><asp:label id="lbl1" runat="server" /></h3>
	</div>
	<div>
	<h3><asp:label id="lbl2" runat="server" /></h3>
	</div>
	<div>
	<h3><asp:label id="lbl3" runat="server" /></h3>
	</div>
    </form>

</body>
</html>