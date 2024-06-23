package com.restaurant;

import java.io.IOException;
import java.time.LocalDateTime;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.restaurant.entities.Customer;
import com.restaurant.entities.MenuItem;
import com.restaurant.entities.Order;
import com.restaurant.entities.OrderItem;
import com.restaurant.entities.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Oitems
 */
public class Oitems extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  HttpSession session = request.getSession();

	        int res_id = (Integer.parseInt(request.getParameter("rid")));
	        int mid = (Integer.parseInt(request.getParameter("mid")));
	        int cid = (Integer) session.getAttribute("cid");
	        int quant = (Integer.parseInt(request.getParameter("quant")));
	        
	        Configuration con;
	        SessionFactory sf = null;
	        Session ses = null;
	        Transaction txn = null;

	        try {
	            con = new Configuration();
	            con.configure();
	            sf = con.buildSessionFactory();
	            ses = sf.openSession();
	            txn = ses.beginTransaction();

	            LocalDateTime currentDateTime = LocalDateTime.now();

	            Order order = (Order) session.getAttribute("order");
	            if (order == null) {
	                order = new Order();
	                order.setDtime(currentDateTime);
	                Customer cust = (Customer) ses.get(Customer.class, cid);
	                order.setCustomer(cust);
	                Restaurant rest = (Restaurant) ses.get(Restaurant.class, res_id);
	                order.setRestaurant(rest);
	                session.setAttribute("order", order);
	            }

	            OrderItem oi = new OrderItem();
	            oi.setOquant(quant);

	            MenuItem mu = (MenuItem) ses.get(MenuItem.class, mid);
	            int tot = quant * mu.getFamt();
	            oi.setOamt(tot);
	            oi.setOrder(order);
	            
	            oi.setMenuItem(mu);;

	            // Save the order and order items
	            ses.saveOrUpdate(order);
	            ses.save(oi);

	            txn.commit();
	            
               session.setAttribute("oid", order.getOid());
               
               RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
               dispatcher.include(request, response);   
               
         }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
	}
}
