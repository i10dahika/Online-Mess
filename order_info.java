package com.userinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class order_info
 */
@WebServlet("/order_info")
public class order_info extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public order_info() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	public static String ownerinfo(String id)
	{
		String msg="";
		Connection con;
		try
		{
			con = Dbconn.conn();
			Statement stRegister=con.createStatement();
			ResultSet rsLogin;
			rsLogin=stRegister.executeQuery("select * from menu_info where id='" +id+ "'");
			if(rsLogin.next())
			{
				msg=rsLogin.getString("mess_owner_email");
			}
		}catch(Exception e)
		{}
		return msg;
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		try {

			PrintWriter pw=response.getWriter();
			String id=request.getParameter("id");
			String mess_owner_email=ownerinfo(id);
			System.out.println("Welcome to Update");
			String menu1=request.getParameter("menu1");
			String menu2=request.getParameter("menu2");
			String menu_roti=request.getParameter("menu_roti");
			String menu1_rice=request.getParameter("menu1_rice");
			String price=request.getParameter("price");
			String menuname=request.getParameter("menuname");
			String email=(String)session.getAttribute("uemail");	
			String qty=request.getParameter("qty");
			String address=(String)session.getAttribute("uaddress");
			int amount=0;
			String Status_info="Sending";
			String Payment_Status_info="0";
			Connection con=Dbconn.conn();
			Statement st=con.createStatement();
			String sql = "insert into order_menu_info(bhaji_Name_first,bhaji_Name_second,roti_name,rice_name,price,menu_name,address,user_email,Qty_info,Total_price,mess_owner_email,Status_info,Payment_Status_info) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement p = (PreparedStatement) con
					.prepareStatement(sql);

			p.setString(1, menu1);
			p.setString(2, menu2);
			p.setString(3, menu_roti);
			p.setString(4, menu1_rice);
			p.setString(5, price);
			p.setString(6, menuname);
			p.setString(7, address);
			p.setString(8, email);
			p.setString(9, qty);
			p.setString(10, String.valueOf(amount));
			p.setString(11, mess_owner_email);
			p.setString(12, Status_info);
			p.setString(13, Payment_Status_info);
			
			
			

			int i = p.executeUpdate();
			
			
			pw.println("<script> alert(' Updated Menu Successfully');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/UserHomePage.jsp");
					rd.include(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
