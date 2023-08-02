package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.entity.Note;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String title =request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note= new Note(title,content,new Date());
			//System.out.println(note.getId() +" :"+ note.getContent());
//			Configuration cfg= new Configuration();
//			SessionFactory f= cfg.configure().buildSessionFactory();
//			Session ses=f.openSession();
			
			
			Session ses=FactoryProvider.getFactory().openSession();
			
			Transaction tx = ses.beginTransaction();
			
			ses.save(note);
			tx.commit();
			
			ses.close();
			response.setContentType("text/html");
			response.sendRedirect("all_notes.jsp");
//			PrintWriter out = response.getWriter();
//			out.println("<h1 style='text-align:center;'> Note is loaded successfuy </h1>");
//			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View Notes</h1>");
			
			
			
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		
	}

}
