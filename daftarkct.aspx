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
padding: 6px 12px 5px;
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
	var namafil = document.getElementById("uploadImage0").value;
	var namafilearr = namafil.split(".");
	var noarr = namafilearr.length;
	var jenisfile = namafilearr[noarr-1];

	oFReader.readAsDataURL(document.getElementById("uploadImage0").files[0]);
	
	if (jenisfile==='pdf')
	{
		oFReader.onload = function (oFREvent) {             
		document.getElementById("uploadPreview0").src = './pdficon1a.png'; 	
		};
	}
	else
	{
		oFReader.onload = function (oFREvent) {             
		document.getElementById("uploadPreview0").src = oFREvent.target.result; 		
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
function hideme()
{
	//document.getElementsByName("namanpp")[0].value = "";
	document.getElementById('kctedittab').style.display = 'none';
}
</script>

<script>
function viewpage(nohal, totpage)
{
	var myval = document.getElementsByName("namanpp")[0].value;

	if (nohal > totpage || nohal < 1)
	{
		return false;
	}

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
//function editdata(id, nama, npp, tgl, gambar, jenisoutlet, outlet, jabatan, tglefektif, ket, nosk)
function editdatax(id, nama, npp, tgl, gambar, jenisoutlet, outlet, jabatan, tglefektif, tglend, ket, nosk, status, levelakses, tglentry, namaentry, cuserid)
{
//alert(status+levelakses+"--"+cuserid+"=="+namaentry);
	document.getElementById("kctedittab").style.display = "block";
	document.getElementById("caribtn").style.display = "none";
	document.getElementById("clearbtn").style.display = "none";
	document.getElementById("filtertab").style.display = "none";
	
	if (status==0)
	{
		document.getElementById("aa1").style.display = "block";
		document.getElementById("aa2").style.display = "none";
		document.getElementById("aa3").style.display = "none";
		document.getElementById("uploadImage0").style.display = "none";
		document.getElementById("simpanbtn").style.display = "block";
		document.getElementById("approvebtn").style.display = "none";
		document.getElementById("rejectbtn").style.display = "none";
		if (levelakses=="spv")
		{
			document.getElementById("simpanbtn").style.display = "none";
			document.getElementById("approvebtn").style.display = "block";
			document.getElementById("rejectbtn").style.display = "block";
		}
		else if (levelakses=="de")
		{
			document.getElementById("simpanbtn").style.display = "block";
			document.getElementById("approvebtn").style.display = "none";
			document.getElementById("rejectbtn").style.display = "none";
		}
	}
	else if (status==1)
	{
		document.getElementById("aa1").style.display = "none";
		document.getElementById("aa2").style.display = "none";
		document.getElementById("aa3").style.display = "block";
		document.getElementById("simpanbtn").style.display = "block";
		if (levelakses=="spv")
		{
			document.getElementById("simpanbtn").style.display = "none";
			document.getElementById("approvebtn").style.display = "block";
			document.getElementById("rejectbtn").style.display = "none";			
		}
		else if (levelakses=="de")
		{
			document.getElementById("simpanbtn").style.display = "block";
			document.getElementById("approvebtn").style.display = "none";
			document.getElementById("rejectbtn").style.display = "none";
		}
	}
	else if (status==2)
	{
		document.getElementById("aa1").style.display = "none";
		document.getElementById("aa2").style.display = "block";
		document.getElementById("aa3").style.display = "none";
		document.getElementById("uploadImage0").style.display = "none";
		document.getElementById("simpanbtn").style.display = "none";
		document.getElementById("approvebtn").style.display = "none";
		document.getElementById("rejectbtn").style.display = "none";
		if (levelakses=="spv")
		{
			document.getElementById("simpanbtn").style.display = "none";
			document.getElementById("approvebtn").style.display = "none";
			document.getElementById("rejectbtn").style.display = "none";			
		}
	}

	var tglpartarr = tglefektif.split(" ");
	var tglef = tglpartarr[0];
	var tglearr = tglef.split("/");
	var tgle = tglearr[0] + "-" + tglearr[1] + "-" + tglearr[2];
	tglefektif = tgle;
	
	tglpartarr = tglend.split(" ");
	tglef = tglpartarr[0];
	tglearr = tglef.split("/");
	tgle = tglearr[0] + "-" + tglearr[1] + "-" + tglearr[2];
	tglend = tgle;

	document.getElementsByName("kctid")[0].value = id;
	document.getElementsByName("editnama")[0].value = nama;
	document.getElementsByName("editnpp")[0].value = npp;
	document.getElementsByName("editposisi")[0].value = jabatan;
	document.getElementsByName("editoutlet")[0].value = outlet;
	document.getElementsByName("editnosk")[0].value = nosk;
	document.getElementsByName("edittglefektif")[0].value = tglefektif;
	document.getElementsByName("edittglend")[0].value = tglend;
	document.getElementsByName("editket")[0].value = ket;
	document.getElementsByName("editfile")[0].value = gambar;
	document.getElementById("uploadPreview0").src = "./DOC/TTD/" + gambar;
	//document.getElementsByName("uploadImage0")[0].value = gambar;
	document.getElementById("linkimage0").href = "./DOC/TTD/" + gambar;
	document.getElementById('viewtgl').innerHTML = tglentry + " , " + namaentry;

}
</script>

<script>
function hapuskct(id)
{
	if (confirm("Apakah anda ingin hapus data ?") == true) 
	{
		var tenure = prompt("Silahkan masukkan kode hapus", "");
		
		if (tenure == "opr1234") {
			var outx;
			var linkx = "hapuskctgo.aspx?id="+id;
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					//document.getElementById("txtHint").innerHTML = this.responseText;
					outx = this.responseText;
					if (outx==1 || outx=="1")
					{
						alert("Data sudah dihapus.");
						window.location.reload();
					}
				}
			};
			xhttp.open("GET", linkx, true);
			xhttp.send();
		}
	}
}
</script>

<script>
function rejectgo()
{
	if (confirm("Reject dan Revisi data ?") == true) 
	{
		var outx;
		var kctid = document.getElementsByName("kctid")[0].value;
		var linkx = "rejectkctgo.aspx?id="+kctid;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				//document.getElementById("txtHint").innerHTML = this.responseText;
				outx = this.responseText;
				if (outx==1 || outx=="1")
				{
					window.location.reload();
				}
			}
		};
		xhttp.open("GET", linkx, true);
		xhttp.send();
	}
}
</script>

<script>
function approvego()
{
	if (confirm("Approve data ?") == true) 
	{
		var outx;
		var kctid = document.getElementsByName("kctid")[0].value;
		var linkx = "approvekctgo.aspx?id="+kctid;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				//document.getElementById("txtHint").innerHTML = this.responseText;
				outx = this.responseText;
				if (outx==1 || outx=="1")
				{
					window.location.reload();
				}
			}
		};
		xhttp.open("GET", linkx, true);
		xhttp.send();
	}
}
</script>

<script>
function clearparam()
{
	document.getElementsByName("namanpp")[0].value = "";
}
</script>

<script>
function editgo()
{
	document.forms["editfrm"].submit();
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
	Dim idx(5000) as string
	Dim namax(5000) as string
	Dim nppx(5000) as string
	Dim tglx(5000) as string
	Dim gambarx(5000) as string
	Dim filegambarx(5000) as String
	Dim kategorix(5000) as string
	Dim brklnx(5000) as string
	Dim jabatanx(5000) as string
	Dim keteranganx(5000) as string
	Dim statusx(5000) as String
	Dim statusaktifx(5000) as String
	Dim statusstrx(5000) as string
	Dim tglendx(5000) as string
	Dim tglefektifx(5000) as String
	Dim appx(5000) as string
	Dim userx(5000) as string
	Dim jenisoutletx(5000) as String
	Dim noskx(5000) as String
	Dim idz(5000) as Integer
	Dim datastrx(5000) as String
	Dim namaoutlet(5000) as String
	Dim revisix(5000) as String
	Dim tglentry(5000) as String
	Dim tglentryx(5000) as Date
	Dim cuser(5000) as String
	Dim namaentry(5000) as String
	Dim namacabang(1000) as String
	Dim namacabangx(1000) as String
	'Dim oDate As DateTime = Convert.ToDateTime(tglentry)
	Dim jabatan(100) as String
	Dim colorx as String
	Dim rowperpage as Integer = 20
	Dim revisiq as String
	'Dim pageno as Integer = 1
	Dim pageno as String
	Dim jmlpage as Integer = 1
	Dim pagerows as Integer = 20
	Dim rowsperpage as Integer = 20
	Dim hal as Integer = 1
	Dim b as Single = 0
	Dim c as Integer = 0
	'Dim idx as Integer = 0
	Dim jmljabatan as Integer = 0
	Dim itop as Integer = 1
	Dim i as Integer
	Dim ii as Integer = 0
	Dim k as Integer
	Dim userid as Integer = 1
	dim carival as String
	Dim user0 as String
	Dim namauserx as String = ""
	Dim startval as Integer = 0
	Dim endval as Integer = 0
	Dim jmldt as Integer = 0
	Dim revint as Integer = 0
	Dim saint as Integer = 0
	Dim sastr as String

	Dim SQL0 As String
	Dim SQL1 As String
	Dim SQL2 As String
	Dim lakses as String = ""
	
	Dim jmlkct as Integer=0
	
	Dim setmenu as String = "KCT"

	'lbl1.Text = Hour(Now) & ":" & Minute(Now) & ":" & Second(Now)

	aaa=1

	'pageno = Request.Form("pageno")
	'pageno = Request.Form["pageno"].ToString()
	pageno = 1
	hal = 1
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
	If not Session("namauser") is nothing Then
		namauserx = Session("namauser")
	End If
	
	If not Session("levelakses") is nothing Then
		lakses = Session("levelakses")
	End If
	

    Try
        If (aaa=1)
			pagerows = (hal-1) * 20
			'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
%>
<!--#include file="koneksi.aspx"-->
<%

			myCmd = myConn.CreateCommand

'** Baca semua data sesuai Query dan cari jumlah total data	
			If NOT carival is nothing Then
				SQL0 = "SELECT id FROM kct WHERE (nama LIKE '%" & carival & "%' OR npp LIKE '%" & carival & "%')"
			Else
				SQL0 = "SELECT id FROM kct WHERE (id > 0)"
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

			If hal = jmlpage Then
				rowsperpage = jmldata - ((jmlpage - 1)*20)
			End If

			startval = ((hal-1)*20) + 1
			endval = startval + rowsperpage - 1
'*********
			
			myConn.Open()
			a = 0
			If NOT carival is nothing Then
				SQL2 = "SELECT * FROM kct " & _
						" WHERE (nama LIKE '%" & carival & "%' OR npp LIKE '%" & carival & "%') ORDER BY tgl DESC"
			Else
				SQL2 = "SELECT * FROM kct " & _
						" WHERE (id > 0) ORDER BY tgl DESC"

			End IF
			myCmd.CommandText = SQL2
			myReader = myCmd.ExecuteReader()
			
			If myReader.HasRows Then
				While myReader.Read()
					a = a + 1
					idx(a) = myReader("id").ToString()
					tglentry(a) = myReader("tgl").ToString()
					namax(a) = myReader("nama").ToString()
					nppx(a) = myReader("npp").ToString()
					tglx(a) = myReader("tgl").ToString()
					gambarx(a) = myReader("gambar").ToString()
					filegambarx(a) = "./DOC/TTD/" & gambarx(a)
					kategorix(a) = myReader("kategori").ToString()
					jenisoutletx(a) = myReader("jenisoutlet").ToString()
					brklnx(a) = myReader("outlet").ToString()
					jabatanx(a) = myReader("jabatan").ToString()
					keteranganx(a) = myReader("keterangan").ToString()
					statusx(a) = myReader("kct_status").ToString()
					tglefektifx(a) = myReader("tglefektif").ToString()
					tglendx(a) = myReader("tglend").ToString()
					noskx(a) = myReader("nomorsk").ToString()
					revisix(a) = myReader("revisi").ToString()
					statusaktifx(a) = myReader("statusaktif").ToString()
					cuser(a) = "0"
					if Len(myReader("createduser").ToString())>0 Then
						cuser(a) = myReader("createduser").ToString()
					end if
					'tglentryx(a) = DateTime.Parse(tglentry(a))
					tglentryx(a) = "2021-01-01"
					if tglentry(a) isnot nothing Then
						'tglentryx(a) = DateTime.ParseExact(tglentry(a), "d M yyyy", Nothing)
						tglentryx(a) = Convert.ToDateTime(tglentry(a))
					end if
'response.write("-----------------------------------" & Convert.toInt32(revisix(i)) + "\n")
'response.write("-----------------------------------" & noskx(a) & "<br>")
				End While
			Else
			   'lbl1.text = "Data Amsyiong"
			End If
			myConn.Close()
			jmlkct = a
'--------------------------------------------------------------------------
'** Cari Nama User
'--------------------------------------------------------------------------
			for a=1 to jmlkct
				SQL0 = "SELECT * FROM [user] WHERE ID=" & cuser(a)
'response.write(SQL0 + "<br>")
				namaentry(a) = ""
				myCmd.CommandText = SQL0
				myConn.Open()
				myReader = myCmd.ExecuteReader()
				If myReader.HasRows Then
					While myReader.Read()
						namaentry(a) = myReader("nama").ToString()
					End While
				End If
				myConn.Close()
				
				namacabangx(a) = ""
				If jenisoutletx(a)="KCP" Then
					SQL0 = "SELECT kln.kln_nama AS namakcp, branch.br_nama AS cabang FROM kln INNER JOIN branch ON kln.kln_branch = branch.br_id " & _
							" WHERE kln.kln_nama='" & brklnx(a) & "'"
					myCmd.CommandText = SQL0
					myConn.Open()
					myReader = myCmd.ExecuteReader()
					If myReader.HasRows Then
						While myReader.Read()
							namacabang(a) = myReader("cabang").ToString()
							namacabangx(a) = ", " + namacabang(a)
						End While
					End If
					myConn.Close()
				End If
			next a

'--------------------------------------------------------------------------
'** Cari id dari branch/KC
'--------------------------------------------------------------------------
			SQL0 = "SELECT br_nama FROM branch ORDER BY br_nama ASC"
			myCmd.CommandText = SQL0
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			
			a = 0
			If myReader.HasRows Then
				While myReader.Read()
					a = a + 1
					namaoutlet(a) = myReader("br_nama").ToString()
				End While
			End If
			myConn.Close()

'--------------------------------------------------------------------------
'** Cari id dari Capem/KCP/KK
'--------------------------------------------------------------------------
			SQL1 = "SELECT kln_nama FROM kln ORDER BY kln_nama ASC"
			myCmd.CommandText = SQL1
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			
			If myReader.HasRows Then
				While myReader.Read()
					a = a + 1
					namaoutlet(a) = myReader("kln_nama").ToString()
				End While
			End If
			myConn.Close()
			jmldt = a

'--------------------------------------------------------------------------
'** Cari jabatan
'--------------------------------------------------------------------------
			SQL1 = "SELECT jabatan_nama FROM jabatan ORDER BY jabatan_nama ASC"
			myCmd.CommandText = SQL1
			myConn.Open()
			myReader = myCmd.ExecuteReader()
			a = 0
			If myReader.HasRows Then
				While myReader.Read()
					a = a + 1
					jabatan(a) = myReader("jabatan_nama").ToString()
				End While
			End If
			myConn.Close()
			jmljabatan = a
'--------------------------------------------------------------------------		
			
			jmla = rowsperpage
			
			If namauserx.length() < 2 or namauserx is nothing Then
%>

<script>
alert('Anda tidak beraktivitas terlalu lama (idle). Silahkan signin lagi');
window.top.location.href = "logout.aspx"; 
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


<%

'response.write("------------------------------------------------------" + trim(right(namauserx,5)))
%>

<form method="post" name="editfrm" id="editfrm" action="editkctgo.aspx" enctype="multipart/form-data">
<table id="kctedittab" style="text-align: left; margin-left: 270px; margin-right: auto; margin-top: 0; display: none" width="860px" border="0" cellspacing="0" cellpadding="0">
	<tr height="20px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.6em">

			<FONT face="Arial" color="#44AA44"><b><asp:label runat="server" id="aa1" name="aa1" Text="EDIT DATA"/></label></b></FONT>
			<FONT face="Arial" color="#003EE1"><b><asp:label runat="server" id="aa2" name="aa2" Text="VIEW DATA"/></label></b></FONT>
			<FONT face="Arial" color="#E31600"><b><asp:label runat="server" id="aa3" name="aa3" Text="REVISI DATA"/></label></b></FONT>

		</td>
	</tr>
	<tr height="30px">
		<td colspan="4" style="padding-left: 20px; text-align: left; font-size: 1.0em">
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 1.0em; vertical-align: top" width="180px">
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
				<input style="padding-left: 5px; text-align: left; font-size: 1.0em" type="text" id="editnpp" name="editnpp" class="textboxmid">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="100px">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 1.0em; vertical-align: top">
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
				<input style="padding-left: 5px; text-align: left; font-size: 1.0em" type="text" id="editnama" name="editnama" class="textbox" onchange="getnama(this.value);">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 1.0em; vertical-align: top">
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
				<input style="padding-left: 5px; text-align: left; font-size: 1.0em" type="text" list="jabatanList"  id="editposisi" name="editposisi" class="textbox">
				<datalist id="jabatanList">
<%
				For a=1 to jmljabatan
					Response.Write("<option>" & jabatan(a) & "</option>")
				Next a
%>
				</datalist>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 1.0em; vertical-align: top">
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
				<input style="padding-left: 5px; text-align: left; font-size: 1.0em" type="text" list="outletList" id="editoutlet" name="editoutlet" class="textbox">
				<datalist id="outletList">
<%
				For a=1 to jmldt
					Response.Write("<option>" & namaoutlet(a) & "</option>")
				Next a
%>
				</datalist>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 1.0em; vertical-align: top">
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
				<input style="padding-left: 5px; text-align: left; font-size: 1.0em" type="text" id="editnosk" name="editnosk" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Tgl Efektif - Berakhir
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
				<input autocomplete="off" STYLE="padding-left:5px; font-size:1.0em; border:1px solid #ababab; width: 140px" autocomplete="off" class="inp-icon" id="edittglefektif" name="edittglefektif" type="text">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="datepicker4/dcalendar.picker.js"></script>
<script>
$('#edittglefektif').dcalendarpicker();
$('#calendar-demo').dcalendar(); //creates the calendar
</script>
			</FONT>
			<FONT face="Calibri" color="#000" size="2">
			&nbsp;&nbsp;-&nbsp;&nbsp;
			</FONT>
			<FONT face="Calibri" color="#000">
				<!--input style="font-family: Calibri; font-size: 0.9em" type="text" id="datepicker-ex30" name="barubbmtglbayar" class="textboxtgl"-->
				<input autocomplete="off" placeholder="" STYLE="padding-left:5px; font-size:1.0em; border:1px solid #ababab; width: 140px" class="inp-icon" id="edittglend" name="edittglend" type="text">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="datepicker4/dcalendar.picker.js"></script>
<script>
$('#edittglend').dcalendarpicker();
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
		<td style="padding-left: 0px; padding-top: 5px; text-align: left; font-size: 1.0em; vertical-align: top">
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
				<textarea STYLE="color: #000000; border:1px solid #ababab; font-weight: normal; font-size:1.0em; line-height: 110%;" id="editket" name="editket" rows="3" cols="64"></textarea>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; padding-top: 5px; text-align: left; font-size: 1.0em; vertical-align: top">
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
					<td style="padding-left: 0px; padding-top: auto; vertical-align: top; text-align: left;">
						<FONT face="Calibri" color="#000">
							<input style="font-size: 0.8em; vertical-align: top" id="uploadImage0" name="uploadImage0" type="file" onchange="PreviewImage(1);" onclick="resetpic();" />
						</FONT>
					</td>
					<td style="padding-top: 5px; padding-left: auto; text-align: right; font-size: 1.2em; vertical-align: top" width="40px">
						<FONT face="Arial" color="#000">
							<a id="linkimage0" href="#" target="_blank">
							<img id="uploadPreview0" height="90px" width="120px"/><br/>
							</a>
						</FONT>
					</td>
				</tr>
			</table>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 1.0em; vertical-align: top" width="180px">
			<FONT face="Calibri" color="#000">
				Data Entry
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top" width="30px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="550px">
			<FONT face="Calibri" color="#000">
			<label id="viewtgl">ABC</label>
<%
		
%>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="100px">										
		</td>
	</tr>
	<tr height="20px">
		<td colspan="3" style="padding-left: 20px; text-align: left;">
		</td>
	</tr>
	<tr height="40px">
		<td style="padding-left: 0px; text-align: left; vertical-align: top;" width="100px">
			<a id="batalbtn" href="" class="medium button orange" onclick="hideme();"><i class="fas fa-window-close fa-sm"></i>&nbsp;&nbsp;Tutup</a>
		</td>
		<td colspan="3" style="padding-left: 0px; text-align: left; vertical-align: top;">
			<table style="text-align: left; margin-left: 0px; margin-right: auto; margin-top: 0;" border="0" cellspacing="0" cellpadding="0">
				<tr height="42px">
					<td style="padding-left: 0px; padding-top: 0px; vertical-align: top; text-align: left; font-size: 1.0em" width="110px">
						<a id="simpanbtn" href="#" class="medium button green" onclick="editgo();"><i class="fas fa-save fa-sm"></i>&nbsp;&nbsp;Simpan</a>
						<a id="rejectbtn" href="#" class="medium button red" onclick="rejectgo();"><i class="fas fa-backspace fa-sm"></i>&nbsp;&nbsp;Reject</a>
					</td>
					<td style="padding-left: 5px; padding-left: auto; vertical-align: top; text-align: left; font-size: 1.0em" width="60px">
					</td>
					<td style="padding-left: 5px; padding-left: auto; vertical-align: top; text-align: left; font-size: 1.0em" width="120px">
						<a id="approvebtn" href="#" class="medium button green" onclick="approvego();"><i class="fas fa-check fa-sm"></i>&nbsp;&nbsp;Approve</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr height="10px">
		<td colspan="4">
			<input type="hidden" id="kctid" name="kctid">
			<input type="hidden" id="editfile" name="editfile">
		</td>
	</tr>
</table>
</form>

<%
'response.write("------------------------------" & carival & "++" & SQL2)
for a=1 to 10
response.write(cuser(a))
next a
%>
<table id="filtertab" style="text-align: left; margin-left: 270px; margin-right: auto; margin-top: auto;" width="950px" border="0" cellspacing="0" cellpadding="0">
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
		<td style="padding-left: 0px; padding-top: 5px; text-align: left; font-size: 1.0em; vertical-align: top" width="140px">
			<FONT face="Calibri" color="#000">
				Nama/NPP
			</FONT>											
		</td>
		<td style="padding-left: 0px; padding-top: 5px;  text-align: center; font-size: 0.9em; vertical-align: top" width="40px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; padding-top: 5px; text-align: left; vertical-align: top" width="260px">
			<FONT face="Calibri" color="#000">
				<!--select id="barutpmobil" name="barutpmobil" STYLE="color: #000000; background-color: #ffffff; font-size: 1.2em; width:320px"-->
				<div>
					<!--input style="padding-right: 10px; text-align: left; font-family: Calibri; font-size: 1.2em" type="text" id="brgmerk" name="brgmerk" class="textbox"-->
					<input style="padding-right: 10px; text-align: left; font-family: Calibri; font-size: 1.1em" type="text" id="namanpp" name="namanpp" class="textbox" value="<% Response.Write(carival) %>">
				</div>
			</FONT>
		</td>
		<td style="padding-left: 0px; padding-top: 0px; text-align: left; vertival-align: top" width="440px">
			<a id="clearbtn" href="#" class="small button orange" onclick="clearparam();">Clear</a>
		</td>
	</tr>
	<tr height="20px">
		<td colspan="4" style="padding-left: 20px; text-align: left;">
		</td>
	</tr>
	<tr height="40px">
		<td colspan="4" style="padding-left: 0px; text-align: left;">
			<a id="caribtn" href="#" class="medium button green" onclick="viewfilter();">Cari / Filter</a>
		</td>
	</tr>
	<tr height="20px">
		<td colspan="4" style="padding-left: 20px; text-align: left;">
			<input type="hidden" id="userid" name="userid" value="">
			<input type="hidden" id="pageno" name="pageno" value="">
		</td>
	</tr>
</table>

<table style="margin-left: 270px;" width="940px" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#FFF" >
	<tr height="38px" align="left">
		<td style="font-family: Calibri; font-size: 1.0em;text-align: left;" width="100px">
			<!--a id="barubbm" href="" class="small button blue" onclick="addkct(); return false;"><i class="fas fa-plus fa-sm"></i>&nbsp;&nbsp;New</a-->
		</td>                        	
	</tr>
</table>
<table style="margin-left: 270px;" width="1200px" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
	<tr height="36px" align="left" style="background-color:#004080;color:White;" >
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="40px">NO</td>                       
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="220px">NAMA</td>            
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="80px">NPP/ID</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="150px">JABATAN</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="250px">KC/KCP/KK</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="100px">STATUS AKTIF</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="100px">STATUS</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="50px">TTD</td>
<%
	If lakses="de" Then
%>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="60px">EDIT</td>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="60px">HAPUS</td>		
<%
	ElseIf lakses="spv"
%>
		<td style="font-family: Calibri; font-size: 1.2em;text-align: center;" width="100px">REVIEW</td>
<% 
	End If
%>
	</tr>
<%
	ii = pagerows
	k = 1
	a = endval - startval
	bb = 0
	'Dim tglarr as String()
	for i = startval to endval
		ii = ii + k
		bb = bb + 1
		keteranganx(i) = keteranganx(i).Replace(",", "$")
		noskx(i) = noskx(i).Replace(",", "$")
		statusstrx(i) = "A"
		If statusx(i)=0 Then
			statusstrx(i) = "Pending"
			colorx = "#FFF8AE"
		ElseIf statusx(i)=1 Then
			statusstrx(i) = "Revisi"
			colorx = "#FFB9AE"
		ElseIf statusx(i)=2 Then
			statusstrx(i) = "Approved"
			colorx = "#B0FFAE"
		End If
		
		saint = Val(statusaktifx(i))
		
		If saint =1 Then
			sastr = "Aktif"
		ElseIf saint=0 Then
			sastr = "Non Aktif"
		End If
		
		revisiq = ""
		'revint = Convert.toInt32(revisix(i))
		revint = val(revisix(i))
		If revint=0 AND statusx(i)=1 Then
			revisiq = ""
		ElseIf revint>0 AND statusx(i)=1 Then
			revisiq = " (" & revisix(i) & ")"
		End If
		'Dim dt As DateTime = Convert.ToDateTime(tglefektifx(i))
		'Dim dt As DateTime = format(tglefektifx(i), "yyyy-MM-dd")
		'tglefektifx(i) = dt
		'tglarr= tglx(i).Split("-")
		'tglx(i) = tglarr(2) & "-" & tglarr(1) & "-" & tglarr(0)
		Dim mytgl as string = tglentryx(i).ToString("dd MMM yyyy")
		datastrx(i) = idx(i) & ",'" & namax(i) & "','" & nppx(i) & "','" & tglx(i) & "','" & gambarx(i) & "','" & jenisoutletx(i) & "','" & _
						brklnx(i) & "','" & jabatanx(i) & "','" & tglefektifx(i) & "','" & tglendx(i) & "','" & keteranganx(i) & "','" & _
						noskx(i) & "','" & statusx(i) & "','" & lakses & "','" & mytgl & "','" & namaentry(i) & "'," & cuser(i)
		'datastrx(i) = idx(i) & "," & namax(i)
%>
	<tr id="row<% Response.Write(bb)%>" height="30px">
		<td style="padding-right: 5px; font-family: Calibri; font-size: 1.1em;text-align: right;"><% Response.Write (ii) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.1em;text-align: left;"><% Response.Write (namax(i)) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.1em;text-align: left;"><% Response.Write (nppx(i)) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.1em;text-align: left;"><% Response.Write (jabatanx(i)) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.1em;text-align: left;"><% Response.Write (brklnx(i) & namacabangx(i)) %></td>
<%
		If saint=1 Then
%>	
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.0em;text-align: center; color: #009726; background-color:#FFFFFF">
			<FONT color="red">
			<a id="editnonaktif<% Response.Write (i)%>" href="nonaktifnpp.aspx?npp=<% response.write(nppx(i)) %>" target = "_blank">
				<% Response.Write (sastr) %>		
			</a>
			</FONT>
		</td>
<%
		ElseIf saint=0 Then
%>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 1.0em;text-align: center; color: #D20500; background-color:#FFFFFF">
			<a id="editaktif<% Response.Write (i)%>" href="aktifnpp.aspx?npp=<% response.write(nppx(i)) %>" target = "_blank">
				<% Response.Write (sastr) %>		
			</a>		
		</td>
<%
		End If
%>
		<td style="padding-left: 0px; font-family: Calibri; font-size: 1.1em;text-align: center; background-color:<% response.write(colorx) %>;"><% Response.Write (statusstrx(i) & revisiq) %></td>
		<td style="padding-left: 0px; padding-top: 5px; font-family: Calibri; font-size: 1.1em;text-align: center;">
			<a id="linkimage<% response.write(i) %>" href="<% Response.Write(filegambarx(i))%>" target="_blank">
			<img id="uploadPreview<% response.write(i) %>" src="<% Response.Write(filegambarx(i))%>" height="26px" width="25px"/><br/>
			</a>
		</td>
<%
	If lakses="de" Then
%>
		<td style="padding-left: 0px; font-family: Calibri; font-size: 0.9em;text-align: center;">
			<!--a id="edit<% Response.Write (i)%>" href="" class="small button blue" onclick="addkct(); return false;"><i class="fas fa-edit fa-sm"></i></a-->
			<a id="edit<% Response.Write (i)%>" href="#" onclick="editdatax(<% Response.Write(datastrx(i)) %>);">
			<img id="uploadPreview<% Response.Write (i)%>" src="./images/edit2.jpg" height="26px" width="25px"/><br/>
			</a>
		</td>
		<td style="padding-left: 0px; font-family: Calibri; font-size: 0.9em;text-align: center;">
<%
		If statusx(i)=0 Then
%>			
			<img id="uploadPreview<% Response.Write (i)%>" src="./images/delete4.png" OnClick="hapuskct(<% Response.Write (idx(i)) %>);" height="26px" width="25px"/><br/>
<%
		End If
%>
		</td>
<%
	ElseIf lakses="spv"
%>
		<td style="padding-left: 0px; font-family: Calibri; font-size: 0.9em;text-align: center;">
			<!--a id="hapus<% Response.Write(i)%>" href="#" class="small button red" onclick="addkct(); return false;"><i class="fas fa-trash fa-sm"></i></a-->	
<%
		'If statusx(i)=0 Then
%>			
			<a id="edit<% Response.Write (i)%>" href="#" onclick="editdatax(<% Response.Write(datastrx(i)) %>);">
			<img id="uploadPreview<% Response.Write (i)%>" src="./images/edit2.jpg" height="26px" width="25px"/><br/>
			</a>
<%
		'End If
%>
		</td>
<%
	End If
%>
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
	<tr height="20px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.0em">
			<FONT face="calibri">
				Total jumlah hal: <% response.write(jmlpage) %>
			</FONT>
		</td>
	</tr>
	<tr height="10px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.0em">
		</td>
	</tr>
</table>

<table style="text-align: left; margin-left: 250px; margin-right: auto; margin-top: auto;" width="1100px" border="0" cellspacing="0" cellpadding="0">
	<tr height="34px" style="background-color: #FFFFFF">
		<td style="padding-left: auto; text-align: left; font-size: 1.1em;" width="120px">
			<div class="pagination">
			  <a href="#" onclick="viewpage(<% Response.Write(pageno-1) %>)">&laquo;</a>
<%
			Dim m, n, startpage, endpage as Integer
			m = pageno \ 20
			n = pageno MOD 20
			startpage = (m * 20) + 1
			if n=0 AND m>0 Then
				startpage = ((m-1) * 20) + 1
			End If
			endpage = startpage + 19

			If endpage > jmlpage Then
				endpage = jmlpage
			End If


			for a=startpage to endpage
%>
			  <a 
			  <% If a=pageno Then 
					Response.Write ("class='active'")
				 End If
			  %>
				href="#" onclick="viewpage(<% Response.Write(a) %>, <% Response.Write(jmlpage) %>)"><% Response.Write(a) %></a>
<%
			next a
%>
			  <a href="#" onclick="viewpage(<% Response.Write(pageno+1) %>, <% Response.Write(jmlpage) %>)">&raquo;</a>
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
