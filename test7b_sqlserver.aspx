<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Configuration" %>

<script runat="server">

</script>

<html>
<body>
<%
    Dim con As New SqlConnection
    Dim cmd As New SqlCommand
    Dim Passowrd As String
    Dim Passowrd2 As String
    Dim userName As String
	Dim a, aaa, jmla as integer
	Dim namax() as string
	Dim nppx() as string

	lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

	aaa=1


    Try
        If (aaa=1)

            'change the data source and initial catalog according to your sql server engine and data base*/
            'con.ConnectionString = "Data Source = DESKTOP-S7N8DF9; Initial Catalog = KCT;Integrated Security=True;User Id=myuser;Password=userku;MultipleActiveResultSets=True"
            'con.ConnectionString = "Data Source = localhost; Initial Catalog = KCT;Integrated Security=True;User Id=myuser;Password=userku;MultipleActiveResultSets=True"
            con.ConnectionString = "Server=DESKTOP-S7N8DF9;" & _
                           "Integrated Security=no;" & _
                           "User ID=myuser;PWD=userku"
			con.Open()

            cmd.Connection = con
             'change the data fields names and table according to your database*/
            cmd.CommandText = "SELECT  nama, npp FROM kct"

            Dim lrd As SqlDataReader = cmd.ExecuteReader()
			a = 0
            If lrd.HasRows Then
                While lrd.Read()
					a = a+1
                    'Do something here
					namax(a) = lrd("nama").ToString()
					nppx(a) = lrd("npp").ToString()
					lbl1.Text = namax(a)
                End While
				jmla = a
            Else
               lbl1.text = "Data Amsyiong"
            End If

        End If

    Catch ex As Exception
        lbl1.Text="Error while connecting Server." 

    Finally
        con.Close() 'Whether there is error or not. Close the connection.

    End Try
%>
<form id="myfrm" runat="server">
<p class="submit"><asp:Button id="btnLogin" Text="Login" runat="server" /></p>
<p><asp:label id="lbl1" runat="server" /></p>
</form>
     <table width="100%" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
         <tr align="left" style="background-color:#004080;color:White;" >
             <td> ID </td>                        
             <td> Nama </td>            
            <td>Npp</td>                        
         </tr>

       <% 
            for i as integer = 1 to 10
		%>
                   <tr>
                      <td><% Response.Write (i) %></td>
                      <td><% Response.Write (i) %></td>
                      <td><% Response.Write (i) %>
					  </td>
                   </tr>
		<%
			next
        %>

     </table> </asp:Content>

</body>
</html>