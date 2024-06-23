package com.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.restaurant.entities.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class studentReg
 */
public class userReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String umail=request.getParameter("email");
		String upass=request.getParameter("pass");
		String uname=request.getParameter("name");
		String addr=request.getParameter("addr");
		Integer phn=(Integer.parseInt(request.getParameter("phn"))); 
		String city=request.getParameter("city");
		
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

	           Customer customer=new Customer();
	            customer.setCmail(umail);
	            customer.setAddr(addr);
	            customer.setCname(uname);
	            customer.setPass(upass);
	            customer.setPhn(phn);
	            customer.setCity(city);
	            
	            session.save(customer);
	            tx.commit();
	            
	            out.println("<html><script>alert('Registered Successfully. Please login.');window.location.href = 'userLog.jsp';</script></html>");
	          //  response.sendRedirect("userLog.jsp");
	        }
	        catch (Exception e)
	        {
	        	response.sendRedirect("userReg.jsp");
	            e.printStackTrace();
	        }
			finally
			{
				session.close();
			}
		
	}

}

