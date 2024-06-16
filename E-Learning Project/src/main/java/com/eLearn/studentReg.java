package com.eLearn;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.eLearn.entities.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class studentReg
 */
public class studentReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String semail=request.getParameter("email");
		String spass=request.getParameter("pass");
		String sname=request.getParameter("name");
		String col=request.getParameter("col");
		String sclass=request.getParameter("sclass");
		
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

	            Student student=new Student();
	            student.setName(sname);
	            student.setSemail(semail);
	            student.setSclass(sclass);
	            student.setCollege(col);
	            student.setSpass(spass);
	            
	            session.save(student);
	            tx.commit();
	            
	            out.println("<html><script>alert('Registered Successfully. Please login.')</script></html>");
	            response.sendRedirect("studentlogin.jsp");
	        }
	        catch (Exception e)
	        {
	        	response.sendRedirect("studentReg.jsp");
	            e.printStackTrace();
	        }
			finally
			{
				session.close();
			}
		
	}

}
