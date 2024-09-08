<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logout</title>

</head>
<body>
  <%
        // Retrieve the session object
        HttpSession currentSession = request.getSession(false);
            
             if(currentSession !=null){
            	 currentSession.invalidate();
            	 
             }

            response.sendRedirect("index.html");
        
    %>
</body>
</html>