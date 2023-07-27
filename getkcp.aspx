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
	Dim namakc as String = ""
	Dim kcid as Integer = 0
	Dim namakcp(200) as String

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
	Dim kcx as String = ""
	Dim optionstr as String = ""

	Dim SQL0 As String
	Dim SQL1 As String
	Dim SQL2 As String
	Dim SQLjo As String
	
	Dim statuskc as Integer = 0
	Dim statuskcp as Integer = 0

	If NOT Request.QueryString("namakc") is Nothing Then
		kcx = Request.QueryString("namakc")
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
			statuskc = 0
            If myReader.HasRows Then
                While myReader.Read()
					statuskc = 1
					kcid = myReader("br_id").ToString()
				End While
			End If
			myConn.Close()
			
			If statuskc=1
				a = 0
				SQL0 = "SELECT * FROM [kln] WHERE (kln_branch=" & kcid & ")"
				myCmd.CommandText = SQL0
				myConn.Open()
				myReader = myCmd.ExecuteReader()
				If myReader.HasRows Then
                While myReader.Read()
					a = a + 1
					namakcp(a) = myReader("kln_nama").ToString()
					optionstr = optionstr + "<option>" & namakcp(a) & "</option>"
				End While
				response.write(optionstr)
			End If
			myConn.Close()

			End if		
        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		'Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>

