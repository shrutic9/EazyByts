

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.eLearn.entities.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Studentlog
 */
public class Studentlog extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String semail = request.getParameter("email");
        String spassword = request.getParameter("password");
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
            
            Query q1= session.createQuery("FROM Student where semail=:mail and spass=:pass")
            		.setParameter("mail", semail)
            		.setParameter("pass", spassword);
            
            //Storing record in teacher object
            Student student=(Student)q1.uniqueResult();
            
            if(student==null)
            {
            	out.println("<html><script>alert('Incorrect Username or Password!')</script></html>");
            }
            else
            {
            	out.println("<html><script>alert('Login Successful')</script></html>");
            	
            	//Setting up Sessions for successful login
            	request.getSession().setAttribute("sid",student.getSid());
            	request.getSession().setAttribute("sname",student.getName());
            	request.getSession().setAttribute("smail",semail);
            	
            	response.sendRedirect("Studprofile.jsp");
            }
            
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
