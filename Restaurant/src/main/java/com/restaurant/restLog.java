package com.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.restaurant.entities.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Studentlog
 */
public class restLog extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rmail = request.getParameter("email");
        String rpass = request.getParameter("password");
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
            
            Query q1= session.createQuery("FROM Restaurant where rmail=:mail and rpass=:pass")
            		.setParameter("mail",rmail)
            		.setParameter("pass", rpass);
            
            //Storing record in teacher object
            Restaurant rest=(Restaurant)q1.uniqueResult();
            
            if(rest==null)
            {
            	out.println("<html><script>alert('Incorrect Username or Password!')</script></html>");
            }
            else
            {
            	
            	//Setting up Sessions for successful login
            	request.getSession().setAttribute("rid",rest.getRid());
            	
            	out.println("<html><script>alert('Login Successful');window.location.href = 'Restpfp.jsp';</script></html>");
            	//response.sendRedirect("index.jsp");
            }
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
            out.println("<html><script>alert('Error Occured. Login Again!');window.location.href = 'restLog.jsp';</script></html>");
        }
        finally
        {
        	session.close();
        }

	}

}
