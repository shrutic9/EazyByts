

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.eLearn.entities.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class Teacherlog
 */
public class Teacherlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String password = request.getParameter("password");
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
            
            Query q1= session.createQuery("FROM Teacher where tmail=:mail and tpass=:pass")
            		.setParameter("mail", email)
            		.setParameter("pass", password);
            
            //Storing record in teacher object
            Teacher teacher=(Teacher)q1.uniqueResult();
            
            if(teacher==null)
            {
            	out.println("<html><script>alert('Incorrect Username or Password!')</script></html>");
            }
            else
            {
            	out.println("<html><script>alert('Login Successful')</script></html>");
            	
            	//Setting up Sessions for successful login
            	request.getSession().setAttribute("tid",teacher.getId());
            	request.getSession().setAttribute("uname",teacher.getTname());
            	request.getSession().setAttribute("temail",email);
            	
            	response.sendRedirect("profile.jsp");
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
