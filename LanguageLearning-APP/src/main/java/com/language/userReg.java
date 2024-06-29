package com.language;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.language.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userReg
 */
public class userReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String uname=request.getParameter("uname");
		String dob=request.getParameter("dob");
		
		PrintWriter out=response.getWriter();
		LocalDate date = LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		 
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

	            User user=new User();
	            user.setUsername(uname);
	            user.setPassword(pass);
	            user.setFirstName(name);
	            user.setEmail(email);
	            user.setDateOfBirth(date);
	            
	            session.save(user);
	            tx.commit();
	            
	            out.println("<html><script>alert('Registered Successfully. Please login.');location.href='index.jsp';</script></html>");
	           
	        }
	        catch (Exception e)
	        {
	        	response.sendRedirect("Register.jsp");
	            e.printStackTrace();
	        }
			finally
			{
				session.close();
			}
		
	}
}

