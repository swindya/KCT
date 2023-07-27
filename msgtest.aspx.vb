Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	
    End Sub
    Protected Sub btnClick_Click(ByVal sender As Object, ByVal e As EventArgs)
        'ClientScript.RegisterStartupScript(Me.[GetType](), "myalert", "alert('This alert from code behind');", True)
		msgbox ("OK")
    End Sub

End Class