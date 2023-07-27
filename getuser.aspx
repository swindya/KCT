
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
	Dim usernamax as string
	Dim namax as String = ""
	Dim nppxx as String = ""
	Dim jmldata as Integer = 0
	Dim outstatus as Integer

	Dim SQL1 As String
	Dim SQL2 As String
	
	Dim outputstr as String = ""

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

	
	If NOT Request.QueryString("username") is Nothing Then
		usernamax = Request.QueryString("username")
	End If
	

	aaa=1


    Try
        If (aaa=1)


			'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
%>

<!--#include file="koneksi.aspx"-->

<%
			myCmd = myConn.CreateCommand
			
			SQL1 = "SELECT * FROM [user] WHERE (username='" & usernamax & "')" 					
			myCmd.CommandText = SQL1

			myConn.Open()
			
			myReader = myCmd.ExecuteReader()
			
			a = 0
            If myReader.HasRows Then
                While myReader.Read()
					a = a+1
                End While
				jmldata = a
            End If
			myConn.Close()
			
			If jmldata=0
				outstatus = 0
			Else If jmldata = 1
				outstatus = 1
			End If
			
			Response.Write (outstatus)
			
        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		'Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>
