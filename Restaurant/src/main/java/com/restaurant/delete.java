package com.restaurant;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.restaurant.entities.MenuItem;
import com.restaurant.entities.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class delete
 */
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Configuration con = new Configuration();
		con.configure();
        SessionFactory sf =con.buildSessionFactory();
        Session ses = null;
        Transaction txn = null;
        
		String action=request.getParameter("action");
		if(action.equals("fid"))
		{
           Session ses1 = sf.openSession();
           Transaction txn1 = ses1.beginTransaction();
           
           int muid=(Integer.parseInt(request.getParameter("fid")));
            
            MenuItem mu=(MenuItem)ses1.get(MenuItem.class, muid);
            ses1.delete(mu);
            txn1.commit();
            
            response.sendRedirect("Dashb.jsp");
		}
				

		if(action.equals("remove"))
		{
			int fid=(Integer.parseInt(request.getParameter("prodId")));

	        try {
	            con = new Configuration();
	            con.configure();
	            sf = con.buildSessionFactory();
	            ses = sf.openSession();
	            txn = ses.beginTransaction();
	            
	            OrderItem oi=(OrderItem)ses.get(OrderItem.class, fid);
	            ses.delete(oi);
	            txn.commit();
	            
	            response.sendRedirect("cart.jsp");
	        }
	        catch(Exception e){
	        	e.printStackTrace();}
		}

		}
		
}
