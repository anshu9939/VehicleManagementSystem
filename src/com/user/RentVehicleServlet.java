package com.user;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnector;

public class RentVehicleServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("user/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String vehicleId = request.getParameter("vehilceId");
		
		HttpSession session = request.getSession(true);
		String username = (String) session.getAttribute("username");
		
		int isTookOnRented = 0;
		int isRented = 0;
		
		try {
			Statement st = DBConnector.getStatement();
			String query = "UPDATE vehicle SET isRented=1 WHERE vehicleId=" + vehicleId + "";
			isTookOnRented = st.executeUpdate(query);
			
			if(isTookOnRented > 0) {
				String query1 = "INSERT INTO  vehicletouser(username, vehicleId) values('" + username +"'," + vehicleId + ")";
				isRented = st.executeUpdate(query1);
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		if(isTookOnRented > 0 && isRented > 0 ) 
			response.sendRedirect("rentedVehicle.jsp");
		else 
			response.sendRedirect("applyToRent.jsp");
		
	}
}
