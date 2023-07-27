Imports System.IO

Partial Class uploaddoc
  Inherits System.Web.UI.Page

Protected Sub Button1_Click(ByVal sender As Object, _
   ByVal e As System.EventArgs) Handles Button1.Click
   'Untuk validasi agar ukuran file tidak terlalu besar
   '(dalam bytes)
   If Fileupload1.FileBytes.Length > 10000000 Then
       msgbox ("<script LANGUAGE='JavaScript' >alert('File is big')</script>")
       Exit Sub
   End If

   If Fileupload1.HasFile Then
       Dim strFile As String
       strFile = Path.Combine(Server.MapPath("~/KCT/doc/"), Fileupload1.FileName)
       If File.Exists(strFile) Then
           File.Delete(strFile)
       End If
       Fileupload1.SaveAs(strFile)
	    'Response.Write "<script LANGUAGE='JavaScript' >alert('Upload Successful')</script>";
		'msgbox ("<script LANGUAGE='JavaScript' >alert('File sukses')</script>")
		'Display.Caption = "Testing Successful"
		Response.Write("<script type=""text/javascript"">alert(""The file is already closed"");</script")
   End If

End Sub
End Class