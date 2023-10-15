<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
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
</head>
<body>

	<!-- navbar -->
	<%@include file="header.jsp"%>

	<div class="d-flex align-items-center my-background"
		style="height: 100vh">
		<div class="container">
			<div class="col-md-4 offset-md-4">
				<div class="card shadow-lg">
					<div class="card-header text-center my-background text-white">
						<span class="fa fa-user-plus fa-3x"></span><br>Register here
					</div>


					<div class="card-body">
						<form action="RegisterServlet" id="reg-form" method="post">
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Name</label>
								<input type="text" name="name" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" name="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="mb-3">

								<label for="gender">Gender</label><br> <input type="radio"
									id="male" name="gender" value="male"> Male <input
									type="radio" value="female" id="female" name="gender">
								Female
							</div>

							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">terms and
									conditions</label>
							</div>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-3x text-primary"></span>
							</div>
							<button id="submit-btn" type="submit" class="btn btn-primary">Save</button>
						</form>
					</div>


					<div class="card-footer"></div>

				</div>
			</div>
		</div>
	</div>




	<!-- javascripts-->

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha512-Ua/7Woz9L5O0cwB/aYexmgoaD7lw3dWe9FvXejVdgqu71gRog3oJgjSWQR55fwWx+WKuk8cl7UwA1RS6QCadFA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="sweetalert2.all.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {

			$("#reg-form").on("submit", function(event) {
				event.preventDefault();
				let form = new FormData(this);
				$("#submit-btn").hide();
				$("#loader").show();

				$.ajax({

					url : "RegisterServlet",
					type : "post",
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim() === 'done'){
						Swal.fire(
								  'Done!',
								  'Data save successfully!',
								  'success'
								)
									window.location ="login_page.jsp"
									
						}else{
							Swal.fire(
									  data,
									  ' ',
									  'info'
									)
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR);
						$("#submit-btn").show();
						$("#loader").hide();
						Swal.fire(
								  'Failed!',
								  'something went wrong!',
								  'error'
								)
						
					},
					processData : false,
					contentType : false

				});

			});

		});
	</script>

</body>
</html>