package com.common;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DBConnector;

public class RegistrationServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("registration.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fname = request.getParameter("name");
		String phone = request.getParameter("phone");

		if (username.isEmpty() || fname.isEmpty() ||   phone.isEmpty() || password.isEmpty()) {
			// to avoid 'HTTP Status 500 - cannot call sendRedirect() after the response has
			// been commited', as we have multiple sendRedirect on one page.
			response.sendRedirect("registrationFail.jsp");
			return;
		}

		Boolean isUserAlreadyExists = false;
		Boolean isNewUserCreated = false;
		
		try {
			Statement st = DBConnector.getStatement();
			// checking if username is already registered.
			String query = "SELECT username FROM user WHERE username='" + username + "'";
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				// returning false if username is already registered.
				isUserAlreadyExists = true;
			}
			
			if(isUserAlreadyExists == false) {
				// inserting data to database as user is new.
				query = "INSERT INTO user(username,password,fname,phone) VALUES('" + username.trim()
						+ "','" + password + "','" + fname.trim() + "'," +  phone.trim() + ")";
				int i = st.executeUpdate(query);
				if (i > 0) {
					isNewUserCreated =  true;
				}
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

		if (isUserAlreadyExists == false && isNewUserCreated) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("registrationFail.jsp");
		}
	}
}
