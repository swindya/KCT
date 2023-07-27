<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.OleDb" %> 
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Configuration" %>
 
<script runat="server">

</script>

<html>
<body>
<%
    'Inherits System.Windows.Forms.Form
    'Create ADO.NET objects.
    Dim myConn As SqlConnection
    Dim myCmd As SqlCommand
	Dim myCmdi As SqlCommand
    Dim myReader As SqlDataReader
    'results As String
	Dim a, aaa, jmla as integer
	Dim namax(4000) as string
	Dim nppx(4000) as string
	Dim tglx(4000) as string
	Dim gambarx(4000) as string
	Dim kategorix(4000) as string
	Dim brkln_idx(4000) as integer
	Dim jabatanx(4000) as integer
	Dim keteranganx(4000) as string
	Dim statusx(4000) as integer
	Dim tglendx(4000) as string
	Dim appx(4000) as integer
	Dim userx(4000) as long

	Dim SQL1 As String
	Dim SQL2 As String

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

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
			SQL1 = "SELECT * FROM kcti"
			myCmd.CommandText = SQL1

			'Open the connection.
			
			myConn.Open()
			
			'myCmdi = myConn.CreateCommand
			
			myReader = myCmd.ExecuteReader()
			
			a = 0
			lbl1.Text = "OK"
            If myReader.HasRows Then
                While myReader.Read()
					a = a+1
					namax(a) = myReader("nama").ToString()
					nppx(a) = myReader("npp").ToString()
					tglx(a) = myReader("tgl").ToString()
					gambarx(a) = myReader("gambar").ToString()
					kategorix(a) = myReader("kategori").ToString()
					brkln_idx(a) = myReader("brkln_id").ToString()
					jabatanx(a) = myReader("jabatan").ToString()
					keteranganx(a) = myReader("keterangan").ToString()
					statusx(a) = myReader("kct_status").ToString()
					tglendx(a) = myReader("kct_tglend").ToString()
					appx(a) = myReader("kct_app").ToString()
					userx(a) = myReader("kct_user").ToString()
					'lbl1.Text = namax(a)
                End While
				jmla = a
            Else
               lbl1.text = "Data Amsyiong"
            End If
			myConn.Close()
			
			myConn.Open()
			
			myCmdi = myConn.CreateCommand
			myCmdi.Connection = myConn
			
			for a=1 to jmla
					SQL2 = "INSERT INTO kct(nama, npp, tgl, gambar, kategori, branchid, jabatan, " & _
										"kctstatus, nomorsk, tglend, kctapp, kctuser, keterangan) VALUES('" & namax(a) & _
										"','" & nppx(a) & "','" & tglx(a) & "','" & gambarx(a) & "','" & kategorix(a) & _
										"'," & brkln_idx(a) & "," & jabatanx(a) & "," & statusx(a) & ",'" & keteranganx(a) & _
										"','" & tglendx(a) & "'," & appx(a) & "," & userx(a) & ",'" & keteranganx(a) & "')"
					
					''myCmdi.CommandText = SQL2
					lbl1.Text = SQL2
					''myCmdi.ExecuteNonQuery()
			next a
			
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
<form id="myfrm" runat="server">
<p class="submit"><asp:Button id="btnLogin" Text="Login" runat="server" /></p>
<p><asp:label id="lbl1" runat="server" /></p>
</form>
     <table width="630px" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
         <tr align="left" style="background-color:#004080;color:White;" >
             <td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="50px"> ID </td>                        
             <td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="400px"> Nama </td>            
            <td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="180px">Npp</td>                        
         </tr>

       <% 
            for i as integer = 1 to jmla
		%>
                   <tr>
                      <td><% Response.Write (i) %></td>
                      <td><a href="#"><% Response.Write (namax(i)) %></a></td>
                      <td><% Response.Write (nppx(i)) %>
					  </td>
                   </tr>
		<%
			next
        %>

     </table> </asp:Content>

</body>
</html>