package com.language;

import java.io.IOException;
import java.time.LocalDate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.language.entities.Lesson;
import com.language.entities.Progress;
import com.language.entities.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class progress
 */
public class progress extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession ses=request.getSession();
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
	            
	            int lid=(Integer)ses.getAttribute("lid");
	            Lesson lsn=(Lesson)session.get(Lesson.class, lid);
	            
	            int uid=(Integer)ses.getAttribute("uid");
	            User user=(User)session.get(User.class, uid);
	            
	            Progress p=new Progress();
	            p.setCompletionStatus("Completed");
	            p.setLastAccessed(LocalDate.now());
	            p.setUser(user);
	            p.setLesson(lsn);
	            
	            session.save(p);
	            tx.commit();
	            

	            request.setAttribute("cs",p.getCompletionStatus());
	            request.setAttribute("seq",lsn.getSeq());
	            
	            RequestDispatcher dispatcher=request.getRequestDispatcher("LessonsInfo.jsp");
	               dispatcher.include(request, response); 
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
