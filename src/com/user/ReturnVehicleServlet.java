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

public class ReturnVehicleServlet extends HttpServlet {
	
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
		
		int isReturnedStatus = 0;
		int isReturned = 0;
		
		try {
			Statement st = DBConnector.getStatement();
			String query = "UPDATE vehicle SET isRented=0 WHERE vehicleId=" + vehicleId + "";
			isReturnedStatus = st.executeUpdate(query);
			
			if(isReturnedStatus > 0) {
				String query1 = "DELETE FROM vehicletouser WHERE username='" + username + "' and vehicleId=" + vehicleId;
				isReturned = st.executeUpdate(query1);
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		if(isReturnedStatus > 0 && isReturned > 0 ) 
			response.sendRedirect("rentedVehicle.jsp");
		else 
			response.sendRedirect("applyToRent.jsp");
		
	}
}
