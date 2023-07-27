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
padding: 6px 10px 5px;
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
padding: 10px 14px 10px;
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
background-color: #008C04;
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
/* -------------------- Page Styles (not required) */
div { margin: 0px; }

/* -------------------- Select Box Styles: bavotasan.com Method (with special adaptations by ericrasch.com) */
/* -------------------- Source: http://bavotasan.com/2011/style-select-box-using-only-css/ */
.styled-select {
   background: url(15xvbd5.png) no-repeat 96% 0;
   height: 26px;
   overflow: hidden;
   width: 240px;
}

.styled-select select {
   background: transparent;
   border: none;
   font-size: 14px;
   height: 26px;
   padding: 5px; /* If you add too much padding here, the options won't show in IE */
   width: 268px;
}

.styled-select.slate {
   background: url(http://i62.tinypic.com/2e3ybe1.jpg) no-repeat right center;
   height: 30px;
   width: 240px;
}

.styled-select.slate select {
   border: 1px solid #ccc;
   font-size: 16px;
   height: 30px;
   width: 268px;
}

/* -------------------- Rounded Corners */
.rounded {
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
}

.semi-square {
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}

/* -------------------- Colors: Background */
.slate   { background-color: #ddd; }
.green   { background-color: #779126; }
.blue    { background-color: #3b8ec2; }
.yellow  { background-color: #eec111; }
.black   { background-color: #000; }

/* -------------------- Colors: Text */
.slate select   { color: #000; }
.green select   { color: #fff; }
.blue select    { color: #fff; }
.yellow select  { color: #000; }
.black select   { color: #fff; }


/* -------------------- Select Box Styles: danielneumann.com Method */
/* -------------------- Source: http://danielneumann.com/blog/how-to-style-dropdown-with-css-only/ */
#mainselection select {
   border: 0;
   color: #EEE;
   background: transparent;
   font-size: 20px;
   font-weight: bold;
   padding: 2px 10px;
   width: 378px;
   *width: 350px;
   *background: #58B14C;
   -webkit-appearance: none;
}

#mainselection {
   overflow:hidden;
   width:350px;
   -moz-border-radius: 9px 9px 9px 9px;
   -webkit-border-radius: 9px 9px 9px 9px;
   border-radius: 9px 9px 9px 9px;
   box-shadow: 1px 1px 11px #330033;
   background: #58B14C url("15xvbd5.png") no-repeat scroll 319px center;
}


/* -------------------- Select Box Styles: stackoverflow.com Method */
/* -------------------- Source: http://stackoverflow.com/a/5809186 */
select#soflow, select#soflow-color {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   background-image: url(15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
   background-position: 99% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: 13px;
   margin: 0px;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 150px;
}

select#soflow-color {
   color: #fff;
   background-image: url(15xvbd5.png), -webkit-linear-gradient(#779126, #779126 40%, #779126);
   background-color: #779126;
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
   padding-left: 15px;
}
select#soflow1, select#soflow1-color {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   background-image: url(15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
   background-position: 99% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: 13px;
   margin: 0px;
   overflow: hidden;
   padding: 1px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 200px;
}

select#soflow1-color {
   color: #fff;
   background-image: url(15xvbd5.png), -webkit-linear-gradient(#779126, #779126 40%, #779126);
   background-color: #779126;
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
   padding-left: 15px;
}
select#soflow2, select#soflow-color {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 20px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   background-image: url(15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
   background-position: 99% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: 13px;
   margin: 0px;
   overflow: hidden;
   padding: 5px 10px;
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 200px;
}

select#soflow2-color {
   color: #fff;
   background-image: url(15xvbd5.png), -webkit-linear-gradient(#779126, #779126 40%, #779126);
   background-color: #779126;
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
   padding-left: 15px;
}
</style>

 
<style>
.inp-icon{
background: url(cal4.png)no-repeat 100%;
background-size: 16px;
 }
</style>

<script>
function addkct()
{
	var outlet = document.getElementsByName("baruoutlet")[0].value;
	var nama = document.getElementsByName("barunama")[0].value;
	if (nama=="" || nama==null || outlet=="" || outlet==null)
	{
		alert ("Data penting masih kosong. Harap diisi dengan benar.");
		return false;
	}
	document.forms["addkctfrm"].submit();
}
</script>

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
function updateuser(username)
{

	var nama = document.getElementsByName("nama")[0].value;
	var pwd1 = document.getElementsByName("newpwd")[0].value;
	var pwd2 = document.getElementsByName("newpwd1")[0].value;
	var status = 1;
	if (pwd1 !== pwd2)
	{
		alert("Password baru anda tidak sama/konsisten. Penggantian password batal.");
		return false
	}
	if (pwd1.length >= 1 && pwd1.length < 3)
	{
		alert("Password terlalu pendek. Usahakan minimal 3 karakter.");
		return false;
	}
	if (pwd1.length==0 || pwd1=="" || pwd1==null)
	{
		status = 0;
	}
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			//document.getElementById("txtHint").innerHTML = this.responseText;
			var outx = this.responseText;
			if (outx=="1" || outx==1)
			{
				alert("Data sudah di-update");
				window.location.reload();
			}
		}
	};
	var getstr = "updateuserku.aspx?username="+username+"&nama="+nama+"&pwd="+pwd1+"&status="+status;
	xhttp.open("GET", getstr, true);
	xhttp.send();

}
</script>

<script>
function resetpic()
{
	document.getElementById("linkimage").href="javascript:void(0)";
}
</script>

<script>
function searchoutlet(myval)
{
	var outx;
	var linkx = "getoutlet.aspx?namaoutlet="+myval;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			//document.getElementById("txtHint").innerHTML = this.responseText;
			outx = this.responseText;
			document.getElementById("languageList").innerHTML = outx;
			//document.getElementById("baruoutlet").value = outx;
			//document.getElementById("languageList").value = outx;
//alert(outx);
			//document.getElementsByName("barunama")[0].value = outarr[1];	
		}
	};
//alert(linkx);
	xhttp.open("GET", linkx, true);
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
	Dim a, aaa, jmla as integer
	Dim user0 as string
	Dim pwd0 as string
	Dim namauserx as String
	Dim jmldata as Integer = 0
	Dim jmldt as Integer = 0
	Dim jmljabatan as Integer = 0
	Dim namaoutlet(5000) as String
	Dim jabatan(100) as String
	Dim levelakses as String = ""
	Dim nama as String = ""

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
	Dim userid as Integer = 1

	Dim SQL0 As String
	Dim SQL1 As String
	Dim SQL2 As String
	Dim akses as String = ""
	Dim lakses as String = ""
	
	Dim setmenu as String = "addKCT"

	aaa=1
	
	user0 = ""
	pwd0 = ""
   
   
'End If

'** Cek data sesi
	user0 = Session("username")
	namauserx = Session("namauser")
			
	If String.IsNullOrEmpty(namauserx) or namauserx="" Then
%>

<script>
alert('Anda tidak beraktivitas terlalu lama (idle). Silahkan signin lagi');
window.top.location.href = "index.html"; 
</script>

<%			
	End If
	
	
	'myConn = New SqlConnection("Data Source=DESKTOP-S7N8DF9;Initial Catalog=KCT;User ID=sa;Password=sa;")
%>

<!--#include file="koneksi.aspx"-->

<%
	myCmd = myConn.CreateCommand
	
'** Cari id dari branch/KC
'
	SQL0 = "SELECT * FROM [user] WHERE username='" & user0 & "'"
	myCmd.CommandText = SQL0
	myConn.Open()
	myReader = myCmd.ExecuteReader()
	If myReader.HasRows Then
		While myReader.Read()
			levelakses = myReader("levelakses").ToString()
			nama = myReader("nama").ToString()
		End While
	End If
	myConn.Close()
	
	If levelakses="de" Then
		akses = "Data Entry"
	ElseIf levelakses="Admin" Then
		akses = "Admin"
	End If
			
	
%>


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

<!--#include file="menu.aspx"-->


<form method="post" autocomplete="off" name="addkctfrm" id="addkctfrm" action="addkctgo.aspx" enctype="multipart/form-data">
<table id="kctbarutab" style="text-align: left; margin-left: 270px; margin-right: auto; margin-top: 0;" width="900px" border="0" cellspacing="0" cellpadding="0">
	<tr height="20px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.4em">
			<FONT face="Arial" color="#44AA44"><b>PROFIL USER</b></FONT>
		</td>
	</tr>
	<tr height="30px">
		<td colspan="4" style="padding-left: 20px; text-align: left; font-size: 1.0em">
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top" width="200px">
			<FONT face="Calibri" color="#000">
				Nama
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top" width="30px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="570px">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em; width: 250px" type="text" id="nama" name="nama" class="textboxmid" value="<% Response.Write(nama) %>">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="100px">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Level akses
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em; width: 150px; background-color:#FFDACA" type="text" id="nama" name="nama" class="textboxmid" value="<% Response.Write(akses) %>" readonly>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Username
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em; width: 150px; background-color:#FFDACA" type="text" id="username" name="username" class="textbox" value="<% Response.Write(user0) %>" readonly>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Password
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em; width: 150px" type="password" id="passwd" name="passwd" value="abcdefghi" class="textbox" readonly>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="30px">
		<td colspan="4">
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Password Baru
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em; width: 150px; background-color:#CAFFE4" type="password" id="newpwd" name="newpwd" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				Ketik Ulang Password Baru
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em; width: 150px; background-color:#CAFFE4" type="password" id="newpwd1" name="newpwd1" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
	<tr height="10px">
		<td colspan="4">
			<input type="hidden" id="uid" name="uid">
		</td>
	</tr>
</table>
</form>

<table style="margin-left: 270px;" width="940px" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#FFF" >
	<tr height="20px" align="left">
		<td style="font-family: Calibri; font-size: 1.0em;text-align: left;" width="100px">
			
		</td>                        	
	</tr>
	<tr height="38px" align="left">
		<td style="font-family: Calibri; font-size: 1.0em;text-align: left;" width="100px">
			<a id="barusave" href="#" class="medium button green" onclick="updateuser('<% Response.Write(user0) %>');"><i class="fas fa-save fa-sm"></i>&nbsp;&nbsp;Simpan</a>
		</td>                        	
	</tr>
</table>
</form>


</body>
</html>
