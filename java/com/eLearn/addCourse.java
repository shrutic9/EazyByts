package com.eLearn;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.eLearn.entities.Course;
import com.eLearn.entities.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class addCourse
 */
public class addCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("title");
		String cdesc=request.getParameter("cdesc");
		String sdate=request.getParameter("sdate");
		String edate=request.getParameter("edate");
		
		Date startdate=Date.valueOf(sdate);
		Date endDate=Date.valueOf(edate);
		
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

	            Course course=new Course();
	            course.setTitle(title);
	            course.setDesc(cdesc);
	            course.setStartDate(startdate);
	            course.setEndDate(endDate);
	            
	            HttpSession ses=request.getSession();
	            int tid=(int) ses.getAttribute("tid");
	            Teacher teacher=session.get(Teacher.class, tid);
	            
	            course.setTeacher(teacher);
	            
	            session.save(course);
	            tx.commit();
	            
	            out.println("<html><script>alert('Registered Successfully. Please login.')</script></html>");
	            response.sendRedirect("profile.jsp");
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
