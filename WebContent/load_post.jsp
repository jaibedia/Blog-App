<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.dto.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<div class="row">
	<%
		PostDao pd = new PostDao();
		ArrayList<Post> list = null;
		int cid = Integer.parseInt(request.getParameter("cid"));
		if(cid==0){
			list = pd.getAllPosts();
		}else{
			list = pd.getPostsByCatId(cid); 
		}
	%>
	<% for(Post p:list){ %>
	

	<div class="col-md-6">
		<div class="card mt-3">
				<img alt="#" class="card-img-top" src="blog_pics/<%= p.getpPic()%>">
			<div class="card-body">
				<b class="card-title"><%= p.getpTitle() %></b>
				<p> <%= p.getpContent() %></p>
				<pre><%= p.getpCode() %></pre>
				

			</div>
			<div class="card-footer">
				<div class="container">
					<button class="btn btn-outline-primary"><i class="fa fa-thumbs-o-up"></i>like</button>
					<a href="show_blog_page.jsp?id=<%= p.getPid() %>"><button class="btn btn-outline-primary">read more</button></a>
					
					<button class="btn btn-outline-primary"><i class="fa fa-thumbs-o-down"></i>dislike</button>
				</div>
			
			</div>


		</div>
	</div>

	<%
		}
	%>
</div>

