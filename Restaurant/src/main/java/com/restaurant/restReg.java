package com.restaurant;


import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.restaurant.entities.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class studentReg
 */
public class restReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rmail=request.getParameter("email");
		String rpass=request.getParameter("pass");
		String rname=request.getParameter("name");
		String loc=request.getParameter("loc");
		String rcity=request.getParameter("rcity");
		String rtype=request.getParameter("type");
		
		String otime=request.getParameter("otime");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime startTime = LocalTime.parse(otime, formatter);
        
		String ctime=request.getParameter("ctime");
		DateTimeFormatter format = DateTimeFormatter.ofPattern("HH:mm");
        LocalTime endTime = LocalTime.parse(ctime, format);
		
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

	            Restaurant rest=new Restaurant();
	            rest.setRmail(rmail);
	            rest.setRname(rname);
	            rest.setRpass(rpass);
	            rest.setRadd(loc);
	            rest.setRcity(rcity);
	            rest.setRtype(rtype);
	            rest.setOtime(startTime);
	            rest.setCtime(endTime);
	            
	            session.save(rest);
	            tx.commit();
	            
	            out.println("<html><script>alert('Registered Successfully. Please login.');window.location.href = 'restLog.jsp';</script></html>");
	            //response.sendRedirect("userLog.jsp");
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