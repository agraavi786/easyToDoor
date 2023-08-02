package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;

import org.hibernate.Session;

import com.entity.Note;
import com.helper.FactoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int noteId= Integer.parseInt(request.getParameter("note_id").trim());
			Session s= FactoryProvider.getFactory().openSession();
			Note no=(Note)s.get(Note.class, noteId);
			
			org.hibernate.Transaction tx= s.beginTransaction();
			s.delete(no);
			
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
			
		}
		catch(Exception e){
			System.out.println(e.getMessage());
			
		}
	}

	

}