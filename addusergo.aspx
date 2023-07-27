
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
	Dim namax as string = ""
	Dim usernamax as string = ""
	Dim pwdx as String = ""
	Dim levelx as String = ""

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
	Dim user0 as String = ""
	Dim namauser0 as String = ""
	Dim akses0 as String = ""
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
	
	Dim statuskc as Integer = 0
	Dim statuskcp as Integer = 0

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)
'Dim iDate As String = "05/05/2005"
'Dim oDate As DateTime = Convert.ToDateTime(iDate)
'MsgBox(oDate.Day & " " & oDate.Month & "  " & oDate.Year)


'Session

	userid = Session("userid")
	user0 = Session("username")
	namauser0 = Session("namauser")
	akses0 = Session("levelakses")

'Response.Write(userid & "---" & namauserx)

	aaa=1
	
	
	'If NOT Request.Form("barutglefektif") is nothing Then
	'	tgl0 = Request.Form("barutglefektif")
	'	if tgl0.length() > 5 Then
	'		Dim tglarr(3) as String 
	'		tglarr = tgl0.Split("-")
	'		tgl0 = tglarr(2) & "-" & tglarr(1) & "-" & tglarr(0)		
	'	End If
	'End If


	
	If NOT Request.Form("nama") is nothing Then
		namax = Request.Form("nama")
	End If
	
	If NOT Request.Form("levelakses") is nothing Then
		levelx = Request.Form("levelakses")
	End If
	
	If NOT Request.Form("username") is nothing Then
		usernamax = Request.Form("username")
	End If
	
	If NOT Request.Form("newpwd1") is nothing Then
		pwdx = Request.Form("newpwd1")
	End If
	


'Waktu -> prefix namafile
	'Dim s As String = DateTime.Now.ToString("yyyyMMdd")
	's = s & Hour(Now) & Minute(Now) & Second(Now)
	'namatemp = nama0.ToLower()
	'namatemp = namatemp.Replace(" ", "")
	'prenamafile = namatemp.Substring(0, 6) & s

	Dim folderPath As String = Server.MapPath("~/KCT/DOC/TTD/")
     'Check whether Directory (Folder) exists.

	'If(Not System.IO.Directory.Exists(folderPath)) Then
		'System.IO.Directory.CreateDirectory(folderPath)
	'End If



    Try
        If (aaa=1)
		
			'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
%>

<!--#include file="koneksi.aspx"-->

<%
			myCmd = myConn.CreateCommand

			
			SQL0 = "INSERT INTO [user] (nama,username,paswd,levelakses) VALUES('" & namax & "','" & usernamax & "', HASHBYTES('SHA2_256','" & _
					pwdx & "'),'" & levelx & "')"
			myCmd.CommandText = SQL0
			myConn.Open()
			myReader = myCmd.ExecuteReader()

			myConn.Close()

        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		'Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>
<meta http-equiv="refresh" content="0;url=daftaruser.aspx?" />