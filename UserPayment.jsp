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
<title>Luncheoun E-Commerce Web site</E-Commerce></title>
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
				<a class="navbar-brand" href="index.html"> <!--<img src="images/logo.png" alt="" />-->
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

	<!-- Start slides -->
	<div id="slides" class="cover-slides">
		<ul class="slides-container">
			<li class="text-left"><img src="images/slider-01.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong> Luncheon <br> E-Commerce Website
								</strong>
							</h1>
							<p class="m-b-40">
								See how your users experience your website in realtime or view <br>
								trends to see any changes in performance over time.
							</p>
						</div>
					</div>
				</div></li>
			<li class="text-left"><img src="images/slider-02.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong>Welcome To <br> Our Mess
								</strong>
							</h1>
							<p class="m-b-40">
								See how your users experience your website in realtime or view <br>
								trends to see any changes in performance over time.
							</p>
						</div>
					</div>
				</div></li>
			<li class="text-left"><img src="images/slider-03.jpg" alt="">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1 class="m-b-20">
								<strong>Enjoy<br> Your Meal
								</strong>
							</h1>
							<p class="m-b-40">
								See how your users experience your website in realtime or view <br>
								trends to see any changes in performance over time.
							</p>
						</div>
					</div>
				</div></li>
		</ul>
		<div class="slides-navigation">
			<a href="#" class="next"><i class="fa fa-angle-right"
				aria-hidden="true"></i></a> <a href="#" class="prev"><i
				class="fa fa-angle-left" aria-hidden="true"></i></a>
		</div>
	</div>
	<!-- End slides -->
	<form action="UserPayment_Process.jsp" method="post">
		<table id="myTable" class="table table-striped">


			<thead>
				<tr>
					<td colspan="2">Payment Process</td>
					<td colspan="2"><input type="radio" name="rdo1" required
						value="OnlineInfo" id="User" />Online</td>

					<td colspan="4"><input type="radio" required name="rdo1"
						value="CashInfo" id="admin" />Cash</td>
				</tr>

				<tr>
					<th>ID</th>
					<th>bhaji Name first</th>
					<th>bhaji Name Second</th>
					<th>Roti Name</th>
					<th>Rice Name</th>
					<th>Price</th>
					<th>Qty</th>
					<th>Total Price</th>
				</tr>
			</thead>
			<tbody>


				<%
					String id = "";
					String name = "", address = "", gender = "", mobno = "";
					String Total_price = "", Qty_info = "";
					String email = (String) session.getAttribute("uemail");
					Connection con = Dbconn.conn();
					Statement st = con.createStatement();
					ResultSet rs = st
							.executeQuery("select * from order_menu_info where user_email='"
									+ email + "' and Status_info='Accept' and Payment_Status_info='0'");
					while (rs.next()) {
						id = rs.getString(1);
						name = rs.getString(2);
						address = rs.getString(3);
						gender = rs.getString(4);
						email = rs.getString(5);
						mobno = rs.getString(6);
						Total_price = rs.getString(11);
						Qty_info = rs.getString(10);
				%>
				<tr>
					<td><input type="radio" id="id" name="id" value="<%=id%>">&nbsp;&nbsp;&nbsp;<%=id%>
					</td>
					<td><%=name%></td>
					<td><%=address%></td>
					<td><%=gender%></td>
					<td><%=email%></td>
					<td><%=mobno%></td>
					<td><%=Qty_info%></td>
					<td><%=Total_price%></td>

				</tr>
				<%
					}
				%>

			</tbody>
			<tr>
				<td colspan="8" align="center"><input type="submit" class="btn btn-common" value="Pay Next"></td>
			</tr>
		</table>
	</form>

	<!-- End Customer Reviews -->


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
