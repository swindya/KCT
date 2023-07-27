
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
		npp0 = right(npp0,5)
	End If

	If NOT Request.Form("barunama") is nothing Then
		nama0 = Request.Form("barunama")
	End If


'Waktu -> prefix namafile
	Dim s As String = DateTime.Now.ToString("yyyyMMdd")
	s = s & Hour(Now) & Minute(Now) & Second(Now)
	namatemp = nama0.ToLower()
	namatemp = namatemp.Replace(" ", "")
	prenamafile = namatemp.Substring(0, 6) & s


Response.Write (namafile0)

    Try
        If (aaa=1)
		
			'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
%>

<!--#include file="koneksi.aspx"-->

<%
			myCmd = myConn.CreateCommand

' Ubah status aktif dari data npp yg ada
			SQL0 = "SELECT * FROM [kct] WHERE (RIGHT(npp,5)='" & npp0 & "')"
			myCmd.CommandText = SQL0
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			a = 0
			If myReader.HasRows Then
				While myReader.Read()
					a = a+1
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