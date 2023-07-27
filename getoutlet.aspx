
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
	Dim myCmd2 As SqlCommand
	Dim myCmdi As SqlCommand
    Dim myReader As SqlDataReader
	Dim myReader2 As SqlDataReader
    'results As String
	Dim a, aaa, jmla as integer
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
	Dim namaoutx as String = ""
	Dim jmldata as Integer = 0
	Dim idx(5000) as Integer
	Dim namax(5000) as String

	Dim SQL1 As String
	Dim SQL2 As String

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

	
	If NOT Request.QueryString("namaoutlet") is Nothing Then
		namaoutx = Request.QueryString("namaoutlet")
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
			myCmd2 = myConn.CreateCommand
			
			myConn.Open()
			
			'Response.Write ("""" & "<ul>")
			

			
			SQL1 = "SELECT br_id AS id, br_nama AS namaout FROM branch WHERE (br_nama LIKE '%" & namaoutx & "%') ORDER BY br_nama ASC"			

			myCmd.CommandText = SQL1
			'Open the connection.
			myReader = myCmd.ExecuteReader()
			a = 0
			'lbl1.Text = "-------------------------------------" & SQL1
            If myReader.HasRows Then
                While myReader.Read()
					a = a+1
					idx(a) = myReader("id").ToString()
					namax(a) = myReader("namaout").ToString()
					'Response.Write("<li>" & namax(a) & "</li>")
					'Response.Write("<option value=" & """" & namax(a) & """" & ">" & namax(a) & "</option>")
					'Response.Write("<option>" & namax(a) & "</option>")
                End While
            End If
			myConn.Close()
			
			jmldata = a

			myConn.Open()
			
			SQL2 = "SELECT kln_id AS id, kln_nama AS namaout FROM kln WHERE (kln_nama LIKE '%" & namaoutx & "%') ORDER BY kln_nama ASC"
			myCmd2.CommandText = SQL2
			myReader2 = myCmd2.ExecuteReader()
            If myReader2.HasRows Then
                While myReader2.Read()
					a = a+1
					idx(a) = myReader2("id").ToString()
					namax(a) = myReader2("namaout").ToString()
                End While
            End If			
			
			jmldata = a
			
			myConn.Close()


			for a=1 to jmldata
				Response.Write("<option>" & namax(a) & "</option>")
			next a
			
        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		'Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>
