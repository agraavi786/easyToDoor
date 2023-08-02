package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.Note;
import com.helper.FactoryProvider;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateServlet() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		int noteid=Integer.parseInt(request.getParameter("note1"));
		String title= request.getParameter("title");
		String content= request.getParameter("content");
		
		
		
		Session s= FactoryProvider.getFactory().openSession();
		Note n=(Note)s.get(Note.class, noteid);
		Transaction tx= s.beginTransaction();
		
		n.setTitle(title);
		n.setContent(content);
		n.setAddeddate(new Date());
		
		s.save(n);
		tx.commit();
		
		s.close();
		response.sendRedirect("all_notes.jsp");
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		
	}

}
