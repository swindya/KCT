<!DOCTYPE html>

<%@ Page Language="VB" %>
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

<script type="text/javascript">     
function PreviewImage(no) 
{         
	var oFReader = new FileReader();
	var namafil = document.getElementById("uploadImage"+no).value;
	var namafilearr = namafil.split(".");
	var noarr = namafilearr.length;
	var jenisfile = namafilearr[noarr-1];

	oFReader.readAsDataURL(document.getElementById("uploadImage"+no).files[0]);
	
	if (jenisfile==='pdf')
	{
		oFReader.onload = function (oFREvent) {             
		document.getElementById("uploadPreview"+no).src = './pdficon1a.png'; 	
		};
	}
	else
	{
		oFReader.onload = function (oFREvent) {             
		document.getElementById("uploadPreview"+no).src = oFREvent.target.result; 		
		};
	}
	//document.forms["memobarufrm"].submit();
	//memousulanbaru();

} 
</script>

<script>
function addkct()
{
	document.getElementById('kctbarutab').style.display = 'block';
	//document.getElementById('barukct').style.display = 'none';
}
</script>

<script>
function clearparam()
{
	//document.getElementsByName("namanpp")[0].value = "";
	document.getElementById('kctedittab').style.display = 'none';
}
</script>

<script>
function viewpage(nohal)
{
var myval = document.getElementsByName("namanpp")[0].value;
if (myval==null || myval=="")
{
	var halink = "daftarkct.aspx?page=" + nohal + "&cari=";
}
else
{
	var halink = "daftarkct.aspx?page=" + nohal + "&cari=" + myval;
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
var halink = "daftarkct.aspx?page=1&cari=" + myval;
//window.open(halink);
window.location.href = halink;
}
</script>

<script>
function editdata(id, nourut, jmlrow)
{
	document.getElementById("kctedittab").style.display = "block";
	document.getElementById("caribtn").style.display = "none";
	document.getElementById("clearbtn").style.display = "none";
	document.getElementById("filtertab").style.display = "none";

	var outx = "";
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			//document.getElementById("txtHint").innerHTML = this.responseText;
			outx = this.responseText;
			var outarr = outx.split("|");
			if (outarr[0]=="0" || outarr[0]==0)
			{
				document.getElementsByName("editnama")[0].value = outarr[1];
				document.getElementsByName("editnpp")[0].value = "";
				document.getElementsByName("editposisi")[0].value = "";
				document.getElementsByName("editoutlet")[0].value = "";
				document.getElementsByName("editnosk")[0].value = "";
				document.getElementsByName("edittglefektif")[0].value = "";
				document.getElementsByName("editket")[0].value = "";
				document.getElementById("uploadPreview1").src = '';
				document.getElementsByName("uploadImage1")[0].value = "";
				document.getElementById("linkimage").href='';
			}
			else
			{
				//alert(outarr[0] + " " + outarr[1] + " " + outarr[2]);
				document.getElementsByName("editnama")[0].value = outarr[2];
				document.getElementsByName("editnpp")[0].value = outarr[1];
				document.getElementsByName("editposisi")[0].value = outarr[3];
				document.getElementsByName("editoutlet")[0].value = outarr[4];
				document.getElementsByName("editnosk")[0].value = outarr[5];
				document.getElementsByName("edittglefektif")[0].value = "";
				document.getElementsByName("editket")[0].value = outarr[6];
				document.getElementById("uploadPreview1").src = './DOC/TTD/' + outarr[7];
				document.getElementsByName("uploadImage1")[0].value = "";
				document.getElementById("linkimage").href='./DOC/TTD/' + outarr[7];
			}
			var m;
			var rowx;
			for (m = 1; m <= jmlrow; m++) {
				rowx = "row"+m;
				document.getElementById(rowx).style.backgroundColor='#EAEAEA';
			}
			rowx = "row"+nourut;
			document.getElementById(rowx).style.backgroundColor='#FFFF87';
		}
	};
	var linkstr = "getid.aspx?id="+id;
	xhttp.open("GET", linkstr, true);
	xhttp.send();
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
	Dim a, bb, aaa, jmla, jmldata as integer
	Dim idx(4000) as string
	Dim namax(4000) as string
	Dim nppx(4000) as string
	Dim tglx(4000) as string
	Dim gambarx(4000) as string
	Dim filegambarx(4000) as String
	Dim kategorix(4000) as string
	Dim brklnx(4000) as string
	Dim jabatanx(4000) as string
	Dim keteranganx(4000) as string
	Dim statusx(4000) as string
	Dim tglendx(4000) as string
	Dim appx(4000) as string
	Dim userx(4000) as string
	Dim idz(100) as Integer
	Dim rowperpage as Integer = 20
	'Dim pageno as Integer = 1
	Dim pageno as String
	Dim jmlpage as Integer = 1
	Dim pagerows as Integer = 20
	Dim rowsperpage as Integer = 20
	Dim hal as Integer = 1
	Dim b as Single = 0
	Dim c as Integer = 0
	'Dim idx as Integer = 0
	Dim itop as Integer = 1
	Dim i as Integer
	Dim ii as Integer = 0
	Dim k as Integer
	Dim userid as Integer = 1
	dim carival as String
	Dim user0 as String
	Dim namauserx as String
	Dim startval as Integer = 0
	Dim endval as Integer = 0

	Dim SQL0 As String
	Dim SQL1 As String
	Dim SQL2 As String

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

	aaa=1

	'pageno = Request.Form("pageno")
	'pageno = Request.Form["pageno"].ToString()
	pageno = 1
	If Request.QueryString("page") Then
		 pageno = Request.QueryString("page")
		 hal = Cint(pageno)
		 'data1.Text = hal
	End If

	If NOT Request.QueryString("cari") is Nothing Then
		carival = Request.QueryString("cari")
		'data1.Text = carival
	End If

'** Cek data sesi
	userid = Session("userid")
	user0 = Session("username")
	namauserx = Session("namauser")
	

    Try
        If (aaa=1)
			pagerows = (pageno-1) * 20
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

'** Baca semua data sesuai Query dan cari jumlah total data	
			If NOT carival is nothing Then
				SQL0 = "SELECT id FROM kct WHERE (nama LIKE '%" & carival & "%' OR npp LIKE '%" & carival & "%')"
			Else
				SQL0 = "SELECT id FROM kct"
			End IF

			myCmd.CommandText = SQL0
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			
			a = 0
            If myReader.HasRows Then
                While myReader.Read()
					a = a+1
					'idx = myReader("id").ToString()
				End While
			End If
			myConn.Close()
			jmldata = a

'** Cari jumlah halaman
			if (jmldata >= rowperpage) Then
				b = jmldata / rowsperpage
				c = jmldata / rowsperpage
				jmlpage = c
				if (b > c) then
					jmlpage = c + 1
				End If
			else
				jmlpage = 1
			End If

			If pageno = jmlpage Then
				rowsperpage = jmldata - ((jmlpage - 1)*20)
			End If

			startval = ((pageno-1)*20) + 1
			endval = startval + rowsperpage - 1
			
			myConn.Open()
			a = 0
			If NOT carival is nothing Then
				SQL2 = "SELECT kln.kln_nama AS brnama, jabatan.jabatan_nama AS jabatan, kct.id AS id, kct.nama AS nama, " & _
						"kct.npp AS npp, kct.gambar AS gambar, kct.kategori AS kategori, kct.keterangan AS keterangan, " & _
						"kct.kctstatus AS kctstatus, kct.tgl AS tgl, kct.tglefektif AS tglefektif, kct.tglend AS tglend, " & _
						"kct.nomorsk AS nomorsk FROM kct " & _
						"INNER JOIN " & _
						"kln ON kct.branchid = kln.kln_id INNER JOIN " & _
						"branch ON kln.kln_branch = branch.br_id INNER JOIN " & _
						"jabatan ON kct.jabatan = jabatan.jabatan_id " & _
						" WHERE (nama LIKE '%" & carival & "%' OR npp LIKE '%" & carival & "%')"
			Else
				SQL2 = "SELECT kln.kln_nama AS brnama, jabatan.jabatan_nama AS jabatan, kct.id AS id, kct.nama AS nama, " & _
						"kct.npp AS npp, kct.gambar AS gambar, kct.kategori AS kategori, kct.keterangan AS keterangan, " & _
						"kct.kctstatus AS kctstatus, kct.tgl AS tgl, kct.tglefektif AS tglefektif, kct.tglend AS tglend, " & _
						"kct.nomorsk AS nomorsk FROM kct " & _
						"INNER JOIN " & _
						"kln ON kct.branchid = kln.kln_id INNER JOIN " & _
						"branch ON kln.kln_branch = branch.br_id INNER JOIN " & _
						"jabatan ON kct.jabatan = jabatan.jabatan_id " & _
						" WHERE (kct.id > 0)"

			End IF
			myCmd.CommandText = SQL2
			myReader = myCmd.ExecuteReader()
			
			If myReader.HasRows Then
				While myReader.Read()
					a = a + 1
					idx(a) = myReader("id").ToString()
					namax(a) = myReader("nama").ToString()
					nppx(a) = myReader("npp").ToString()
					tglx(a) = myReader("tgl").ToString()
					gambarx(a) = myReader("gambar").ToString()
					filegambarx(a) = "./DOC/TTD/" & gambarx(a)
					kategorix(a) = myReader("kategori").ToString()
					brklnx(a) = myReader("brnama").ToString()
					jabatanx(a) = myReader("jabatan").ToString()
					keteranganx(a) = myReader("keterangan").ToString()
					statusx(a) = myReader("kctstatus").ToString()
					tglendx(a) = myReader("tglend").ToString()
				End While
			Else
			   'lbl1.text = "Data Amsyiong"
			End If
			myConn.Close()
			
			
			jmla = rowsperpage
			
			If String.IsNullOrEmpty(namauserx) or namauserx="" Then
%>

<script>
alert('Anda tidak beraktivitas terlalu lama (idle). Silahkan signin lagi');
window.top.location.href = "index.html"; 
</script>

<%			
			End If
			
			'data1.Text = SQL1 & "--" & user0 & "--" & itop

        End If

    Catch ex As Exception
        'lbl1.Text="Error while connecting Server."
		Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>

<!--#include file="menu.aspx"-->

<script>
$(document).ready(function(){
	$(".hamburger .hamburger__inner").click(function () {
	$(".wrapper").toggleClass("active")
})
 
$(".top_navbar .fas").click(function () {
	$(".profile_dd").toggleClass("active");
})
});
</script>

<form method="post" name="loginfrm" id="loginfrm" action="main.aspx" enctype="multipart/form-data">
<table id="kctedittab" style="text-align: left; margin-left: 250px; margin-right: auto; margin-top: 0; display: none" width="860px" border="0" cellspacing="0" cellpadding="0">
	<tr height="20px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.4em">
			<FONT face="Arial" color="#44AA44"><b>EDIT/UPDATE DATA</b></FONT>
		</td>
	</tr>
	<tr height="30px">
		<td colspan="4" style="padding-left: 20px; text-align: left; font-size: 1.0em">
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top" width="180px">
			<FONT face="Calibri" color="#000">
				NPP
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top" width="30px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="550px">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="editnpp" name="editnpp" class="textboxmid">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="100px">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Nama Lengkap
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="editnama" name="editnama" class="textbox" onchange="getnama(this.value);">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Posisi/Jabatan
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="editposisi" name="editposisi" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				KC/KCP/KK
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="editoutlet" name="editoutlet" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Nomor SK/Surat
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="editnosk" name="editnosk" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Tgl Efektif
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="340px">
			<FONT face="Calibri" color="#000">
				<!--input style="font-family: Calibri; font-size: 0.9em" type="text" id="datepicker-ex30" name="editbbmtglbayar" class="textboxtgl"-->
				<input STYLE=" font-size:0.9em; border:1px solid #ababab; width: 140px" autocomplete="off" class="inp-icon" id="edittglefektif" name="edittglefektif" type="text">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="datepicker4/dcalendar.picker.js"></script>
<script>
$('#edittglefektif').dcalendarpicker();
$('#calendar-demo').dcalendar(); //creates the calendar
</script>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="80px">										
		</td>
	</tr>
	<!--tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Tahun Anggaran
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<div class="side-by-side clearfix">
				<select STYLE="color: #000000; background-color: #ffffff; font-size: 0.9em; width: 90px" autocomplete="off" id="soflow1" name="editbbmta" data-placeholder="Tahun Anggaran"> 
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				</div>
			</FONT>											
		</td>
	</tr-->
	<tr height="35px">
		<td style="padding-left: 0px; padding-top: 5px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Keterangan
			</FONT>											
		</td>
		<td style="padding-left: 0px; padding-top: 5px; text-align: center; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; padding-top: 5px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<textarea STYLE="color: #000000; font-family: Calibri;  border:1px solid #ababab; font-weight: normal; font-size:1.0em; line-height: 110%;" id="editket" name="editket" rows="2" cols="64"></textarea>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; padding-top: 5px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Upload Ttd
			</FONT>											
		</td>
		<td style="padding-left: 0px; padding-top: 5px; text-align: center; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: auto; padding-top: 5px; text-align: left; font-size: 1.2em; vertical-align: top">
			<table id="file1" style="text-align: left; margin-left: 0px; margin-right: auto; margin-top: auto;" border="0" cellspacing="0" cellpadding="0">
				<tr height="42px">
					<td style="padding-left: 0px; padding-top: 0px; vertical-align: top; text-align: left; font-size: 1.0em">
						<FONT face="Calibri" color="#000">
							<input id="uploadImage1" name="uploadImage1" type="file" onchange="PreviewImage(1);" onclick="resetpic();" />
						</FONT>
					</td>
					<td style="padding-top: 5px; padding-left: auto; text-align: right; font-size: 1.2em" width="40px">
						<FONT face="Arial" color="#000">
							<a id="linkimage" href="#" target="_blank">
							<img id="uploadPreview1" height="90px" width="120px"/><br/>
							</a>
						</FONT>
					</td>
				</tr>
			</table>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="20px">
		<td colspan="3" style="padding-left: 20px; text-align: left;">
		</td>
	</tr>
	<tr height="40px">
		<td style="padding-left: 0px; text-align: left;">
			<a id="batalbtn" href="" class="medium button orange" onclick="clearparam();">Batal</a>
		</td>
		<td colspan="3" style="padding-left: 0px; text-align: left;">
			<a id="simpanbtn" href="#" class="medium button green" onclick="viewfilter();">Simpan</a>
		</td>
	</tr>
	<tr height="10px">
		<td colspan="4">
			<input type="hidden" id="kctid" name="kctid">
		</td>
	</tr>
</table>
</form>

<table id="paramtab" style="text-align: left; margin-left: 250px; margin-right: auto; margin-top: auto;" width="950px" border="0" cellspacing="0" cellpadding="0">
	<tr height="20px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.6em">

		</td>
	</tr>
</table>

<%
response.write(SQL2)

%>


<table id="filtertab" style="text-align: left; margin-left: 250px; margin-right: auto; margin-top: auto;" width="950px" border="0" cellspacing="0" cellpadding="0">
	<tr height="20px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.6em">
			<FONT face="Arial" color="#000"><b>DAFTAR KCT</b></FONT>
		</td>
	</tr>
	<tr height="40px">
		<td colspan="4" style="padding-left: 20px; text-align: left; font-size: 1.0em">
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top" width="140px">
			<FONT face="Calibri" color="#000">
				Nama/NPP/Cabang
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 0.9em; vertical-align: top" width="40px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="700px">
			<FONT face="Calibri" color="#000">
				<!--select id="barutpmobil" name="barutpmobil" STYLE="color: #000000; background-color: #ffffff; font-size: 1.2em; width:320px"-->
				<div>
					<!--input style="padding-right: 10px; text-align: left; font-family: Calibri; font-size: 1.2em" type="text" id="brgmerk" name="brgmerk" class="textbox"-->
					<input style="padding-right: 10px; text-align: left; font-family: Calibri; font-size: 1.1em" type="text" id="namanpp" name="namanpp" class="textbox" value="<% Response.Write(carival) %>">
				</div>
			</FONT>
		</td>
	</tr>
	<tr height="20px">
		<td colspan="3" style="padding-left: 20px; text-align: left;">
		</td>
	</tr>
	<tr height="40px">
		<td style="padding-left: 0px; text-align: left;">
			<a id="caribtn" href="#" class="medium button green" onclick="viewfilter();">Cari / Filter</a>
		</td>
		<td colspan="2" style="padding-left: 0px; text-align: left;">
			<a id="clearbtn" href="" class="medium button orange" onclick="clearparam(); return false;">Clear Parameter</a>
		</td>
	</tr>
	<tr height="20px">
		<td colspan="3" style="padding-left: 20px; text-align: left;">
			<input type="hidden" id="userid" name="userid" value="">
			<input type="hidden" id="pageno" name="pageno" value="">
		</td>
	</tr>
</table>


<table style="margin-left: 250px;" width="940px" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#FFF" >
	<tr height="38px" align="left">
		<td style="font-family: Calibri; font-size: 1.0em;text-align: left;" width="100px">
			<!--a id="barubbm" href="" class="small button blue" onclick="addkct(); return false;"><i class="fas fa-plus fa-sm"></i>&nbsp;&nbsp;New</a-->
		</td>                        	
	</tr>
</table>
<table style="margin-left: 250px;" width="1110px" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
	<tr height="36px" align="left" style="background-color:#004080;color:White;" >
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="50px"> NO </td>                        
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="300px"> NAMA </td>            
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="90px">NPP/ID</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="180px">JABATAN</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="320px">KC/KCP/KK</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="50px">TTD</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="60px">EDIT</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="60px">HAPUS</td>		
	</tr>

<% 
	ii = pagerows
	k = 1
	a = endval - startval
	bb = 0
	for i = startval to endval
		ii = ii + k
		bb = bb + 1
%>
	<tr id="row<% Response.Write(bb)%>" height="30px">
		<td style="padding-right: 5px; font-family: Calibri; font-size: 1.1em;text-align: right;"><% Response.Write (ii) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.1em;text-align: left;"><% Response.Write (namax(i)) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.1em;text-align: left;"><% Response.Write (nppx(i)) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.1em;text-align: left;"><% Response.Write (jabatanx(i)) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.1em;text-align: left;"><% Response.Write (brklnx(i)) %></td>
		<td style="padding-left: 0px; font-family: Calibri; font-size: 1.1em;text-align: center;">
			<a id="linkimage" href="<% Response.Write(filegambarx(i))%>" target="_blank">
			<img id="uploadPreview1" src="<% Response.Write(filegambarx(i))%>" height="26px" width="25px"/><br/>
			</a>
		</td>
		<td style="padding-left: 0px; font-family: Calibri; font-size: 0.9em;text-align: center;">
			<!--a id="edit<% Response.Write (i)%>" href="" class="small button blue" onclick="addkct(); return false;"><i class="fas fa-edit fa-sm"></i></a-->
			<a id="edit<% Response.Write (i)%>" href="#" onclick="editdata(<% Response.Write(idx(i) & "," & bb & "," & a) %>);">
			<img id="uploadPreview1" src="./images/edit2.jpg" height="26px" width="25px"/><br/>
			</a>
		</td>
		<td style="padding-left: 0px; font-family: Calibri; font-size: 0.9em;text-align: center;">
			<!--a id="hapus<% Response.Write (i)%>" href="" class="small button red" onclick="addkct(); return false;"><i class="fas fa-trash fa-sm"></i></a-->		
			<img id="uploadPreview1" src="./images/delete4.png" OnClick="alert('Hi');" height="26px" width="25px"/><br/>
		</td>
	</tr>
<%
	next
%>

</table>

<table style="text-align: left; margin-left: 250px; margin-right: auto; margin-top: auto;" width="1140px" border="0" cellspacing="0" cellpadding="0">
	<tr height="30px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.4em">
		</td>
	</tr>
</table>

<table style="text-align: left; margin-left: 250px; margin-right: auto; margin-top: auto;" width="1100px" border="0" cellspacing="0" cellpadding="0">
	<tr height="34px" style="background-color: #FFFFFF">
		<td style="padding-left: auto; text-align: left; font-size: 1.1em;" width="120px">
			<div class="pagination">
			  <a href="#" onclick="viewpage(<% Response.Write(pageno-1) %>)">&laquo;</a>
<%
			for a=1 to jmlpage
%>
			  <a 
			  <% If a=pageno Then 
					Response.Write ("class='active'")
				 End If
			  %>
				href="#" onclick="viewpage(<% Response.Write(a) %>)"><% Response.Write(a) %></a>
<%
			next a
%>
			  <a href="#" onclick="viewpage(<% Response.Write(pageno+1) %>)">&raquo;</a>
			</div>	
		</td>
	</tr>
</table>

<form name="pagefrm" id="pagefrm" method="post" action="main.aspx" enctype="multipart/form-data">
	<input type="hidden" id="muserid" name="muserid" value="<%  %>">
	<input type="hidden" id="pageno" name="pageno">
</form>

</body>
</html>
