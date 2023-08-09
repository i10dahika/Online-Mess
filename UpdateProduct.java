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
import com.itextpdf.text.log.SysoLogger;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			PrintWriter pw=response.getWriter();
			System.out.println("Welcome to delete");
			int id=Integer.parseInt(request.getParameter("txt_id"));
			System.out.println("Id selected===>"+id);
			Dbconn db=new Dbconn();
			Connection con=db.conn();
			Statement st=con.createStatement();
			st.executeUpdate("delete from product_info where id='"+id+"'");
			pw.println("<script> alert('Deleted Product Successfully');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/UpdateProduct.jsp");
					rd.include(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		// TODO Auto-generated method stub
		try {

			PrintWriter pw=response.getWriter();
			String id=request.getParameter("id");
			System.out.println("Welcome to Update");
			String menu1=request.getParameter("menu1");
			String menu2=request.getParameter("menu2");
			String menu_roti=request.getParameter("menu_roti");
			String menu1_rice=request.getParameter("menu1_rice");
			String price=request.getParameter("price");
			String menuname=request.getParameter("bt");
			String email=(String)session.getAttribute("messemail");	
			
			Connection con=Dbconn.conn();
			Statement st=con.createStatement();
			st.executeUpdate("update menu_info set  bhaji_Name_first='"+menu1+"',bhaji_Name_second='"+menu2+"',roti_name='"+menu_roti+"',rice_name='"+menu1_rice+"',price='"+price+"' where id='"+id+"' and mess_owner_email='"+email+"'");
			pw.println("<script> alert(' Updated Menu Successfully');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/UpdateMenu.jsp");
					rd.include(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
