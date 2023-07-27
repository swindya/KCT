<script runat="server">
sub Page_Load
if Not Page.IsPostBack then
 dim mycountries=New Hashtable
 mycountries.Add("N","Norway")
 mycountries.Add("S","Sweden")
 mycountries.Add("F","France")
 mycountries.Add("I","Italy")
 rb.DataSource=mycountries
 rb.DataValueField="Key"
 rb.DataTextField="Value"
 rb.DataBind()
end if
end sub
sub displayMessage(s as Object,e As EventArgs)
lbl1.text="Your favorite country is: " & rb.SelectedItem.Text
end sub
</script>
<html>
<body>
<form id="myfrm" runat="server">

<asp:TreeView ID="TreeView1" runat="server">

<Nodes>

                              <asp:TreeNode Text="My Computer">
                                 <asp:TreeNode Text="Favorites">
                                   <asp:TreeNode Text="News">  
                                       <asp:TreeNode Text="Sports" NavigateUrl="#"/>
                                       <asp:TreeNode Text="Politics" NavigateUrl="#"/>
                                   </asp:TreeNode>
                                   <asp:TreeNode Text="Technology">  
                                      <asp:TreeNode Text="Microsoft" NavigateUrl="#"/>
                                      <asp:TreeNode Text="ASP.NET" NavigateUrl="#"/>
                                      <asp:TreeNode Text="Java" NavigateUrl="#"/>
                                      <asp:TreeNode Text="Python" NavigateUrl="#"/>
                                   </asp:TreeNode>
                                   <asp:TreeNode Text="Shopping">  
                                      <asp:TreeNode Text="Paytm" NavigateUrl="#"/>
                                      <asp:TreeNode Text="Amazon" NavigateUrl="#"/>
                                      <asp:TreeNode Text="FlipKart" NavigateUrl="#"/>
                                  </asp:TreeNode>
                               </asp:TreeNode>
                               <asp:TreeNode Text="Tutorial">
                                 <asp:TreeNode Text="TutorialRide" NavigateUrl="#"/>
                                 <asp:TreeNode Text="Crack English" NavigateUrl="#"/>
                              </asp:TreeNode>
                          </asp:TreeNode>

</Nodes>

</asp:TreeView>


<asp:RadioButtonList id="rb" runat="server"
AutoPostBack="True" onSelectedIndexChanged="displayMessage" />
<p><asp:label id="lbl1" runat="server" /></p>
</form>
</body>
</html>
