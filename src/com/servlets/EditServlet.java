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

import com.dao.UserDao;
import com.dto.Message;
import com.dto.User;
import com.factory.Helper;
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		Part part = req.getPart("image");
		String imageName = part.getSubmittedFileName();
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("currentUser");
		user.setName(name);
		user.setEmail(email); 
		user.setGender(gender);
		String oldPath = "C:\\Users\\dell\\eclipse-workspace\\TechBlog\\WebContent\\images"+File.separator+user.getProfile();
		user.setProfile(imageName);
		
		
//		update on database
		UserDao userDao = new UserDao();
		boolean status = userDao.updateUser(user);
//		System.out.println(req.getRealPath("/")+"WebContent\\images"+File.separator + user.getProfile());
//		status=false;
		if(status) {
			out.println("update successfully...");
			String path = "C:\\Users\\dell\\eclipse-workspace\\TechBlog\\WebContent\\images"+File.separator + user.getProfile();
			System.out.println(path);
			if(!equals("default.jpg"))
			System.out.println("delelte pic = "+Helper.deleteFile(oldPath));
			
			 if(Helper.saveFile(part.getInputStream() , path)) {
				 out.print("profile updated...");
				 Message msg = new Message("profile updated..", "success", "alert-success");
				 session.setAttribute("msg", msg);
				  
			 }else {
				 ////////////
				 Message msg = new Message("profile not updated..", "error", "alert-danger");
				 session.setAttribute("msg", msg);
			 }
			
		}else {
			out.println("not updated");
			Message msg = new Message("not updated..", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}
		resp.sendRedirect("profile_page.jsp");
		
	}
}
