<%@page import="com.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <%@include file="all_js_css.jsp"%>
</head>
<body>


    <div class="container">
    
    <%@include file="navbar.jsp"%>
    
    <h1>All Notes :</h1>
    
    <div class="row">
    <div cass="col-12">
     <%
        Session s= FactoryProvider.getFactory().openSession();
      Query q= s.createQuery("from Note");
   
      List<Note> l=q.list();
      for(Note n:l){
    	  %>
    	  
    	  <div class="card mt-2" >
              <img class="card-img-top p-3" style="max-width:100px"  src="image/a.png" alt="Card image cap">
                  <div class="card-body ">
                    <h5 class="card-title"><%=n.getTitle() %></h5>
                       <p class="card-text"><%=n.getContent() %></p>
                       <p class="text-primary"><%=n.getAddeddate() %></p>
                           <a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Delete</a>
                           <a href="edit.jsp?note_id=<%=n.getId() %>" class="btn btn-primary">Update</a>
                           
                   </div>
           </div>
    	  
    	  <%
      }
      
    
    
    s.close();
    
    
    
    %>
    </div>
    </div>
    
    </div>

</body>
</html>