<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.helper.*,com.entity.*,org.hibernate.*" %>
    
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
    
    <h1>This Is Edit page</h1>
    <br>
    <%
    int NoteId= Integer.parseInt(request.getParameter("note_id"));
    Session s= FactoryProvider.getFactory().openSession();
	Note no=(Note)s.get(Note.class, NoteId);
    
    
    %>
    
    <form action="UpdateServlet" method="post">
    <input value="<%=no.getId()%>" name="note1">
  <div class="mb-3">
    <label for="tilte1" class="form-label">Note Title</label>
    <input type="text" class="form-control" 
    id="title1" aria-describedby="emailHelp"
    placeholder="Note Title" required name="title" 
    
    value="<%=no.getTitle() %>"/>
    
  </div>
  <div class="mb-3">
    <label for=content class="form-label">Note Content</label>
    <textarea name ="content" id="content" placeholder="Note Content"  class="form-control" style="height:300px;" required><%=no.getContent() %>
    </textarea>
  </div>
  
  <div class="container text-center">
  <button type="submit" class="btn btn-success">SaveNotes</button>
  
  </div>
</form>
    
    
    </div>

</body>
</html>