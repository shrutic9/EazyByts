package com.language;

import java.io.IOException;
import java.time.LocalDate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.language.entities.Course;
import com.language.entities.Quiz;
import com.language.entities.QuizQuestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class quizes
 */
public class quizes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses=request.getSession();
		String title=request.getParameter("title");
		String qdesc=request.getParameter("Qdesc");
		
		String question=request.getParameter("quest");
		String[] optionsArray=request.getParameterValues("options");
		String ans=request.getParameter("ans");
		Integer ord=(Integer.parseInt(request.getParameter("ord")));
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
	            
	            Quiz quiz = null;
	            Integer qid = (Integer) ses.getAttribute("qid");

	            if (qid == null) {
	            quiz=new Quiz();
	            quiz.setCreationDate(LocalDate.now());
	            quiz.setQuizTitle(title);
	            quiz.setDescription(qdesc);
	            
	            Course c=(Course)session.get(Course.class, cid);
	            quiz.setCourse(c);
	            session.save(quiz); // Save quiz to generate ID
	            ses.setAttribute("qid", quiz.getQuizId());
	            }
	            else {
	                // Fetch existing Quiz from database
	                quiz = (Quiz) session.get(Quiz.class, qid);
	            }
	            
	            QuizQuestion qq=new QuizQuestion();
	            qq.setQuestionText(question);
	            qq.setCorrectAnswer(ans);
	            qq.setOptions(options);
	            qq.setSeq(ord);
	            qq.setQuiz(quiz);
	            
	            session.save(qq);
	            tx.commit();
	            
	            response.getWriter().print("<html><script>alert('Quiz Added Successfully!');location.href='Quiz.jsp'</script></html>");
	            
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
