<!DOCTYPE html>

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

<html>
<head>
    <meta charset="utf-8">
    <!-- Somehow I got an error, so I comment the title, just uncomment to show -->
    <!-- <title>Animated Sidebar Menu | CodingLab</title> -->
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- Font Awesome JS -->
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <!--script src="./js/a076d05399.js"></script>
	<script src="./js/b99e675b6e.js"></script>
	<script src="./js/jquery-3.4.1.min.js"></script-->

<link rel="stylesheet" href="css1/styles.css">

<link href="./datepicker4/dcalendar.picker.css" rel="stylesheet" type="text/css">

<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
.main {
  margin-top: 30px; /* Add a top margin to avoid content overlay */
}
.wrapper{
  height: 100%;
  width: 300px;
  position: relative;
}
.wrapper .menu-btn{
  position: absolute;
  left: 20px;
  top: 10px;
  background: #4a4a4a;
  color: #fff;
  height: 45px;
  width: 45px;
  z-index: 9999;
  border: 1px solid #333;
  border-radius: 5px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}
#btn:checked ~ .menu-btn{
  left: 247px;
}
.wrapper .menu-btn i{
  position: absolute;
  transform: ;
  font-size: 23px;
  transition: all 0.3s ease;
}
.wrapper .menu-btn i.fa-times{
  opacity: 0;
}
#btn:checked ~ .menu-btn i.fa-times{
  opacity: 1;
  transform: rotate(-180deg);
}
#btn:checked ~ .menu-btn i.fa-bars{
  opacity: 0;
  transform: rotate(180deg);
}
#sidebar{
  position: fixed;
  background: #404040;
  height: 100%;
  width: 270px;
  overflow: hidden;
  left: -270px;
  transition: all 0.3s ease;
}
#btn:checked ~ #sidebar{
  left: 0;
}
#sidebar .title{
  line-height: 65px;
  text-align: center;
  background: #333;
  font-size: 25px;
  font-weight: 600;
  color: #f2f2f2;
  border-bottom: 1px solid #222;
}
#sidebar .list-items{
  position: relative;
  background: #404040;
  width: 100%;
  height: 100%;
  list-style: none;
}
#sidebar .list-items li{
  padding-left: 40px;
  line-height: 50px;
  border-top: 1px solid rgba(255,255,255,0.1);
  border-bottom: 1px solid #333;
  transition: all 0.3s ease;
}
#sidebar .list-items li:hover{
  border-top: 1px solid transparent;
  border-bottom: 1px solid transparent;
  box-shadow: 0 0px 10px 3px #222;
}
#sidebar .list-items li:first-child{
  border-top: none;
}
#sidebar .list-items li a{
  color: #f2f2f2;
  text-decoration: none;
  font-size: 18px;
  font-weight: 500;
  height: 100%;
  width: 100%;
  display: block;
}
#sidebar .list-items li a i{
  margin-right: 20px;
}
#sidebar .list-items .icons{
  width: 100%;
  height: 40px;
  text-align: center;
  position: absolute;
  bottom: 100px;
  line-height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}
#sidebar .list-items .icons a{
  height: 100%;
  width: 40px;
  display: block;
  margin: 0 5px;
  font-size: 18px;
  color: #f2f2f2;
  background: #4a4a4a;
  border-radius: 5px;
  border: 1px solid #383838;
  transition: all 0.3s ease;
}
#sidebar .list-items .icons a:hover{
  background: #404040;
}
.list-items .icons a:first-child{
  margin-left: 0px;
}
.content{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%,-50%);
  color: #202020;
  z-index: -1;
  width: 100%;
  text-align: center;
}
.content .header{
  font-size: 45px;
  font-weight: 700;
}
.content p{
  font-size: 40px;
  font-weight: 700;
}
</style>


<style>
.button, .button:visited {
background-color: #222;
display: inline-block;
padding: 5px 10px 6px;
color: #fff;
text-decoration: none;
-moz-border-radius: 6px;
-webkit-border-radius: 6px;
-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
border-bottom: 1px solid rgba(0,0,0,0.25);
position: relative;
cursor: pointer;
font-family: Arial;

}
.button:hover {
background-color: #111;
color: #fff;
} .button:active {
top: 1px;
} 
.small.button, .small.button:visited {
font-size: 0.8em;
padding: 8px 14px 6px;
} 
.button, .button:visited,
.medium.button, .medium.button:visited {
font-size: 1.2em;
font-family: calibri;
font-weight: normal;
line-height: 1;
text-shadow: 0 -1px 1px rgba(0,0,0,0.25); 
} 
.medium.button, .medium.button:visited {
font-size: 1.1em;
padding: 6px 14px 8px;
} 
.large.button, .large.button:visited {
font-size: 1.1em;
padding: 18px 22px 16px;
} 
.pink.button, .magenta.button:visited {
background-color: #e22092;
} 
.pink.button:hover {
background-color: #c81e82;
} 
.green.button, .green.button:visited {
background-color: #00AC04;
} 
.green.button:hover {
background-color: #749a02;
} 
.red.button, .red.button:visited {
background-color: #e62727;
}
.red.button:hover {
background-color: #cf2525;
}
.orange.button, .orange.button:visited {
background-color: #ff5c00;
} 
.orange.button:hover {
background-color: #d45500;
}
.blue.button, .blue.button:visited {
background-color: #2981e4;
}
.blue.button:hover {
background-color: #2575cf;
}
.yellow.button, .yellow.button:visited {
background-color: #ffb515;
}
.yellow.button:hover {
background-color: #fc9200;
} 
</style>
<style> 
.textbox { 
    border: 1px solid #c4c4c4; 
    height: 26px; 
    width: 240px; 
    font-size: 13px; 
    padding: 4px 4px 4px 4px; 
    border-radius: 4px; 
    -moz-border-radius: 4px; 
    -webkit-border-radius: 4px; 
    box-shadow: 0px 0px 4px #d9d9d9; 
    -moz-box-shadow: 0px 0px 4px #d9d9d9; 
    -webkit-box-shadow: 0px 0px 4px #d9d9d9; 
} 
 
.textbox:focus { 
    outline: none; 
    border: 1px solid #7bc1f7; 
    box-shadow: 0px 0px 4px #7bc1f7; 
    -moz-box-shadow: 0px 0px 4px #7bc1f7; 
    -webkit-box-shadow: 0px 0px 4px #7bc1f7; 
</style>
<style>
.textboxnarrow { 
    border: 1px solid #c4c4c4; 
    height: 26px; 
    width: 50px; 
    font-size: 13px; 
    padding: 4px 4px 4px 4px; 
    border-radius: 4px; 
    -moz-border-radius: 4px; 
    -webkit-border-radius: 4px; 
    box-shadow: 0px 0px 4px #d9d9d9; 
    -moz-box-shadow: 0px 0px 4px #d9d9d9; 
    -webkit-box-shadow: 0px 0px 4px #d9d9d9; 
} 
 
.textboxnarrow:focus { 
    outline: none; 
    border: 1px solid #7bc1f7; 
    box-shadow: 0px 0px 4px #7bc1f7; 
    -moz-box-shadow: 0px 0px 4px #7bc1f7; 
    -webkit-box-shadow: 0px 0px 4px #7bc1f7; 
</style>
<style>
.textboxmid { 
    border: 1px solid #c4c4c4; 
    height: 26px; 
    width: 130px; 
    font-size: 13px; 
    padding: 4px 4px 4px 4px; 
    border-radius: 4px; 
    -moz-border-radius: 4px; 
    -webkit-border-radius: 4px; 
    box-shadow: 0px 0px 4px #d9d9d9; 
    -moz-box-shadow: 0px 0px 4px #d9d9d9; 
    -webkit-box-shadow: 0px 0px 4px #d9d9d9; 
} 
 
.textboxmid:focus { 
    outline: none; 
    border: 1px solid #c4c4c4; 
    box-shadow: 0px 0px 4px #7bc1f7; 
    -moz-box-shadow: 0px 0px 4px #7bc1f7; 
    -webkit-box-shadow: 0px 0px 4px #7bc1f7; 
} 
 </style>
 <style>
.textboxwide { 
    border: 1px solid #c4c4c4; 
    height: 26px; 
    width: 250px; 
    font-size: 13px; 
    padding: 4px 4px 4px 4px; 
    border-radius: 4px; 
    -moz-border-radius: 4px; 
    -webkit-border-radius: 4px; 
    box-shadow: 0px 0px 4px #d9d9d9; 
    -moz-box-shadow: 0px 0px 4px #d9d9d9; 
    -webkit-box-shadow: 0px 0px 4px #d9d9d9; 
} 
 
.textboxwide:focus { 
    outline: none; 
    border: 1px solid #7bc1f7; 
    box-shadow: 0px 0px 4px #7bc1f7; 
    -moz-box-shadow: 0px 0px 4px #7bc1f7; 
    -webkit-box-shadow: 0px 0px 4px #7bc1f7; 
} 
 </style>
 <style> 
  .textboxtgl { 
    border: 1px solid #c4c4c4; 
    height: 26px; 
    width: 160px; 
    font-size: 13px; 
    padding: 4px 4px 4px 4px; 
    border-radius: 2px; 
    -moz-border-radius: 2px; 
    -webkit-border-radius: 2px; 
    box-shadow: 0px 0px 2px #d9d9d9; 
    -moz-box-shadow: 0px 0px 2px #d9d9d9; 
    -webkit-box-shadow: 0px 0px 2px #d9d9d9; 
} 
 
.textboxtgl:focus { 
    outline: none; 
    border: 1px solid #7bc1f7; 
    box-shadow: 0px 0px 2px #7bc1f7; 
    -moz-box-shadow: 0px 0px 2px #7bc1f7; 
    -webkit-box-shadow: 0px 0px 2px #7bc1f7; 
} 
 </style>
 
<style>
.inp-icon{
background: url(cal4.png)no-repeat 100%;
background-size: 16px;
 }
</style>

<style>
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 4px 12px;
  text-decoration: none;
  border: 1px solid #ddd;
  border-radius: 3px;
  font-size: 14px;
}

.pagination a.active {
  background-color: #C5C5E2;
  color: white;
  border: 1px solid #C5C5E2;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
</style>

<script>
function addkct()
{
	document.getElementById('kctedittab').style.display = 'block';
	//document.getElementById('editkct').style.display = 'none';
}
</script>

<script>
function clearparam()
{
	document.getElementsByName("namanpp")[0].value = "";
}
</script>

<script>
function viewpage(nohal)
{
var myval = document.getElementsByName("namanpp")[0].value;
if (myval==null || myval=="")
{
	var halink = "main.aspx?page=" + nohal + "&cari=none";
}
else
{
	var halink = "main.aspx?page=" + nohal + "&cari=" + myval;
}
//window.open(halink);
window.location.href = halink;
	//document.getElementsByName("pageno")[0].value = nohal;
	//document.forms["pagefrm"].submit();
}
</script>

<script>
function viewfilter()
{
var myval = document.getElementsByName("namanpp")[0].value;
var halink = "main.aspx?page=1&cari=" + myval;
//window.open(halink);
window.location.href = halink;
}
</script>

</head>
<body>

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
	Dim tglend0 as String = ""
	Dim ket0 as String = ""
	Dim id0 as Integer = 0
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
	Dim revisix as String = ""
	Dim revalx as Integer = 0

	Dim SQL0 As String
	Dim SQL1 As String
	Dim SQL2 As String
	Dim SQLjo As String
	
	Dim statuskc as Integer = 0
	Dim statuskcp as Integer = 0
	Dim statuskct as String

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)
'Dim iDate As String = "05/05/2005"
'Dim oDate As DateTime = Convert.ToDateTime(iDate)
'MsgBox(oDate.Day & " " & oDate.Month & "  " & oDate.Year)


'Session

	userid = Session("userid")
	namauserx = Session("namauser")

Response.Write(userid & "---" & namauserx)

	aaa=1

	If NOT Request.Form("kctid") is nothing Then
		id0 = Request.Form("kctid")
	End If
	If NOT Request.Form("editnpp") is nothing Then
		npp0 = Request.Form("editnpp")
	End If

	If NOT Request.Form("editnama") is nothing Then
		nama0 = Request.Form("editnama")
	End If
	
	If NOT Request.Form("editposisi") is nothing Then
		posisi0 = Request.Form("editposisi")
	End If
	
	If NOT Request.Form("editoutlet") is nothing Then
		outlet0 = Request.Form("editoutlet")
	End If
	
	If NOT Request.Form("editnosk") is nothing Then
		nosk0 = Request.Form("editnosk")
	End If
	
	If NOT Request.Form("edittglefektif") is nothing Then
		tgl0 = Request.Form("edittglefektif")
	End If
	Dim tglarr() as String
	tglarr= tgl0.Split("-")
	tgl0 = tglarr(2) & "-" & tglarr(1) & "-" & tglarr(0)
	
	If NOT Request.Form("edittglend") is nothing Then
		tglend0 = Request.Form("edittglend")
	End If
	Dim tglearr() as String
	tglearr= tglend0.Split("-")
	tglend0 = tglearr(2) & "-" & tglearr(1) & "-" & tglearr(0)
	
	If NOT Request.Form("editket") is nothing Then
		ket0 = Request.Form("editket")
	End If
	
	If NOT Request.Form("ttdfile") is nothing Then
		ttdfile0 = Request.Form("ttdfile")
	End If
	
	If NOT Request.Form("editfile") is nothing Then
		namafileku = Request.Form("editfile")
	End If


'Waktu -> prefix namafile
	Dim s As String = DateTime.Now.ToString("yyyyMMdd")
	s = s & Hour(Now) & Minute(Now) & Second(Now)
	namatemp = nama0.ToLower()
	namatemp = namatemp.Replace(" ", "")
	prenamafile = namatemp.Substring(0, 6) & s

	Dim folderPath As String = Server.MapPath("~/KCT/DOC/TTD/")
     'Check whether Directory (Folder) exists.

	'If(Not System.IO.Directory.Exists(folderPath)) Then
		'System.IO.Directory.CreateDirectory(folderPath)
	'End If



    'Save the File to the Directory (Folder).
	Dim exten As String = ""
	Dim postedFile As HttpPostedFile = Request.Files("uploadImage0")
    'Check if File is available.
	
	If postedFile IsNot Nothing And postedFile.ContentLength > 2 Then
        'Save the File.
        'Dim filePath1 As String = Server.MapPath("~/DOC/TTD/") & Path.GetFileName(postedFile.FileName)
		
		Dim filePath1 As String = Server.MapPath("~/KCT/DOC/TTD/") + postedFile.FileName
		exten = System.IO.Path.GetExtension(postedFile.FileName)
		namafile0 = Server.MapPath("~/KCT/DOC/TTD/") + prenamafile + exten
        postedFile.SaveAs(namafile0)
		namafileku = prenamafile + exten
'Response.Write("--------------------------------" & namafileku)
    End If
	

	
	
	

	'If uploadImage1.HasFile Then
    '    Dim extension As String = System.IO.Path.GetExtension(uploadImage1.PostedFile.FileName)
	'	namafile0 = prenamafile & extension
    '    fuUpload.SaveAs(folderPath & namafile0)
    'End If
	


Response.Write (namafile0)

    Try
        If (aaa=1)
		
			'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
%>

<!--#include file="koneksi.aspx"-->

<%
			myCmd = myConn.CreateCommand
			
'** baca kct_status: pending atau reject
			SQLjo = "SELECT * FROM kct WHERE (id=" & id0 & ")"
			myCmd.CommandText = SQLjo
			myConn.Open()
			myReader = myCmd.ExecuteReader()
            If myReader.HasRows Then
                While myReader.Read()
					statuskct = myReader("kct_status").ToString()
					revisix = myReader("revisi").ToString()
				End While
			End If
			myConn.Close()

			revalx = Val(revisix) + 1

'** Cari id dari branch/KC
			SQLjo = "SELECT br_id FROM branch WHERE (br_nama='" & outlet0 & "')"
			myCmd.CommandText = SQLjo
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			
			a = 0
			statuskc = 0
            If myReader.HasRows Then
                While myReader.Read()
					statuskc = 1
				End While
			End If
			myConn.Close()
			
'** Cari id dari Capem/KCP/KK
			SQLjo = "SELECT kln_id FROM kln WHERE (kln_nama='" & outlet0 & "')"
			myCmd.CommandText = SQLjo
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			
			a = 0
			statuskcp = 0
            If myReader.HasRows Then
                While myReader.Read()
					statuskcp = 1
				End While
			End If
			myConn.Close()
			
			jenisoutlet=""
			if (statuskc > 0) Then
				jenisoutlet = "KC"
			End if
			if (statuskcp > 0) Then
				jenisoutlet = "KCP"
			End if
			
			If statuskct=0 Then
				SQL0 = "UPDATE kct SET npp='" & npp0.ToUpper() & "',nama='" & nama0.ToUpper() & "',tglefektif='" & tgl0 & _
						"', tglend='" & tglend0 & "',outlet='" & outlet0 & "',jenisoutlet='" & jenisoutlet & "',nomorsk='" & nosk0 & _
						"',jabatan='" & posisi0 & "',gambar='" & namafileku & "',keterangan='" & ket0 & "' WHERE (id=" & id0 & ")"
			ElseIf statuskct=1 Then
				SQL0 = "UPDATE kct SET npp='" & npp0.ToUpper() & "',nama='" & nama0.ToUpper() & "',tglefektif='" & tgl0 & _
						"', tglend='" & tglend0 & "',outlet='" & outlet0 & "',jenisoutlet='" & jenisoutlet & "',nomorsk='" & nosk0 & _
						"',jabatan='" & posisi0 & "',gambar='" & namafileku & "',keterangan='" & ket0 & "', revisi=" & revalx & " WHERE (id=" & id0 & ")"
			
			End If


			myCmd.CommandText = SQL0
			myConn.Open()
			myReader = myCmd.ExecuteReader()

			myConn.Close()

			
			'Session("username") = user0
			'Session("namauser") = namauserx
			
			'data1.Text = idx & user0 & "--" & pwd0 & "--" & jmldata
			'Session("username")=user0
			'Session("namauser")=namauserx

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

