package com.restaurant;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class logout
 */
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		HttpSession session=request.getSession(false);
		if(session.getAttribute("cid") != null)
		{
			session.setAttribute("cid",null);
			session.invalidate();
			response.getWriter().print("<html><script>alert('Logged OUT');location.href='index.jsp';</script></html>");
		}
		if(session.getAttribute("rid") != null)
		{
			session.setAttribute("rid",null);
			session.invalidate();
			response.getWriter().print("<html><script>alert('Logged OUT');location.href='index.jsp';</script></html>");
		}
	}

}
