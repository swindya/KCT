
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>show alert message in asp.net from code behind</title>
<style>
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<script>
function pesan()
{
	alert("Siyap");
}
</script>
</head>
<body>
<form id="form1" runat="server">
<div>
<asp:Button ID="btnClick" Text="Click" runat="server" onclientclick="btnClick_Click" />
<Button class="button" ID="btnClick1" name="btnClick1" Text="CLOCK" onclick="pesan();">Tombol</tombol>

</div>
</form>
</body>
</html>