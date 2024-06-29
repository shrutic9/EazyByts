package com.language;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.language.entities.QuizQuestion;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Quizsol
 */
public class Quizsol extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int marks=0;
		int cnt=(Integer.parseInt(request.getParameter("cnt")));
		
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
	            
	            for(int i=1;i<=cnt;i++)
	            {
	            	String opt=request.getParameter("opt"+i);
	            	int qid=(Integer.parseInt(request.getParameter("seq"+i)));
	            	QuizQuestion qq=(QuizQuestion)session.get(QuizQuestion.class,qid);
	            	if(qq.getCorrectAnswer().equals(opt))
	            	{
	            		marks++;
	            	}
	            }
	            
	            request.setAttribute("marks", marks);
	            request.setAttribute("cnt", cnt);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("QuizResult.jsp");
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
