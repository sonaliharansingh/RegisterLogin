<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

<style>
body {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
    background-color: #AEFD6C;
    background-image: url('background.png');
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
}

.container {
    width: 80%;
    max-width: 400px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 1, 0.5);
    background-color: #AEFD6C;
    text-align: center;
}

h1 {
    font-weight: bold;
    text-align: center;
    color: #333;
}

p {
    color: #555;
}

a {
    text-decoration: none;
    color: #007BFF;
    font-weight: bold;
}

a:hover {
    color: #0056b3;
}
</style>
</head>
<body>
 <%
        // Retrieve the session object
        HttpSession session1 = request.getSession(false);

        // Check if the session is not null and the username attribute is set
        if (session1 != null && session1.getAttribute("username") != null) {
            // Get the username from the session
            String username = (String) session1.getAttribute("username");
    %>
  
      <div class="container">
        <h1>Welcome, <%= username %>!</h1>
        <p>We're delighted to have you on our platform. 🌟</p>
        <h3>Explore, learn, and connect with our vibrant community! 🚀</h3>
        <p>Feel free to stay as long as you like, and when you're ready,</p> 
        you can <a href="logout.jsp">LOGOUT</a> securely.
    </div>
    
    <%
        } else {
            // Redirect to the login page if the session is not valid
            response.sendRedirect("login.jsp");
        }
    %>

</body>
</html>
