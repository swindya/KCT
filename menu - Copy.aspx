<%
	Dim lakses as String
	lakses = Session("levelakses")
%>

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
							<div class="dd_item">
								<a href="profile.aspx">
								<FONT face="Arial" size="3">
								Profile
								</FONT>
								</a>
							</div>
							<div class="dd_item">
								<a href="logout.aspx">
								<FONT face="Arial" size="3">
								Logout
								</FONT>
								</a>
							</div>
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
						<img src="./images/user5.png" alt="profile_pic">
					</div>
					<div class="profile_info">
						<p>Welcome</p>
						<p class="profile_name"><% Response.Write(namauserx) %></p>
					</div>
				</div>
				<div class="submenu">
					<div class="item">
						DATA
					</div>
				</div>
				<ul>
					<li>
						<a href="addkct.aspx"
						<% if setmenu="addKCT" then 
								Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fas fa-plus-circle"></i></span>&nbsp;&nbsp;
						<span class="title">Tambah KCT</span>
						</a>
					</li>
					<li>
						<a href="daftarkct.aspx?page=1&cari="
						<% if setmenu="KCT" then 
							Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fas fa-list-ul"></i></span>&nbsp;&nbsp;
						<span class="title">Daftar KCT</span>
						</a>
					</li>
					<!--li>
						<a href="#"
						<% if setmenu="jabatan" then 
							Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fab fa-delicious"></i></span>&nbsp;&nbsp;
						<span class="title">Posisi</span>
						</a>
					</li-->
					<li>
						<a href="daftarkckcp.aspx"
						<% if setmenu="daftarKCP" then 
							Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fas fa-university"></i></span>&nbsp;&nbsp;
						<span class="title">KC/KCP/KK</span>
						</a>
					</li>
				</ul>
				<div class="submenu">
					<div class="item">
						LAPORAN
					</div>
				</div>
				<ul>
					<li>
						<a href="laporan.aspx"
						<% if setmenu="laporan" then 
							Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fas fa-file-alt"></i></span>&nbsp;&nbsp;
						<span class="title">Per Periode</span>
						</a>
					</li>
					<li>
						<a href="laporankcpperkc.aspx"
						<% if setmenu="laporankcpperkc" then 
							Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fas fa-file-alt"></i></span>&nbsp;&nbsp;
						<span class="title">Per Cabang</span>
						</a>
					</li>
					<li>
						<a href="laporanpernpp.aspx"
						<% if setmenu="laporanpernpp" then 
							Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fas fa-file-alt"></i></span>&nbsp;&nbsp;
						<span class="title">Per Nama/NPP</span>
						</a>
					</li>
				</ul>
<%
			If lakses="Admin" Then
%>
				<div class="submenu">
					<div class="item">
						SETTING
					</div>
				</div>
				<ul>
					<li>
						<a href="adduser.aspx" 
						<% if setmenu="adduser" then 
							Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fas fa-user"></i></span>&nbsp;&nbsp;
						<span class="title">Tambah User</span>
						</a>
					</li>
					<li>
						<a href="daftaruser.aspx" 
						<% if setmenu="daftaruser" then 
							Response.write("class=active") 
							End if 
						%>
						>
						<span class="icon"><i class="fas fa-users"></i></span>&nbsp;&nbsp;
						<span class="title">Daftar User</span>
						</a>
					</li>
				</ul>
<%
			End If
%>				
			</div>
      </div>
      <div class="container">
         <!-- Your content goes here -->
      </div>
   </div>
</div>