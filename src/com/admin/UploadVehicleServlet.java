package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class UploadVehicleServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("uploadVehicle.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Enumeration<String> e = request.getParameterNames();
		while(e.hasMoreElements()) {
			System.out.println(e.nextElement());
		}
		
		e = request.getAttributeNames();
		while(e.hasMoreElements()) {
			System.out.println(e.nextElement());
		}
		
		String vehicleNumber = request.getParameter("vehicleNumber");
		String vehicleType = request.getParameter("vehicleType");
		String noOfSeats = request.getParameter("noOfSeats");
		String vehicleRent =request.getParameter("vehicleRent");
		request.getParameter("vehicleImage");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String path = getServletContext().getRealPath("/resources/static/img/");
		MultipartRequest mpr = new MultipartRequest(request, path, 500 * 1024 * 1024);
		String s1 = mpr.getOriginalFileName("file");

		out.println("<html><body>");
		out.println("File Uploaded Succesfully=" + s1);
		out.println("</body></html>");

	}
}
