package com.eLearn;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.eLearn.entities.Course;
import com.eLearn.entities.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class enrolCourse
 */
public class enrolCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=(Integer.parseInt(request.getParameter("cid")));
		
		request.getSession().setAttribute("cid",cid);

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
	            
            Course course=session.get(Course.class,cid);
	            
            int sid=(int)request.getSession().getAttribute("sid");
            Student student=session.get(Student.class,sid);
	        
            student.getScourse().add(course);
            course.getStudent().add(student);
            
            session.save(student);
            session.save(course);
            
            tx.commit();
            response.getWriter().println("<html><script>alert('Enrollment Success')</script></html>");
            
        }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
