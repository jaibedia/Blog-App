package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.dto.User;

@WebServlet("/RegisterServlet")

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String check = req.getParameter("check");
		System.out.println(check);
		System.out.println(req.getParameter("name"));
		if (check == null) {
			out.print("Check box is not checked..");
//			RequestDispatcher rd = req.getRequestDispatcher("register_page.jsp");
//			rd.include(req, resp);

		} else {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String gender = req.getParameter("gender");

			// create user object and set all data to the object
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setGender(gender);

			// create user Dao object
			UserDao userDao = new UserDao();

			if (userDao.save(user)) {
//				save..
				out.println("done");
			} else {
				out.println("error something went wrong...");
			}
		}
	}
}
