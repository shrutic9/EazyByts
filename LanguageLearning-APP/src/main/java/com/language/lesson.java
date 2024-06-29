package com.language;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.language.entities.Course;
import com.language.entities.Lesson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Lesson
 */
public class lesson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession ses=request.getSession();
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String vurl=request.getParameter("vurl");
		Integer ord=(Integer.parseInt(request.getParameter("ord")));
		int cid=(Integer)ses.getAttribute("cid");
		
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
	            
	            Lesson lesson=new Lesson();
	            lesson.setLessonTitle(title);
	            lesson.setContent(content);
	            lesson.setVideoURL(vurl);
	            lesson.setSeq(ord);
	            
	            Course course=(Course)session.get(Course.class, cid);
	            lesson.setCourse(course);
	            
	            session.save(lesson);
	            tx.commit();
	            
	            response.getWriter().print("<html><script>alert('Lesson Added Successfully!');location.href='Exercise.jsp'</script></html>");

	        }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}

}
