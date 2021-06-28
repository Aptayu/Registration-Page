package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Register
 */
@MultipartConfig
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Get all the details from incoming request 
		PrintWriter out = response.getWriter();
		String name = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		String email = request.getParameter("user_email");
//		check whetehr we are getting image or not
		Part part = request.getPart("image");
		String filename = part.getSubmittedFileName();
//		out.println(filename);
		
//		checked whether we got data or not 
//		out.println(name + " " + email + " " + password);
//		create connection JDBC 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			try {
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_manage", "root", "****");
				String q = "insert into registered_students(username,password,email, imageName) values(?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(q);
				pstmt.setString(1, name);
				pstmt.setString(2, password);
				pstmt.setString(3, email);
				pstmt.setString(4, filename);
				
				pstmt.executeUpdate();
//				We are only storing name of file in the database and will store image in server folder then we can use mapping
//			upload
				InputStream is = part.getInputStream();
				
				byte[] data = new byte[is.available()];
				is.read(data);
//				which file we want to write you have read it we will store images in img folder 
//				we are using File.Seprartor to make "/" platform independent
				String path = request.getRealPath("/") + "img" + File.separator + filename;
//				out.println(path);
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(data);
				
				out.println("Done");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		query
		
		
//		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
