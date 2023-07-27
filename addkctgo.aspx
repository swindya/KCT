
<%@ Page Language="VB" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.OleDb" %> 
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Configuration" %>
 
<script runat="server">

</script>

<%
    'Inherits System.Windows.Forms.Form
    'Create ADO.NET objects.
    Dim myConn As SqlConnection
    Dim myCmd As SqlCommand
	Dim myCmdi As SqlCommand
    Dim myReader As SqlDataReader
    'results As String
	Dim a, aaa, jmla, jmldata as integer
	Dim npp0 as string = ""
	Dim nama0 as string = ""
	Dim posisi0 as String = ""
	Dim statusposisi0 as String = ""
	Dim jenisoutlet0 as String = ""
	Dim outlet0 as String = ""
	Dim nosk0 as String = ""
	Dim tgl0 as String = ""
	Dim tglend0 as String = ""
	Dim ket0 as String = ""
	Dim namafile0 as String = ""
	Dim ttdfile0 as String = ""

	'Dim pageno as Integer = 1
	Dim pageno as String
	Dim jmlpage as Integer = 1
	Dim pagerows as Integer = 20
	Dim rowsperpage as Integer = 20
	Dim hal as Integer = 1
	Dim b as Single = 0
	Dim c as Integer = 0
	Dim idx as Integer = 0
	Dim itop as Integer = 1
	Dim ii as Integer = 0
	Dim k as Integer
	Dim userid as Integer = 0
	Dim namauserx as String = ""
	Dim prenamafile as String = ""
	Dim namatemp as String = ""
	Dim jenisoutlet as String = ""
	Dim filePath as String = ""
	Dim namafileku as String = ""
	Dim statuspos as Integer = 0

	Dim SQL0 As String
	Dim SQL1 As String
	Dim SQL2 As String
	Dim SQLjo As String
	Dim idw(100) as String
	
	Dim statuskc as Integer = 0
	Dim statuskcp as Integer = 0

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)
'Dim iDate As String = "05/05/2005"
'Dim oDate As DateTime = Convert.ToDateTime(iDate)
'MsgBox(oDate.Day & " " & oDate.Month & "  " & oDate.Year)


'Session

	userid = Session("userid")
	namauserx = Session("namauser")

'Response.Write(userid & "---" & namauserx)

	aaa=1
	
	If NOT Request.Form("barunpp") is nothing Then
		npp0 = Request.Form("barunpp")
	End If

	If NOT Request.Form("barunama") is nothing Then
		nama0 = Request.Form("barunama")
	End If
	
	If NOT Request.Form("baruposisi") is nothing Then
		posisi0 = Request.Form("baruposisi")
	End If
	
	If NOT Request.Form("barustatusposisi") is nothing Then
		statusposisi0 = Request.Form("barustatusposisi")
	End If
	
	If NOT Request.Form("baruoutlet") is nothing Then
		outlet0 = Request.Form("baruoutlet")
	End If
	
	If NOT Request.Form("barunosk") is nothing Then
		nosk0 = Request.Form("barunosk")
	End If
	
	If NOT Request.Form("barutglefektif") is nothing Then
		tgl0 = Request.Form("barutglefektif")
		if tgl0.length() > 5 Then
			Dim tglarr(3) as String 
			tglarr = tgl0.Split("-")
			tgl0 = tglarr(2) & "-" & tglarr(1) & "-" & tglarr(0)		
		End If
	End If

	
	If NOT Request.Form("barutglend") is nothing Then
		tglend0 = Request.Form("barutglend")
		If tglend0.length() > 5 Then
			Dim tglearr(3) as String 
			tglearr = tglend0.Split("-")
			tglend0 = tglearr(2) & "-" & tglearr(1) & "-" & tglearr(0)		
		End If
	End If

	
	If NOT Request.Form("baruket") is nothing Then
		ket0 = Request.Form("baruket")
	End If
	
	If NOT Request.Form("ttdfile") is nothing Then
		ttdfile0 = Request.Form("ttdfile")
	End If


'Waktu -> prefix namafile
	Dim s As String = DateTime.Now.ToString("yyyyMMdd")
	s = s & Hour(Now) & Minute(Now) & Second(Now)
	namatemp = nama0.ToLower()
	namatemp = namatemp.Replace(" ", "")
	prenamafile = namatemp.Substring(0, 4) & s

	Dim folderPath As String = Server.MapPath("~/KCT/DOC/TTD/")
     'Check whether Directory (Folder) exists.

	'If(Not System.IO.Directory.Exists(folderPath)) Then
		'System.IO.Directory.CreateDirectory(folderPath)
	'End If

	if ttdfile0.Length() > 4 Then
		namafileku = ttdfile0
	End if

    'Save the File to the Directory (Folder).
	Dim exten As String = ""
	Dim postedFile As HttpPostedFile = Request.Files("uploadImage1")
    'Check if File is available.
	If postedFile IsNot Nothing And postedFile.ContentLength > 0 Then
        'Save the File.
        'Dim filePath1 As String = Server.MapPath("~/DOC/TTD/") & Path.GetFileName(postedFile.FileName)
		
		Dim filePath1 As String = Server.MapPath("~/KCT/DOC/TTD/") + postedFile.FileName
		exten = System.IO.Path.GetExtension(postedFile.FileName)
		namafile0 = Server.MapPath("~/KCT/DOC/TTD/") + prenamafile + exten
        postedFile.SaveAs(namafile0)
		namafileku = prenamafile + exten
'Response.Write("--------------------------------" & namafileku)
    End If
	

	
	
	

	'If uploadImage1.HasFile Then
    '    Dim extension As String = System.IO.Path.GetExtension(uploadImage1.PostedFile.FileName)
	'	namafile0 = prenamafile & extension
    '    fuUpload.SaveAs(folderPath & namafile0)
    'End If
	


Response.Write (namafile0)

    Try
        If (aaa=1)
		
			'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
%>

<!--#include file="koneksi.aspx"-->

<%
			myCmd = myConn.CreateCommand

'** Cari id dari branch/KC
			SQLjo = "SELECT br_id FROM branch WHERE (br_nama='" & outlet0 & "')"
			myCmd.CommandText = SQLjo
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			
			a = 0
			statuskc = 0
            If myReader.HasRows Then
                While myReader.Read()
					statuskc = 1
				End While
			End If
			myConn.Close()
			
'** Cari id dari Capem/KCP/KK
			SQLjo = "SELECT kln_id FROM kln WHERE (kln_nama='" & outlet0 & "')"
			myCmd.CommandText = SQLjo
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			
			a = 0
			statuskcp = 0
            If myReader.HasRows Then
                While myReader.Read()
					statuskcp = 1
				End While
			End If
			myConn.Close()

			jenisoutlet=""
			if (statuskc > 0) Then
				jenisoutlet = "KC"
			End if
			if (statuskcp > 0) Then
				jenisoutlet = "KCP"
			End if
' Ubah status aktif dari data npp yg ada
			SQL0 = "SELECT * FROM [kct] WHERE (RIGHT(npp,5)='" & npp0 & "') ORDER BY tgl DESC"
			myCmd.CommandText = SQL0
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			a = 0
			If myReader.HasRows Then
				While myReader.Read()
					a = a+1
					idw(a) = myReader("id").ToString()
				End While
			End If
			myConn.Close()
			If a > 0 Then
				SQL0 = "UPDATE [kct] SET statusaktif=0 WHERE (RIGHT(npp,5)='" & npp0 & "')"
				myCmd.CommandText = SQL0
				myConn.Open()
				myReader = myCmd.ExecuteReader()
				myConn.Close()
			End If

' Masukkan data dan set statusaktif=1				
			SQL0 = "INSERT INTO kct (npp,nama,tgl,createddatetime,tglefektif,tglend,outlet,jenisoutlet,nomorsk,jabatan,kct_status,kct_user,createduser," & _
					"gambar,keterangan,revisi,statusaktif) VALUES('" & npp0.ToUpper() & "','" & nama0.ToUpper() & "',GETDATE(),GETDATE(),'" & tgl0 & "','" & _
					tglend0 & "','" & outlet0 & "','" & jenisoutlet & "','" & nosk0 & "','" & posisi0.ToUpper() & "',0," & userid  & "," & userid & _
					",'" & namafileku & "','" & ket0 & "',0,1)"

			myCmd.CommandText = SQL0
			myConn.Open()
			myReader = myCmd.ExecuteReader()

			myConn.Close()

        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>
<meta http-equiv="refresh" content="0;url=daftarkct.aspx?page=1&cari=" />