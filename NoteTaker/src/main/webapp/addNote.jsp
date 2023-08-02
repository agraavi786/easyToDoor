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
    
    <h1>This Add note page</h1>
    
    
    
    <form action="SaveNoteServlet" method="post">
  <div class="mb-3">
    <label for="tilte1" class="form-label">Note Title</label>
    <input type="text" class="form-control" 
    id="title1" aria-describedby="emailHelp"
    placeholder="Note Title" required name="title" />
    
  </div>
  <div class="mb-3">
    <label for=content class="form-label">Note Content</label>
    <textarea name ="content" id="content" placeholder="Note Content" class="form-control" style="height:300px;" required></textarea>
  </div>
  
  <div class="container text-center">
  
  <button type="submit" class="btn btn-primary">Add</button>
  
  </div>
</form>
<a href="index.jsp"><button class="btn btn-outline-primary text-center">Back</button></a>

</div>





</body>
</html>