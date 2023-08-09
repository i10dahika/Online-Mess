package com.mess;

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

/**
 * Servlet implementation class saveorder
 */
@WebServlet("/saveorder")
public class saveorder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public saveorder() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		PrintWriter pw = response.getWriter();
		System.out.println("Order Servlet");
		String id = request.getParameter("id");
		String email = (String) session.getAttribute("messemail");

		Connection con;
		try {
			con = Dbconn.conn();
			Statement st = con.createStatement();
			Statement stRegister = con.createStatement();
			ResultSet rsLogin;
			rsLogin = stRegister
					.executeQuery("select * from order_menu_info where id='"
							+ id + "'");
			if (rsLogin.next()) {
				String Status_info="Accept";
				int qty = rsLogin.getInt("Qty_info");
				int price = rsLogin.getInt("price");
				int Total_price = qty * price;
				st.executeUpdate("update order_menu_info set Total_price='"
						+ Total_price + "', Status_info='"+Status_info+"' where id='" + id
						+ "' and mess_owner_email='" + email + "'");

			}

		} catch (Exception e) {

		}
		pw.println("<script> alert('Order Updated Successfully');</script>");
		RequestDispatcher rd = request.getRequestDispatcher("/ShowOrderList.jsp");
				rd.include(request, response);
	}

}
