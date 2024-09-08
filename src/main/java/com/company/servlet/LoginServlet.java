package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.company.dao.UserDao;
import com.company.dao.UserDaoImp;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")  // Ensure the URL pattern matches your setup
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final UserDao userdao = new UserDaoImp();  // Ensure UserDaoImp implements UserDao
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If someone accesses the login page directly via GET, redirect them to the login form.
        response.sendRedirect("Login.jsp");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try {
            if (userdao.isValidUser(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("Welcome.jsp");
            } else {
                response.sendRedirect("Login.jsp?error=1");
            }
        } catch (Exception e) {
            // Log the exception and redirect to an error page
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
