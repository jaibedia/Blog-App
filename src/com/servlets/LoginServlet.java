package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dto.Message;
import com.dto.User;
@WebServlet("/loginServlet")

public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String check = req.getParameter("check");
		if(check == null) {
			
		}else {
			UserDao userDao = new UserDao();
			try {
				User user = userDao.getUserByEmailAndPassword(req.getParameter("email"), req.getParameter("password"));
			if(user == null) {

				Message msg = new Message("incorrect login details ! try again","error","alert-danger");
				HttpSession session = req.getSession();
				session.setAttribute("msg", msg);
				resp.sendRedirect("login_page.jsp");
				
			}else {
				HttpSession session = req.getSession();
				session.setAttribute("currentUser", user);
				resp.sendRedirect("profile_page.jsp");
			}
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	
	}

}
