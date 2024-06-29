package com.language;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.language.entities.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userLog
 */
public class userLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String semail = request.getParameter("email");
        String spassword = request.getParameter("password");
        PrintWriter out=response.getWriter();
        //out.println("<html><h2>"+email+","+password+"</h2></html>");
        
        Configuration config;
        SessionFactory sf = null;
        Session session = null;

        try
        {
            config=new Configuration();
            config.configure();
            sf = config.buildSessionFactory();
            session = sf.openSession();
            
            //Using HQL to Authenticate User Login
            
            Query q1= session.createQuery("FROM User where email=:mail and password=:pass")
            		.setParameter("mail", semail)
            		.setParameter("pass", spassword);
            
            //Storing record in teacher object
            User user=(User)q1.uniqueResult();
            
            if(user==null)
            {
            	out.println("<html><script>alert('Incorrect Username or Password!')</script></html>");
            }
            else
            {
            	out.println("<html><script>alert('Login Successful')</script></html>");
            	
            	//Setting up Sessions for successful login
            	request.getSession().setAttribute("uid",user.getUserId());
            	request.getSession().setAttribute("uname",user.getUsername());
            	
            	response.sendRedirect("LanguageDashb.jsp");
            }
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
        	session.close();
        }

	}

}
