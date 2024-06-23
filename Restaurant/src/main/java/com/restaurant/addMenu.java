package com.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.restaurant.entities.MenuItem;
import com.restaurant.entities.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class studentReg
 */
public class addMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title=request.getParameter("title");
		String mdesc=request.getParameter("mdesc");
		Integer amt=(Integer.parseInt(request.getParameter("amt")));
		
		HttpSession ses=request.getSession();
		PrintWriter out=response.getWriter();
		
		Configuration config;
        SessionFactory sf = null;
        Session session = null;
        Transaction tx;
		try
	        {
	            config=new Configuration();
	            config.configure();
	            sf = config.buildSessionFactory();
	            session = sf.openSession();
	            tx = session.beginTransaction();

	            int rid=(Integer)ses.getAttribute("rid");
	            Restaurant rest=(Restaurant)session.get(Restaurant.class, rid);
	            
	            MenuItem mu=new MenuItem();
	            mu.setFname(title);
	            mu.setFdesc(mdesc);
	            mu.setFamt(amt);
	            mu.setRestaurant(rest);
	            
	            session.save(mu);
	            tx.commit();
	            
	            out.println("<html><script>alert('Food item added Successfully');window.location.href = 'addMenu.jsp';</script></html>");
	            //response.sendRedirect("userLog.jsp");
	        }
	        catch (Exception e)
	        {
	        	response.sendRedirect("addMenu.jsp");
	            e.printStackTrace();
	        }
			finally
			{
				session.close();
			}
		
	}

}