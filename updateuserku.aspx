
<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.OleDb" %> 
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Configuration" %>
 
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
	Dim userx as string
	Dim namax as String = ""
	Dim pwdx as String = ""
	Dim jmldata as Integer = 0

	Dim SQL1 As String
	Dim SQL2 As String
	
	Dim outputstr as String = ""

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

	If NOT Request.QueryString("username") is Nothing Then
		userx = Request.QueryString("username")
	End If
	
	If NOT Request.QueryString("nama") is Nothing Then
		namax = Request.QueryString("nama")
	End If
	
	If NOT Request.QueryString("pwd") is Nothing Then
		pwdx = Request.QueryString("pwd")
	End If
	
	If NOT Request.QueryString("status") is Nothing Then
		statusx = Request.QueryString("status")
	End If

	a = 0
	aaa=1


    Try
        If aaa=1 Then
%>

<!--#include file="koneksi.aspx"-->

<%
			myCmd = myConn.CreateCommand
			
			If statusx=0 Then
				SQL1 = "UPDATE [user] SET nama='" & namax	& "' WHERE username='" & userx & "'"
			ElseIf statusx=1 Then
				SQL1 = "UPDATE [user] SET nama='" & namax	& "', paswd=HASHBYTES('SHA2_256','" & pwdx & "') WHERE username='" & userx & "'"
			End If

			myCmd.CommandText = SQL1

			myConn.Open()
			
			myReader = myCmd.ExecuteReader()

			myConn.Close()
			a=1
			
        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		'Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
	
Response.Write (a)
	
%>
