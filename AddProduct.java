package com.mess;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.connection.Dbconn;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 50, // 50MB
maxFileSize = 1024 * 2048 * 100, // 100 MB

maxRequestSize = 1024 * 2048 * 1000)
// 1000 MB
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
	public static String hourscalculation(String Enddate)
	{
		 long days=0;
		 long diffHours=0;
		Date day=new Date();
		
		String end="2020-04-04 24:00:00";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-dd-MM HH:mm:ss");

		Date d1 = null;
		
		String currentdate=format.format(day);
		try {
			d1 = format.parse(currentdate);
//			d2 = format.parse(end);
			Date d2 = new SimpleDateFormat("yyyy-dd-MM HH:mm:ss").parse(end); ;

			//in milliseconds
			long diff = d2.getTime() - d1.getTime();

			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
		 diffHours = diff / (60 * 60 * 1000) % 24;
			days = diff / (24 * 60 * 60 * 1000);

			System.out.print(days + " days, ");
			System.out.print(diffHours + " hours, ");
			System.out.print(diffMinutes + " minutes, ");
			System.out.print(diffSeconds + " seconds.");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return String.valueOf(days+"#"+diffHours);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		PrintWriter pw=response.getWriter();
		System.out.println("Welcome");
		
		try {
			Connection con=Dbconn.conn();
			String menu1=request.getParameter("menu1");
			String menu2=request.getParameter("menu2");
			String menu_roti=request.getParameter("menu_roti");
			String menu1_rice=request.getParameter("menu1_rice");
			String price=request.getParameter("price");
			String menuname=request.getParameter("bt");
			String email=(String)session.getAttribute("messemail");	
			String address=(String)session.getAttribute("messaddress");
			String shopname=(String)session.getAttribute("shopname");
			System.out.println("Menu First===>"+menu1);
			System.out.println("Menu Seconds===>"+menu2);
			System.out.println("Roti Name===>"+menu_roti);
			System.out.println("Rice Name===>"+menu1_rice);
			System.out.println("Price===>"+price);
			PreparedStatement ps=con.prepareStatement("insert into menu_info(bhaji_Name_first,bhaji_Name_second,roti_name,rice_name,price,menu_name,address,mess_owner_email,shopname) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, menu1);
			ps.setString(2, menu2);
			ps.setString(3, menu_roti);
			ps.setString(4, menu1_rice);
			ps.setString(5, price);
			ps.setString(7, address);
			ps.setString(6, menuname);
			ps.setString(8, email);
			ps.setString(9, shopname);
			ps.executeUpdate();
			
			pw.println("<script> alert(' Menu added Successfully');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/AddMenu.jsp");			
			rd.include(request, response);
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
