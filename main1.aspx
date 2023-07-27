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

<script>
function addkct()
{
	document.getElementById('kctbarutab').style.display = 'block';
	//document.getElementById('barukct').style.display = 'none';
}
</script>

</head>
<body>


<div class="wrapper">
   <div class="top_navbar">
      <div class="menu">
         <div class="logo">
            KCT Online
         </div>
         <div class="right_menu">
            <ul>
               <li>
                  <i class="fas fa-user"></i>
                  <div class="profile_dd">
                     <div class="dd_item">Profile</div>
                     <div class="dd_item">Change Password</div>
                     <div class="dd_item">Logout</div>
                  </div>
               </li>
            </ul>
         </div>
      </div>
   </div>
   <div class="main_container">
      <div class="sidebar">
         <div class="sidebar__inner">
            <div class="profile">
               <div class="img">
                  <img src="https://i.imgur.com/Ctwf8HA.png" alt="profile_pic">
               </div>
               <div class="profile_info">
                  <p>Welcome</p>
                  <p class="profile_name">Alex John</p>
               </div>
            </div>
            <div class="submenu">
               <div class="item">
                  DATA
               </div>
            </div>
             <ul>
               <li>
                  <a href="addkct.aspx" class="active">
                  <span class="icon"><i class="fas fa-plus-circle"></i></span>
                  <span class="title">Tambah KCT</span>
                  </a>
               </li>
               <li>
                  <a href="main.aspx">
                  <span class="icon"><i class="fas fa-list-ul"></i></span>
                  <span class="title">Daftar KCT</span>
                  </a>
               </li>
               <li>
                  <a href="#">
                  <span class="icon"><i class="fab fa-delicious"></i></span>
                  <span class="title">Posisi</span>
                  </a>
               </li>
               <li>
                  <a href="#">
                  <span class="icon"><i class="fas fa-university"></i></span>
                  <span class="title">KC/KCP/KK</span>
                  </a>
               </li>
            </ul>
            <div class="submenu">
               <div class="item">
                  LAPORAN
               </div>
            </div>
         </div>
      </div>
      <div class="container">
         <!-- Your content goes here -->
      </div>
   </div>
</div>

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
	Dim brklnx(4000) as string
	Dim jabatanx(4000) as string
	Dim keteranganx(4000) as string
	Dim statusx(4000) as string
	Dim tglendx(4000) as string
	Dim appx(4000) as string
	Dim userx(4000) as string

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
			
			SQL1 = "SELECT kln.kln_nama AS brnama, jabatan.jabatan_nama AS jabatan, kct.nama AS nama, " & _
					"kct.npp AS npp, kct.gambar AS gambar, kct.kategori AS kategori, kct.keterangan AS keterangan, " & _
					"kct.kctstatus AS kctstatus, kct.tgl AS tgl, kct.tglefektif AS tglefektif, kct.tglend AS tglend, " & _
					"kct.nomorsk AS nomorsk FROM kct " & _
					"INNER JOIN " & _
					"kln ON kct.branchid = kln.kln_id INNER JOIN " & _
					"branch ON kln.kln_branch = branch.br_id INNER JOIN " & _
					"jabatan ON kct.jabatan = jabatan.jabatan_id"
					
			'SQL1 = "SELECT * FROM kcti"
			myCmd.CommandText = SQL1

			'Open the connection.
			
			myConn.Open()
			
			myReader = myCmd.ExecuteReader()
			
			a = 0
			'lbl1.Text = "-------------------------------------" & SQL1
            If myReader.HasRows Then
                While myReader.Read()
					a = a+1
					namax(a) = myReader("nama").ToString()
					nppx(a) = myReader("npp").ToString()
					tglx(a) = myReader("tgl").ToString()
					gambarx(a) = myReader("gambar").ToString()
					kategorix(a) = myReader("kategori").ToString()
					brklnx(a) = myReader("brnama").ToString()
					jabatanx(a) = myReader("jabatan").ToString()
					keteranganx(a) = myReader("keterangan").ToString()
					statusx(a) = myReader("kctstatus").ToString()
					tglendx(a) = myReader("tglend").ToString()
					'appx(a) = myReader("kctapp").ToString()
					'userx(a) = myReader("kctuser").ToString()
					'lbl1.Text = namax(a)
                End While
				jmla = a
            Else
               lbl1.text = "Data Amsyiong"
            End If
			myConn.Close()
			
        End If

    Catch ex As Exception
        lbl1.Text="Error while connecting Server."
		Response.Write (ex.Message)

    Finally
		'myReader.Close()
        'myConn.Close() 'Whether there is error or not. Close the connection.

    End Try
%>

<form id="myfrm" runat="server">
<!--p class="submit"><asp:Button id="btnLogin" Text="Login" runat="server" /></p-->
<!--p><asp:label id="lbl1" runat="server" /></p-->
</form>

<table id="kctbarutab" style="text-align: left; margin-left: 250px; margin-right: auto; margin-top: auto; display:none;" width="1140px" border="0" cellspacing="0" cellpadding="0">
	<tr height="20px">
		<td colspan="4" style="padding-left: 0px; text-align: left; font-size: 1.4em">
			<FONT face="Arial" color="#000"><b>DATA BARU</b></FONT>
		</td>
	</tr>
	<tr height="30px">
		<td colspan="4" style="padding-left: 20px; text-align: left; font-size: 1.0em">
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top" width="170px">
			<FONT face="Calibri" color="#000">
				NPP
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top" width="20px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="340px">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="barunpp" name="barunpp" class="textboxmid">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="80px">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top" width="170px">
			<FONT face="Calibri" color="#000">
				Nama Pejabat
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top" width="20px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="340px">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="barunama" name="barunama" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="80px">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top" width="170px">
			<FONT face="Calibri" color="#000">
				Posisi
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top" width="20px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="340px">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="baruposisi" name="baruposisi" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="80px">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top" width="170px">
			<FONT face="Calibri" color="#000">
				Nomor SK/Surat
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.0em; vertical-align: top" width="20px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="340px">
			<FONT face="Calibri" color="#000">
				<input style="font-family: Calibri; font-size: 1.0em" type="text" id="barunosk" name="barunosk" class="textbox">
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em" width="80px">										
		</td>
	</tr>
	<tr height="35px">
		<td style="padding-left: 0px; text-align: left; font-size: 0.9em; vertical-align: top" width="170px">
			<FONT face="Calibri" color="#000">
				Tgl Efektif
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 0.9em; vertical-align: top" width="20px">
			<FONT face="Calibri" color="#000">
				 :
			</FONT>											
		</td>
		<td style="padding-left: 0px; text-align: left; vertical-align: top" width="340px">
			<FONT face="Calibri" color="#000">
				<!--input style="font-family: Calibri; font-size: 0.9em" type="text" id="datepicker-ex30" name="barubbmtglbayar" class="textboxtgl"-->
				<input STYLE=" font-size:0.9em; border:1px solid #ababab; width: 140px" autocomplete="off" class="inp-icon" id="barubbmtglbayar" name="barubbmtglbayar" type="text">
<script src="js/jquery-1.11.1.min.js"></script>
<script src="datepicker4/dcalendar.picker.js"></script>
<script>
$('#barubbmtglbayar').dcalendarpicker();
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
				<select STYLE="color: #000000; background-color: #ffffff; font-size: 0.9em; width: 90px" autocomplete="off" id="soflow1" name="barubbmta" data-placeholder="Tahun Anggaran"> 
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
				<textarea STYLE="color: #000000; font-family: Calibri;  border:1px solid #ababab; font-weight: normal; font-size:1.2em; line-height: 110%;" id="barubbmuntukbayar" name="barubbmuntukbayar" rows="2" cols="48"></textarea>
			</FONT>
		</td>
		<td style="padding-left: 0px; text-align: center; font-size: 1.2em">										
		</td>
	</tr>
</table>



<table style="margin-left: 250px;" width="940px" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#FFF" >
	<tr height="38px" align="left">
		<td style="font-family: Calibri; font-size: 1.0em;text-align: left;" width="100px">
			<a id="barubbm" href="" class="small button blue" onclick="addkct(); return false;"><i class="fas fa-plus fa-sm"></i>&nbsp;&nbsp;New</a>
		</td>                        	
	</tr>
</table>
<table style="margin-left: 250px;" width="940px" align="center" cellpadding="2" cellspacing="2" border="0" bgcolor="#EAEAEA" >
	<tr height="32px" align="left" style="background-color:#004080;color:White;" >
		<td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="40px"> NO </td>                        
		<td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="240px"> NAMA </td>            
		<td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="90px">NPP/ID</td>
		<td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="160px">JABATAN</td>
		<td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="250px">KC/KCP/KK</td>
		<td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="40px">TTD</td>
		<td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="60px">EDIT</td>
		<td style="font-family: Calibri; font-size: 1.0em;text-align: center;" width="60px">HAPUS</td>		
	</tr>

<% 
	for i as integer = 1 to jmla
%>
	<tr>
		<td style="padding-right: 5px; font-family: Calibri; font-size: 0.9em;text-align: right;"><% Response.Write (i) %></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 0.9em;text-align: left;"><a href="#"><% Response.Write (namax(i)) %></a></td>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 0.9em;text-align: left;"><% Response.Write (nppx(i)) %>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 0.9em;text-align: left;"><% Response.Write (jabatanx(i)) %>
		<td style="padding-left: 5px; font-family: Calibri; font-size: 0.9em;text-align: left;"><% Response.Write (brklnx(i)) %>
		</td>
	</tr>
<%
	next
%>

</table> 

</body>
</html>
