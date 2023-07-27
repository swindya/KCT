<script runat="server">
Sub Page_Load
if Not Page.IsPostBack then
 dim mycountries=New ArrayList
 mycountries.Add("Norway")
 mycountries.Add("Sweden")
 mycountries.Add("France")
 mycountries.Add("Italy")
 mycountries.TrimToSize()
 mycountries.Sort()
 rb.DataSource=mycountries
 rb.DataBind()
end if
end sub
</script>
<html>
<body>
<form runat="server">
<asp:RadioButtonList id="rb" runat="server" />
</form>
</body>
</html>