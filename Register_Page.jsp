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
<!-- Pickadate CSS -->
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/classic.time.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
						<li class="nav-item "><a class="nav-link" href="index.jsp">Home</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="Register_Page.jsp">Register Page</a></li>
						<li class="nav-item"><a class="nav-link"
							href="Login_Page.jsp">Login Page</a></li>
<!-- 						<li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
						<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li> -->
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
					<h1>Register Page</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Pages -->

	<!-- Start Reservation -->
	<div class="reservation-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading-title text-center">
						<h2>Register Page</h2>



						<form action="Registration" method="post">

							<div style="border-style: ridge;">
								<div class="col-md-12">
									<div class="form-group">
										<select class="custom-select d-block form-control" id="person"
											name="roll" required data-error="Please select Person">
											<option disabled selected>Select Person*</option>
											<option value="ownerinfo">Owner Info</option>
											<option value="userinfo">User Info</option>

										</select>
										<div class="help-block with-errors"></div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="txtName" name="txtName"
											placeholder="Your Mess Name" required
											data-error="Please enter your name">
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="email" class="form-control" id="email"
											name="txtEmail" placeholder="Your mail address" required
											data-error="Please enter your email address">
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="txtAddress"
											name="txtAddress" placeholder="Your address" required
											data-error="Please enter your address">
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="number" class="form-control" id="number"
											name="txtContact" placeholder="Your Phone number" required
											data-error="Please enter your phone number">
										<div class="help-block with-errors"></div>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control" id="password"
											name="passPassword" placeholder="Your password" required
											data-error="Please enter your password">
										<div class="help-block with-errors"></div>
									</div>
								</div>

								
									<div class="col-md-12">
										<div class="form-group">
											<select class="custom-select d-block form-control"
												id="person" name="rdoGender" required
												data-error="Please select Person">
												<option disabled selected>Select Gender</option>
												<option value="male">Male</option>
												<option value="female">Female</option>

											</select>
											<div class="help-block with-errors"></div>
										</div>
									</div>


								<div class="col-md-12">
									<div class="submit-button text-center">
										<button class="btn btn-common" id="submit" type="submit">
											Register</button>
										<div id="msgSubmit" class="h3 text-center hidden"></div>
										<div class="clearfix"></div>
									</div>
								</div>

							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Reservation -->

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
	<script src="js/picker.js"></script>
	<script src="js/picker.date.js"></script>
	<script src="js/picker.time.js"></script>
	<script src="js/legacy.js"></script>
	<script src="js/form-validator.min.js"></script>
	<script src="js/contact-form-script.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>