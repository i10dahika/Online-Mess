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
 * Servlet implementation class Payment_Status_info
 */
@WebServlet("/Payment_Status_info")
public class Payment_Status_info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Payment_Status_info() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
			rsLogin=stRegister.executeQuery("select * from order_menu_info where id='" +id+ "'");
			if(rsLogin.next())
			{
				msg=rsLogin.getString("mess_owner_email");
			}
		}catch(Exception e)
		{}
		return msg;
		
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		try {

			PrintWriter pw = response.getWriter();
			String O_ID = request.getParameter("id");
			String mess_owner_email = ownerinfo(O_ID);
			System.out.println("Welcome to Update");
			
			String email = (String) session.getAttribute("uemail");
			String qty = request.getParameter("qty");
			String Payment_Amount=request.getParameter("total_price");
			String Payment_Status_info = "Pay";
			String paymentprocess=request.getParameter("paymentprocess");
			String Card_Numeber="";
			String Expiry_Date="";
			String CVV_Number="";
			if(paymentprocess.equals("CashInfo"))
			{
				Card_Numeber = "Cash";
				Expiry_Date = "Cash";
				CVV_Number = "Cash";
			}
			else
			{
				Card_Numeber = request.getParameter("cardno");
				Expiry_Date = request.getParameter("Expirydate");
				CVV_Number = request.getParameter("cvvno");
				
			}
			Connection con = Dbconn.conn();
			String sql = "insert into payment_status_info(Payment_Status_info,Payment_Process,Card_Numeber,Expiry_Date,CVV_Number,O_ID,User_Email_ID,Owner_Email_ID,Payment_Amount) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement p = (PreparedStatement) con.prepareStatement(sql);

			p.setString(1, Payment_Status_info);
			p.setString(2, paymentprocess);
			p.setString(3, Card_Numeber);
			p.setString(4, Expiry_Date);
			p.setString(5, CVV_Number);
			p.setString(6, O_ID);
			p.setString(7, email);
			p.setString(8, mess_owner_email);
			p.setString(9, Payment_Amount);
			
			int i = p.executeUpdate();
			
			Statement st=con.createStatement();
			st.executeUpdate("update order_menu_info set Payment_Status_info='"+Payment_Status_info+"' where user_email='"+email+"' and id='"+O_ID+"'");
			pw.println("<script> alert('Payment Successfully');</script>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/UserHomePage.jsp");
			rd.include(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
