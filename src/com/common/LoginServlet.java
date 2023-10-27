package com.common;

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

public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Boolean isUserExist = false;
		Boolean isPasswordMatch = false;
		Boolean isAdmin = false;
		String tablePassword = "";
		try {
			Statement st = DBConnector.getStatement();
			String query = "SELECT password, isAdmin FROM user WHERE username='" + username.trim() + "'";
			ResultSet rs = st.executeQuery(query);
			if (rs.next()) {
				//user exist
				tablePassword = rs.getString(1);
				isAdmin = rs.getBoolean(2);
				isUserExist = true;
			} else {
				//user not exists
				isUserExist = false;
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

		//if User Exists check password
		if (password.equals(tablePassword) && isUserExist) {
			isPasswordMatch = true;
		}
		
		if (isUserExist && isPasswordMatch) {
			HttpSession session = request.getSession(true);
			session.setAttribute("username", username);
			session.setAttribute("isAdmin", isAdmin);
			
			if(isAdmin)
				response.sendRedirect("admin/index.jsp");
			else 
				response.sendRedirect("user/index.jsp");
						
		} else {
			response.sendRedirect("login.jsp");
		}
	}
}
