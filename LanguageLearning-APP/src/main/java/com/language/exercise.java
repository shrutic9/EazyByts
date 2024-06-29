package com.language;

import java.io.IOException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.language.entities.Exercise;
import com.language.entities.Lesson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class exercise
 */
public class exercise extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession ses=request.getSession();
		String exetype=request.getParameter("exetype");
		String question=request.getParameter("quest");
		String[] optionsArray=request.getParameterValues("options");
		String ans=request.getParameter("ans");
		Integer ord=(Integer.parseInt(request.getParameter("ord")));
		Integer lsn=(Integer.parseInt(request.getParameter("lsn")));
		int cid=(Integer)ses.getAttribute("cid");
		
		String options = String.join(", ", optionsArray);
		
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
	            
	            Exercise exercise=new Exercise();
	            exercise.setExerciseType(exetype);
	            exercise.setQuestion(question);
	            exercise.setSeq(ord);
	            exercise.setAnswer(ans);
	            
	            Query q=session.createQuery("From Lesson where seq = :order and course.id = :courseId")
                             .setParameter("order", lsn)
                             .setParameter("courseId", cid);
	            
	            Lesson lesson=(Lesson)q.uniqueResult();
	            exercise.setLesson(lesson);
	            
	            exercise.setOptions(options);
	            
	            session.save(exercise);
	            tx.commit();
	            response.getWriter().print("<html><script>alert('Exercise Added Successfully!');location.href='Exercise.jsp'</script></html>");

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
