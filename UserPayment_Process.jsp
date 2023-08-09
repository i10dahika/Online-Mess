<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.Dbconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	<div class="menu-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading-title text-center">
						<h2>Payment Porcess</h2>
					</div>
				</div>
			</div>
			<%
				String id = request.getParameter("id");
				String email = (String) session.getAttribute("uemail");
				String paymentprocess = request.getParameter("rdo1");
				System.out.println(paymentprocess);
				String menuname = "", Qty = "", total_price = "";
				String bhaji_Name_first = "", bhaji_Name_second = "", roti_name = "", rice_name = "", price = "";

				try {
					Connection con = (Connection) Dbconn.conn();
					Statement st = (Statement) con.createStatement();

					ResultSet rs = st
							.executeQuery("select * from order_menu_info where id='"
									+ id
									+ "' and user_email='"
									+ email
									+ "' and Status_info='Accept'");

					if (rs.next()) {
						id = rs.getString(1);
						menuname = rs.getString("menu_name");
						bhaji_Name_first = rs.getString("bhaji_Name_first");
						bhaji_Name_second = rs.getString("bhaji_Name_second");
						roti_name = rs.getString("roti_name");
						rice_name = rs.getString("rice_name");
						price = rs.getString("price");
						Qty = rs.getString("Qty_info");
						total_price = rs.getString("Total_price");
					}

				} catch (Exception e) {
				}
			%>
			<%
				if (paymentprocess.equals("CashInfo")) {
			%>
			<form action="Payment_Status_info" method="post">

				<div style="border-style: ridge;">
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Payment
								Process</label> <input type="text" class="form-control" id="ids"
								name="paymentprocess" required value="<%=paymentprocess%>"
								readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">ID</label>
							<input type="text" class="form-control" id="ids" name="id"
								required value="<%=id%>" readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Bhaji
								First</label> <input type="text" class="form-control" id="ids"
								name="menu1" required value="<%=bhaji_Name_first%>"
								readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Bhaji
								Second</label> <input type="text" class="form-control" id="ids"
								name="menu2" required value="<%=bhaji_Name_second%>"
								readonly="readonly">

							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Special
								Roti</label> <input type="text" class="form-control" id="ids"
								name="menu_roti" required value="<%=roti_name%>"
								readonly="readonly">


							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Special
								Rice</label> <input type="text" class="form-control" id="ids"
								name="menu1_rice" required value="<%=rice_name%>"
								readonly="readonly">

							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Price</label>

							<input type="text" class="form-control" id="ids" name="price"
								required value="<%=price%>" readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Menu
								Name</label> <input type="text" class="form-control" id="ids"
								name="menuname" required value="<%=menuname%>"
								readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Qty</label>

							<input type="number" class="form-control" id="ids" name="qty"
								required value="<%=Qty%>" readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Total
								Price</label> <input type="number" class="form-control" id="ids"
								name="total_price" required value="<%=total_price%>"
								readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="submit-button text-center">
							<input class="btn btn-common" type="submit" name=bt
								value="Pay Bill"></input>

							<div id="msgSubmit" class="h3 text-center hidden"></div>
							<div class="clearfix"></div>
						</div>
					</div>

				</div>
			</form>


			<%
				} else {
			%>
			<form action="Payment_Status_info" method="post">

				<div style="border-style: ridge;">
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Payment
								Process</label> <input type="text" class="form-control" id="ids"
								name="paymentprocess" required value="<%=paymentprocess%>"
								readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">ID</label>
							<input type="text" class="form-control" id="ids" name="id"
								required value="<%=id%>" readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Bhaji
								First</label> <input type="text" class="form-control" id="ids"
								name="menu1" required value="<%=bhaji_Name_first%>"
								readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Bhaji
								Second</label> <input type="text" class="form-control" id="ids"
								name="menu2" required value="<%=bhaji_Name_second%>"
								readonly="readonly">

							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Special
								Roti</label> <input type="text" class="form-control" id="ids"
								name="menu_roti" required value="<%=roti_name%>"
								readonly="readonly">


							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Special
								Rice</label>&nbsp;&nbsp;&nbsp;<%=rice_name%>
							<input type="text" class="form-control" id="ids"
								name="menu1_rice" required value="<%=rice_name%>"
								readonly="readonly">

							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Price</label>

							<input type="text" class="form-control" id="ids" name="price"
								required value="<%=price%>" readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Menu
								Name</label> <input type="text" class="form-control" id="ids"
								name="menuname" required value="<%=menuname%>"
								readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Qty</label>

							<input type="number" class="form-control" id="ids" name="qty"
								required value="<%=Qty%>" readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Total
								Price</label> <input type="number" class="form-control" id="ids"
								name="total_price" required value="<%=total_price%>"
								readonly="readonly">
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Card
								Numeber</label> <input type="text" name="cardno" class="form-control"
								maxlength="16" placeholder="Card Number" required="required"
								pattern="^[1-9]\d*(\.\d+)?$" />
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">Expiry
								Date</label> <input type="date" name="Expirydate" class="form-control"
								required>
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="txt_Uname" style="color: black; font-size: 18px;">CVV
								Number</label> <input type="text" name="cvvno" class="form-control"
								maxlength="3" placeholder="CVV Number" required="required"
								pattern="^[1-9]\d*(\.\d+)?$" />
							<div class="help-block with-errors"></div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="submit-button text-center">
							<input class="btn btn-common" type="submit" name=bt value="Order"></input>

							<div id="msgSubmit" class="h3 text-center hidden"></div>
							<div class="clearfix"></div>
						</div>
					</div>

				</div>
			</form>


			<%
				}
			%>
		</div>
	</div>


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

	<!-- ALL JS FILES -->
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
