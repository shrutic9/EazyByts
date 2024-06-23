package com.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.restaurant.entities.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Studentlog
 */
public class userLog extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String umail = request.getParameter("email");
        String upass = request.getParameter("password");
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
            
            Query q1= session.createQuery("FROM Customer where cmail=:mail and pass=:pass")
            		.setParameter("mail",umail)
            		.setParameter("pass", upass);
            
            //Storing record in teacher object
            Customer customer=(Customer)q1.uniqueResult();
            
            if(customer==null)
            {
            	out.println("<html><script>alert('Incorrect Username or Password!')</script></html>");
            }
            else
            {
            	
            	//Setting up Sessions for successful login
            	request.getSession().setAttribute("cid",customer.getCid());
            	request.getSession().setAttribute("cname",customer.getCname());

            	out.println("<html><script>alert('Login Successful');window.location.href = 'index.jsp';</script></html>");
            	//response.sendRedirect("index.jsp");
            }
            
        }
        catch (Exception e)
        {
            e.printStackTrace();
            out.println("<html><script>alert('Error Occured. Login Again!');window.location.href = 'userLog.jsp';</script></html>");
        }
        finally
        {
        	session.close();
        }

	}

}
