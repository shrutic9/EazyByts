package com.eLearn;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.eLearn.entities.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TeacherReg
 */
public class TeacherReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String sub=request.getParameter("sub");
		Integer age=(Integer.parseInt(request.getParameter("age")));
		
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

	            Teacher teacher = new Teacher();
	            teacher.setTname(name);
	            teacher.setTmail(email);
	            teacher.setTpass(pass);
	            teacher.setSubject(sub);
	            teacher.setAge(age);

	            session.save(teacher);
	            tx.commit();
	            
	            out.println("<html><script>alert('Registered Successfully. Please login.')</script></html>");
	            response.sendRedirect("teacherlogin.jsp");
	        }
	        catch (Exception e)
	        {
	        	response.sendRedirect("teacherReg.jsp");
	            e.printStackTrace();
	        }
			finally
			{
				session.close();
			}
	}

}
