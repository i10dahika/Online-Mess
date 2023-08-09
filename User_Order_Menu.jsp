<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.Dbconn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>Live Dinner Restaurant - Responsive HTML5 Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
</style>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#myTable').dataTable();
	});
</script>
</head>

<body>
	<!-- Start header -->
	<header class="top-navbar">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="index.html"> <img
					src="images/logo.png" alt="" />
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbars-rs-food" aria-controls="navbars-rs-food"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbars-rs-food">
					<ul class="navbar-nav ml-auto">
						<jsp:include page="usermenu.jsp"></jsp:include>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- End header -->

	<!-- Start All Pages -->
	<div class="all-page-title page-breadcrumb">
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-12">
					<h1>Special Menu</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->

	<!-- Start Menu -->
	<div class="menu-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading-title text-center">
						<h2>Special Menu</h2>
					</div>
				</div>
			</div>
			<%
				String id = request.getParameter("id");
				System.out.println("Id=>" + id);
				String menuname = "";
				String bhaji_Name_first = "", bhaji_Name_second = "", roti_name = "", rice_name = "", price = "";
				Connection con = Dbconn.conn();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from menu_info where id='"
						+ id + "'");
				if (rs.next()) {
					menuname = rs.getString("menu_name");
					bhaji_Name_first = rs.getString("bhaji_Name_first");
					bhaji_Name_second = rs.getString("bhaji_Name_second");
					roti_name = rs.getString("roti_name");
					rice_name = rs.getString("rice_name");
					price = rs.getString("price");

				}
			%>

			<div class="row inner-menu-box">
				<div class="col-3">
					<div class="nav flex-column nav-pills" id="v-pills-tab"
						role="tablist" aria-orientation="vertical">
						<a class="nav-link " id="v-pills-home-tab" data-toggle="pill"
							href="#v-pills-home" role="tab" aria-controls="v-pills-home"
							aria-selected="true">All</a>
						<%
							if (menuname.equals("veg")) {
						%>

						<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill"
							href="#v-pills-profile" role="tab"
							aria-controls="v-pills-profile" aria-selected="false">Veg</a>
						<%
							} else {
						%>
						<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill"
							href="#v-pills-messages" role="tab"
							aria-controls="v-pills-profile" aria-selected="false">Non
							Veg</</a>
						<%
							}
						%>
						<a class="nav-link" id="v-pills-settings-tab" data-toggle="pill"
							href="#v-pills-settings" role="tab"
							aria-controls="v-pills-settings" aria-selected="false">Show
							Menu</a>
					</div>
				</div>

				<div class="col-9">
					<div class="tab-content" id="v-pills-tabContent">

						<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
							aria-labelledby="v-pills-profile-tab">
							<div>

								<h2>Veg Menu</h2>



								<form action="order_info" method="post">

									<div style="border-style: ridge;">
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">ID</label> <input
													type="text" class="form-control" id="ids" name="id"
													required value="<%=id%>" readonly="readonly">
												<div class="help-block with-errors"></div>
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Bhaji First</label>
												<input
													type="text" class="form-control" id="ids" name="menu1" 
													required value="<%=bhaji_Name_first%>" readonly="readonly">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Bhaji Second</label>
												<input
													type="text" class="form-control" id="ids" name="menu2" 
													required value="<%=bhaji_Name_second%>" readonly="readonly">
												
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Special Roti</label>
												<input
													type="text" class="form-control" id="ids" name="menu_roti" 
													required value="<%=roti_name%>" readonly="readonly">
												

												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Special Rice</label>&nbsp;&nbsp;&nbsp;<%=rice_name%>
												<input
													type="text" class="form-control" id="ids" name="menu1_rice" 
													required value="<%=rice_name%>" readonly="readonly">
												
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Price</label>
													 
													<input
													type="text" class="form-control" id="ids" name="price" 
													required value="<%=price%>" readonly="readonly">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Menu Name</label>
													 
													<input
													type="text" class="form-control" id="ids" name="menuname" 
													required value="<%=menuname%>" readonly="readonly">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Qty</label>
													 
													<input
													type="number" class="form-control" id="ids" name="qty" 
													required >
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="submit-button text-center">
												<input class="btn btn-common" type="submit" name=bt
													value="Order"></input>

												<div id="msgSubmit" class="h3 text-center hidden"></div>
												<div class="clearfix"></div>
											</div>
										</div>

									</div>
								</form>


							</div>

						</div>
						<div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
							aria-labelledby="v-pills-messages-tab">
							<div>

								<h2>Non Veg Menu</h2>



								<form action="order_info" method="post">

									<div style="border-style: ridge;">
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">ID</label> <input
													type="text" class="form-control" id="ids" name="id"
													required value="<%=id%>" readonly="readonly">
												<div class="help-block with-errors"></div>
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Bhaji First</label>
												<input
													type="text" class="form-control" id="ids" name="menu1" 
													required value="<%=bhaji_Name_first%>" readonly="readonly">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Bhaji Second</label>
												<input
													type="text" class="form-control" id="ids" name="menu2" 
													required value="<%=bhaji_Name_second%>" readonly="readonly">
												
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Special Roti</label>
												<input
													type="text" class="form-control" id="ids" name="menu_roti" 
													required value="<%=roti_name%>" readonly="readonly">
												

												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Special Rice</label>&nbsp;&nbsp;&nbsp;<%=rice_name%>
												<input
													type="text" class="form-control" id="ids" name="menu1_rice" 
													required value="<%=rice_name%>" readonly="readonly">
												
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Price</label>
													 
													<input
													type="text" class="form-control" id="ids" name="price" 
													required value="<%=price%>" readonly="readonly">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Menu Name</label>
													 
													<input
													type="text" class="form-control" id="ids" name="menuname" 
													required value="<%=menuname%>" readonly="readonly">
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="txt_Uname"
													style="color: black; font-size: 18px;">Qty</label>
													 
													<input
													type="number" class="form-control" id="ids" name="qty" 
													required >
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="submit-button text-center">
												<input class="btn btn-common" type="submit" name=bt
													value="Order"></input>

												<div id="msgSubmit" class="h3 text-center hidden"></div>
												<div class="clearfix"></div>
											</div>
										</div>

									</div>
								</form>




							</div>
						</div>
						<div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
							aria-labelledby="v-pills-settings-tab">
							<div class="row">



								<div class="col-lg-4 col-md-6 special-grid dinner">
									<div class="gallery-single fix">
										<img src="images/img-09.jpg" class="img-fluid" alt="Image">
										<div class="why-text">
											<h4>Special Dinner 3</h4>
											<p>Sed id magna vitae eros sagittis euismod.</p>
											<h5>$24.79</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Menu -->


	<!-- Start Footer -->
	<footer class="footer-area bg-f">

		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<p class="company-name">
							All Rights Reserved. &copy; 2018 <a href="#">Live Dinner
								Restaurant</a> Design By : <a href="https://html.design/">html
								design</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- End Footer -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;"><i
		class="fa fa-paper-plane-o" aria-hidden="true"></i></a>

	<!-- ALL JS FILES -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
	<script src="js/contact-form-script.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>