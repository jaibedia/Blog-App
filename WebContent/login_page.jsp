<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.dto.Message"%>
	<%@ page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login page</title>
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

	<div class="d-flex align-items-center my-background" style="height: 70vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-white my-background text-center">
						<span class="fa fa-user-plus fa-3x"></span>
							<p>Login here</p>
						</div>
						<%
						 Message msg = (Message)session.getAttribute("msg");
						if(msg != null){
						%>
						<div class="alert <%= msg.getCssClass() %> text-center" role=<%=msg.getType() %>><%= msg.getMsg() %> </div>
						<%
						session.removeAttribute("msg");

						} 
						%>

						<div class="card-body">
						
						<!-- form start -->
							<form action="loginServlet" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> 
										<input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password"  name="password" class="form-control"
										id="exampleInputPassword1">
								</div>
								<div class="mb-3 form-check">
									<input type="checkbox" name="check" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Check me out</label>
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
					<!-- End of form  -->
							
						</div>
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