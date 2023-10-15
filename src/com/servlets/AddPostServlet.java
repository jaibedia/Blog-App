package com.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.PostDao;
import com.dto.Post;
import com.dto.User;
import com.factory.Helper;
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		String pTitle = req.getParameter("pTitle");
		String pContent = req.getParameter("pContent");
		String pCode = req.getParameter("pCode");
		Part part = req.getPart("pPic");
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("currentUser");
		int userid = user.getId();
		PostDao postDao = new PostDao();
		Post post = new Post();
		post.setCid(cid);
		post.setpTitle(pTitle);
		post.setpContent(pContent);
		post.setpCode(pCode);
		post.setpPic(part.getSubmittedFileName());
		post.setUserid(userid);
		boolean result = postDao.savePost(post);
		if(result) {
			
			String path = "C:\\Users\\dell\\eclipse-workspace\\TechBlog\\WebContent\\blog_pics"+File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			
			out.println("done");
		}

	}
}
