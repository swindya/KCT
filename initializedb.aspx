<!DOCTYPE html>

<%@ Page Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.OleDb" %> 
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.Configuration" %>
 
<script runat="server">

</script>

<html>
<head>

</head>
<body>

<%
    'Inherits System.Windows.Forms.Form
    'Create ADO.NET objects.
    Dim myConn As SqlConnection
    Dim myCmd As SqlCommand
	Dim myCmdi As SqlCommand
	Dim myCmd1 As SqlCommand
	Dim myCmd2 As SqlCommand
    Dim myReader As SqlDataReader
	Dim myReader1 As SqlDataReader
	Dim myReader2 As SqlDataReader
    'results As String
	Dim a, aaa, jmla as integer
	Dim user0 as string
	Dim pwd0 as string
	Dim namauserx as String
	Dim jmldata as Integer = 0
	Dim jmldt as Integer = 0
	Dim namaoutlet(5000) as String
	Dim idx(4000) as string
	Dim namax(4000) as string
	Dim nppx(4000) as string
	Dim npporgx(4000) as string
	Dim tglx(4000) as string
	Dim gambarx(4000) as string
	Dim filegambarx(4000) as String
	Dim kategorix(4000) as string
	Dim branchidx(4000) as string
	Dim jabatanx(4000) as string
	Dim namajabatanx(4000) as string
	Dim keteranganx(4000) as string
	Dim statusx(4000) as string
	Dim tglendx(4000) as string
	Dim tglefektifx(4000) as string
	Dim appx(4000) as string
	Dim userx(4000) as string
	Dim jenisoutletx(4000) as String
	Dim outletx(4000) as String
	Dim kctstatusx(4000) as String
	Dim kctuserx(4000) as String
	Dim namaoutletx(4000) as String
	Dim jenisoutlet(4000) as String
	Dim jenisbranch(4000) as String

	'Dim pageno as Integer = 1
	Dim pageno as String
	Dim jmlpage as Integer = 1
	Dim pagerows as Integer = 20
	Dim rowsperpage as Integer = 20
	Dim hal as Integer = 1
	Dim b as Single = 0
	Dim c as Integer = 0
	Dim itop as Integer = 1
	Dim ii as Integer = 0
	Dim k as Integer
	Dim userid as Integer = 1

	Dim SQL0 As String
	Dim SQL1 As String
	Dim SQL2 As String
	
	Dim bk as String = ""

	aaa=1
	
	user0 = ""
	pwd0 = ""
   
   
'End If

'** Cek data sesi
	user0 = Session("username")
	namauserx = Session("namauser")
	
'Koneksi
	'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
	
%>

<!--#include file="koneksi.aspx"-->

<%
	
	myCmd = myConn.CreateCommand
	myCmd1 = myConn.CreateCommand
	myCmd2 = myConn.CreateCommand

'======================================================================================
' Baca data KCT -> cari nama branch dan nama kln -> update kolom outlet dan jenisoutlet
'======================================================================================
'** Cari kct
'
	SQL0 = "SELECT * FROM kct ORDER BY id ASC"
	myCmd.CommandText = SQL0
	myConn.Open()
	myReader = myCmd.ExecuteReader()
	
	a = 0
	If myReader.HasRows Then
		While myReader.Read()
			a = a + 1
			idx(a) = myReader("id").ToString()
			namax(a) = myReader("nama").ToString()
			nppx(a) = myReader("npp").ToString()
			npporgx(a) = Microsoft.VisualBasic.Right(nppx(a), 5)
			tglx(a) = myReader("tgl").ToString()
			gambarx(a) = myReader("gambar").ToString()
			kategorix(a) = myReader("kategori").ToString()
			branchidx(a) = myReader("branchid").ToString()
			jabatanx(a) = myReader("jabatanid").ToString()
			keteranganx(a) = myReader("keterangan").ToString()
			kctstatusx(a) = myReader("kctstatus").ToString()
			tglendx(a) = myReader("tglend").ToString()
			tglefektifx(a) = myReader("tglefektif").ToString()
			'jenisoutletx(a) = myReader("jenisoutlet").ToString()
			outletx(a) = myReader("outlet").ToString()
			kctuserx(a) = myReader("kctuser").ToString()
		End While
	End If
	myConn.Close()
	jmldata = a

'Bedain antara cabang dan capem -> ubah dari angka ke nama cabang/capem
		'myConn.Open()	
	For a=1 to jmldata
		if (kategorix(a)="brc") then
			SQL0 = "SELECT * FROM branch WHERE (br_id=" & branchidx(a) & ")"
			bk = "br_nama"
			jenisbranch(a) = "CAB"
			myCmd1.CommandText = SQL0
			myConn.Open()
			myReader = myCmd1.ExecuteReader()
			If myReader.HasRows Then
				While myReader.Read()
					namaoutletx(a) = myReader(bk).ToString()
				End While
			End If
			myConn.Close()
		else if (kategorix(a)="kln") then
			SQL0 = "SELECT * FROM kln WHERE (kln_id=" & branchidx(a) & ")"
			bk = "kln_nama"
			jenisbranch(a) = "KCP"
			myCmd.CommandText = SQL0
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			If myReader.HasRows Then
				While myReader.Read()
					namaoutletx(a) = myReader(bk).ToString()
				End While
			End If
			myConn.Close()
		end if
		SQL0 = "SELECT * FROM jabatan WHERE (jabatan_id=" & jabatanx(a) & ")"
		myCmd.CommandText = SQL0
		myConn.Open()
		myReader = myCmd.ExecuteReader()
		If myReader.HasRows Then
			While myReader.Read()
				namajabatanx(a) = myReader("jabatan_nama").ToString()
			End While
		End If
		myConn.Close()

	Next a
		'myConn.Close()	

'Masukkan/Update data namaoutlet dan jenisoutlet pada tabel KCT
	'myConn.Open()
	For a=1 to jmldata
		SQL1 = "UPDATE kct SET jenisoutlet='" & jenisbranch(a) & "', outlet='" & namaoutletx(a) & "', jabatan='" & _
				namajabatanx(a) & "' WHERE (id=" & idx(a) & ")"
		myCmd.CommandText = SQL1
		myConn.Open()
		myReader = myCmd.ExecuteReader()
		myConn.Close()
	Next a
	'myConn.Close()

'=====================================
		'SQL1 = "UPDATE kct SET jenisoutlet, outlet WHERE (br_id=" & branchidx(a))
		'myCmd.CommandText = SQL1
		'myConn.Open()
		'myReader = myCmd.ExecuteReader()
'=====================================
	
%>


<%
'Response.Write (Year(Now) & "/-/" & Month(Now) & ":" & Day(Now) & vbCrLf)

 Dim time As DateTime = DateTime.Now
        Dim format As String = "yyyy-M-d"
        'Response.Write(time.ToString(format))
		'Response.Write ("&nbsp;")
		
Dim s As String = DateTime.Now.ToString("yyyy-MM-dd")
		'Response.Write (s)
		
Dim dt As DateTime = Now
                Dim sDate As String = dt.ToString("yyyy/MM/dd")

		'Response.Write (sDate.toString & "&nbsp;")
		'Response.Write ("2020-20-20")
%>



</body>
</html>
