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
	Dim jenisoutlet0 as String = ""
	Dim outlet0 as String = ""
	Dim nosk0 as String = ""
	Dim tgl0 as String = ""
	Dim ket0 as String = ""
	Dim namafile0 as String = ""

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
	Dim kcid as Integer = 0
	Dim kcpx as String = ""
	Dim kcx as String = ""

	Dim SQL0 As String
	Dim SQL1 As String
	Dim SQL2 As String
	Dim SQLjo As String
	
	Dim statuskc as Integer = 0
	Dim statuskcp as Integer = 0

	'userid = Session("userid")
	'namauserx = Session("namauser")

'Waktu -> prefix namafile
	'Dim s As String = DateTime.Now.ToString("yyyyMMdd")
	's = s & Hour(Now) & Minute(Now) & Second(Now)
	'namatemp = nama0.ToLower()
	'namatemp = namatemp.Replace(" ", "")
	'prenamafile = namatemp.Substring(0, 6) & s

	If NOT Request.QueryString("kc") is Nothing Then
		kcx = Request.QueryString("kc")
	End If
	
	If NOT Request.QueryString("kcp") is Nothing Then
		kcpx = Request.QueryString("kcp")
	End If

	aaa = 1
    Try
        If (aaa=1)
			'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
%>
<!--#include file="koneksi.aspx"-->
<%			
			
			myCmd = myConn.CreateCommand

'** Cek branch/KC
			SQLjo = "SELECT * FROM [branch] WHERE (br_nama='" & kcx & "')"
			myCmd.CommandText = SQLjo
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			
			a = 0
            If myReader.HasRows Then
                While myReader.Read()
					kcid = myReader("br_id").ToString()
				End While
			End If
			myConn.Close()
			
			SQLjo = "SELECT * FROM [kln] WHERE (kln_nama='" & kcpx & "')"

			myCmd.CommandText = SQLjo
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			statuskcp = 0
            If myReader.HasRows Then
				statuskcp = 1
                While myReader.Read()
					kcid = myReader("kln_branch").ToString()
				End While
			End If
			myConn.Close()
			
			If statuskcp=0
				SQL0 = "INSERT INTO [kln] (kln_nama, kln_branch) VALUES('" & kcpx.ToUpper() & "'," & kcid & ")"
				myCmd.CommandText = SQL0
				myConn.Open()
				myReader = myCmd.ExecuteReader()
				myConn.Close()
				response.write(kcpx & " sudah ditambahkan.")
			End if
			If statuskcp=1
				response.write("Data sudah ada. Mungkin dibawah Cabang lain.")			
			End If
        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		'Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>

