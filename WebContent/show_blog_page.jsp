<%@page import="com.dto.Post"%>
<%@page import="com.dto.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.dto.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dto.User"%>
<%
	User user = (User) session.getAttribute("currentUser");

	if (user == null) {
		response.sendRedirect("login_page.jsp");
	} else {
%>
<%
	int pid = Integer.parseInt(request.getParameter("id"));
		PostDao pd = new PostDao();
		Post post = pd.getPostByPostId(pid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- css -->
<link href="css/style.css" rel="stylesheet" type="text/css">
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<title>this is title of</title>
</head>
<body>

	<!-- navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark my-color my-background">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<span class="fa fa-address-book "></span> Dropdown
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link " href="#"
						tabindex="-1"><span class="fa fa-address-book-o"></span>
							contact us</a></li>

					<li class="nav-item"><a class="nav-link " data-toggle="modal"
						data-target="#add-post-modal" href="#" tabindex="-1"><span
							class="fa fa-asterisk"></span> Do post</a></li>

				</ul>
				<ul class="navbar-nav mr-right">

					<li class="nav-item"><a class="nav-link " href="#!"
						data-toggle="modal" data-target="#profile-modal" tabindex="-1">
							<span class="fa fa-user-circle"></span> <%
 	if (user != null) {
 %><%=user.getName()%> <%
 	}
 %>
					</a></li>

					<li class="nav-item"><a class="nav-link " href="LogoutServlet"
						tabindex="-1"> <span class="fa fa-user-plus"></span> logout
					</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- end of navbar -->
	<%
		Message msg = (Message) session.getAttribute("msg");
			if (msg != null) {
	%>
	<div class="alert <%=msg.getCssClass()%> text-center"
		role=<%=msg.getType()%>><%=msg.getMsg()%>
	</div>
	<%
		session.removeAttribute("msg");

			}
	%>


	<!-- main body of the page -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-3">

				<div class="card">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=post.getpTitle() %></h5>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This card has
							even longer content than the first to show that equal height
							action.</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">Last updated 3 mins ago</small>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!--end main body of the page -->


		<!-- Modal -->
		<div class="modal fade" id="profile-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header my-background text-white text-center">
						<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<div class="container text-center mb-3">
							<img alt="profile"
								src="images/<%if (user != null) {%><%=user.getProfile()%><%}%>">
							<h5 class="modal-title" id="exampleModalLabel">
								<%
									if (user != null) {
								%><%=user.getName()%>
								<%
									}
								%>
							</h5>
						</div>
						<!-- profile details -->
						<div id="prfile-data">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><%=user.getName()%></td>

									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><%=user.getEmail()%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- End of profile details -->


						<!-- Edit profile details -->
						<div id="edit-profile" style="display: none;">
							<h3 class="mt-3">Please edit carefully</h3>

							<form action="EditServlet" method="post" class="form"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th scope="row">ID:</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Name:</th>
										<td><input class="form-control" name="name" type="text"
											value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<th scope="row">Email:</th>
										<td><input class="form-control" name="email" type="text"
											value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<th scope="row">Gender:</th>
										<td><input class="form-control" name="gender" type="text"
											value="<%=user.getGender()%>"></td>
									</tr>
									<tr>
										<th scope="row">Profile pic:</th>
										<td><input class="form-control" name="image" type="file"></td>
									</tr>

								</table>
								<div class="container text-center">
									<button class="btn btn-outline-primary" type="submit">Save</button>
								</div>
							</form>

						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button id="edit-btn" type="button" class="btn btn-primary">Edit</button>
					</div>
				</div>
			</div>
		</div>
		<!--End of Modal -->

		<!-- post modal -->


		<!-- Modal -->
		<div class="modal fade" id="add-post-modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<!-- form for post add start -->
						<form action="AddPostServlet" id="add-post-form" method="post">
							<div class="form-group">
								<select class="form-control" name="cid">
									<option disabled selected>-----select category-----</option>
									<%
										PostDao post2 = new PostDao();
											ArrayList<Category> list = post2.getAllCategories();
									%>
									<%
										for (Category c : list) {
									%>
									<option value="<%=c.getCid()%>"><%=c.getName()%></option>


									<%
										}
									%>

								</select>
							</div>

							<div class="form-group">
								<input type="text" name="pTitle" placeholder="Enter post Title"
									class="form-control">
							</div>
							<div class=form-group>
								<textarea name="pContent" rows="4" cols="20"
									class="form-control" placeholder="Enter your content"></textarea>
							</div>

							<div class=form-group>
								<textarea name="pCode" rows="4" cols="20" class="form-control"
									placeholder="Enter your program(if any)"></textarea>
							</div>
							<div class="form-group">
								<label class="label">select your pic:</label><br> <input
									name="pPic" type="file">
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Post</button>
							</div>

						</form>
						<!-- End form for post add-->

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>

		<!-- End of post modal -->


		<!-- javascripts-->

		<script src="https://code.jquery.com/jquery-3.7.0.min.js"
			integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
			crossorigin="anonymous"></script>

		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha512-Ua/7Woz9L5O0cwB/aYexmgoaD7lw3dWe9FvXejVdgqu71gRog3oJgjSWQR55fwWx+WKuk8cl7UwA1RS6QCadFA=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
			crossorigin="anonymous"></script>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>

		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
			integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>

		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				var editStatus = false;
				$("#edit-btn").click(function() {
					if (editStatus == false) {
						$("#edit-profile").show();
						$("#prfile-data").hide();
						editStatus = true;
						$("#edit-btn").text("Back")
					} else {
						$("#edit-profile").hide();
						$("#prfile-data").show();
						editStatus = false;
						$("#edit-btn").text("Edit")
					}

				})

			})
		</script>

		<!-- now add post js -->

		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("#add-post-form")
										.on(
												"submit",
												function(event) {
													// this code gets called when form is submited...
													event.preventDefault();

													let form = new FormData(
															this);

													//now requesting to server..
													$
															.ajax({
																url : "AddPostServlet",
																type : "post",
																data : form,
																success : function(
																		data,
																		textStatus,
																		jqXHR) {
																	console
																			.log(data);
																	//success......
																	if (data
																			.trim() === 'done') {
																		Swal
																				.fire(
																						'Done!',
																						'Post save successfully!',
																						'success')

																	} else {
																		Swal
																				.fire(
																						'Failed!',
																						'Something went worng!',
																						'error')
																	}

																},
																error : function(
																		jqXHR,
																		textStatus,
																		errorThrown) {
																	//error........
																	Swal
																			.fire(
																					'Failed!',
																					'Something went worng!',
																					'error')
																},
																processData : false,
																contentType : false

															});

												});

							});
		</script>
</body>
</html>
<%
	}
%>
