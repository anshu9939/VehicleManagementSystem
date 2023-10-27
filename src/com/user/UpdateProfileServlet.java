package com.user;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnector;

public class UpdateProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get username from session
		HttpSession session = request.getSession(true);
		String username = (String) session.getAttribute("username");

		try {
			// fetching details for user from Database
			Statement st = DBConnector.getStatement();
			String query = "SELECT fname, phone FROM user WHERE username='" + username + "'";
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				session.setAttribute("fname", rs.getString(1));
				session.setAttribute("phone", rs.getString(2));
			}

		} catch (SQLException e) {
			System.out.println(e);
		}

		response.sendRedirect("updateProfile.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get username from session
		HttpSession session = request.getSession(true);
		String username = (String) session.getAttribute("username");

		//removing attribute from Session which was used to fill form
		session.removeAttribute("fname");
		session.removeAttribute("phone");

		String password = request.getParameter("password");
		String conPassword = request.getParameter("conPassword");
		String oldPassword = request.getParameter("oldPassword");
		String fname = request.getParameter("fname");
		String phone = request.getParameter("phone");

		if (username.isEmpty() || fname.isEmpty() || phone.isEmpty() || password.isEmpty() || oldPassword.isEmpty()
				|| !password.equals(conPassword)) {
			response.sendRedirect("updationFail.jsp");
			return;
		}

		Boolean isPasswordMatch = false;
		Boolean isProfileUpdated = false;
		try {
			// checking if old password is correct:
			Statement st = DBConnector.getStatement();
			String query = "SELECT password FROM user WHERE username='" + username + "'";
			ResultSet rs = st.executeQuery(query);
			if (rs.next() && rs.getString(1).equals(oldPassword)) {
				isPasswordMatch = true;
			}

			// if old password is same then updating data:
			if (isPasswordMatch) {
				query = "UPDATE user SET password='" + password + "',fname='" + fname.trim() + "'," + "phone='"
						+ phone.trim() + "' WHERE username='" + username + "'";
				int i = st.executeUpdate(query);
				if (i > 0) {
					isProfileUpdated = true;
				}
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

		if (isProfileUpdated) {
			response.sendRedirect("index.jsp");

		} else
			response.sendRedirect("updationFail.jsp");

	}
}
