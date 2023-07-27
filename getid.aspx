
<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data" %>
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
	Dim a, aaa, jmla as integer
	Dim idx as String
	Dim nppx as string
	Dim tglx as string
	Dim gambarx as string
	Dim kategorix as string
	Dim brklnx as string
	Dim jabatanx as string
	Dim nomorskx as String
	Dim keteranganx as string
	Dim statusx as string
	Dim tglendx as string
	Dim appx as string
	Dim userx as string
	Dim namax as String = ""
	Dim jmldata as Integer = 0

	Dim SQL1 As String
	Dim SQL2 As String
	
	Dim outputstr as String = ""

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

	
	If NOT Request.QueryString("id") is Nothing Then
		idx = Request.QueryString("id")
		'data1.Text = carival
	End If

	aaa=1


    Try
        If (aaa=1)

            'change the data source and initial catalog according to your sql server engine and data base*/
            'myConn = New SqlConnection("Data Source = DESKTOP-S7N8DF9; Initial Catalog = KCT;Integrated Security=True;User Id=sa;Password=sa;MultipleActiveResultSets=True")
            'myConn = New SqlConnection("{ODBC Driver 13 for SQL Server};Server=DESKTOP-S7N8DF9;Database=KCT;UID=myuser;PWD=userku;")
			myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
			'myConn = New SqlConnection("Driver={{SQL Server}};Server=DESKTOP-S7N8DF9;Database=KCT;UID=sa;PWD=sa;")
			'con.ConnectionString = "Data Source = localhost; Initial Catalog = KCT;Integrated Security=True;User Id=myuser;Password=userku;MultipleActiveResultSets=True"
            'con.ConnectionString = "Server=DESKTOP-S7N8DF9;" & _
            '               "Integrated Security=False;" & _
            '               "User ID=myuser;PWD=userku"

			myCmd = myConn.CreateCommand
			
			SQL1 = "SELECT kln.kln_nama AS brnama, jabatan.jabatan_nama AS jabatan, kct.nama AS nama, " & _
					"kct.npp AS npp, kct.gambar AS gambar, kct.kategori AS kategori, kct.keterangan AS keterangan, " & _
					"kct.kctstatus AS kctstatus, kct.tgl AS tgl, kct.tglefektif AS tglefektif, kct.tglend AS tglend, " & _
					"kct.nomorsk AS nomorsk FROM kct " & _
					"INNER JOIN " & _
					"kln ON kct.branchid = kln.kln_id INNER JOIN " & _
					"branch ON kln.kln_branch = branch.br_id INNER JOIN " & _
					"jabatan ON kct.jabatan = jabatan.jabatan_id " & _
					"WHERE (kct.id=" & idx & ")" 
					
			myCmd.CommandText = SQL1

			'Open the connection.
			
			myConn.Open()
			
			myReader = myCmd.ExecuteReader()
			
			a = 0
            If myReader.HasRows Then
                While myReader.Read()
					a = a+1
					namax = myReader("nama").ToString()
					nppx = myReader("npp").ToString()
					tglx = myReader("tgl").ToString()
					gambarx = myReader("gambar").ToString()
					kategorix = myReader("kategori").ToString()
					brklnx = myReader("brnama").ToString()
					jabatanx = myReader("jabatan").ToString()
					nomorskx = myReader("nomorsk").ToString()
					keteranganx = myReader("keterangan").ToString()
					statusx = myReader("kctstatus").ToString()
					tglendx = myReader("tglend").ToString()
                End While
				jmldata = a
            Else
               'lbl1.text = "Data Amsyiong"
            End If
			myConn.Close()
			
			If jmldata=0
				outputstr = "0|" & namax
			Else If jmldata = 1
				outputstr = "1|" & nppx & "|" & namax & "|" & jabatanx & "|" & brklnx & "|" & nomorskx & "|" & keteranganx & "|" & gambarx
			Else If jmldata > 1
				outputstr = jmldata & "|" & nppx & "|" & namax & "|" & jabatanx & "|" & brklnx & "|" & nomorskx & "|" & keteranganx & "|" & gambarx
			End If
			
			Response.Write (outputstr)
			
        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		'Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>
