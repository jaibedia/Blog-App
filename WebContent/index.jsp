<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index page</title>
<!-- css -->
<link href="css/style.css" rel="stylesheet" type="text/css">
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
.banner-background {
	clip-path: polygon(40% 00%, 100% 60, 98% 44%, 100% 86%, 42% 100%, 12% 100%, 0% 70%,
		0 1%);
}
</style>
</head>
<body>

	<!-- navbar -->
	<%@include file="header.jsp"%>

	<!--banner-->
	<div class="container-fluid p-0 m-0 my-background">
		<div class="jumbotron my-background p-5 pt-0 banner-background">
			<div class=container>
				<h1 class="display-3">Welcome to Tech Blog</h1>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem
					reprehenderit ducimus aliquam!</p>
				<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Rem
					reprehenderit ducimus aliquam! Lorem ipsum dolor sit amet
					consectetur adipisicing elit. Quibusdam, ex!</p>
				<button class="btn btn-outline-light">start !ts free</button>
				<a href="login_page.jsp" class="btn btn-outline-light">Login</a>
			</div>

		</div>
	</div>

	<!-- card -->
	<div class="container">
		<div class="row">
			<div class="col-md-4 mb-1">
				<div class="card  border border-gray shadow" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Java Tutorial</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="card border border-gray shadow" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Java Tutorial</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card border border-gray shadow" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Java Tutorial</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card border border-gray shadow" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Java Tutorial</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card border border-gray shadow" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Java Tutorial</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card border border-gray shadow" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Java Tutorial</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary">Read more</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- javascripts-->

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>




</body>
</html>