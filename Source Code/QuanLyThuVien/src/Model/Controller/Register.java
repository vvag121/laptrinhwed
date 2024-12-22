package Model.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.UserBO;
import Model.Bean.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserBO userBO = new UserBO();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
    }

    /**
     * Handles the GET request to show the registration page.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/register.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the POST request to process user registration.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Retrieve user details from the form
        String fullName = request.getParameter("fullName"); // Nhận giá trị họ và tên
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate inputs
        String errorString = null;

        if (fullName == null || fullName.isEmpty() || 
            username == null || username.isEmpty() || 
            password == null || password.isEmpty()) {
            errorString = "Full name, username, and password cannot be empty!";
        } else if (!password.equals(confirmPassword)) {
            errorString = "Passwords do not match!";
        }

        if (errorString != null) {
            request.setAttribute("errorString", errorString);
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Create User object
        User user = new User();
        user.setFullName(fullName); // Lưu họ và tên vào đối tượng User
        user.setUsername(username);
        user.setPassword(password);

        try {
            boolean result = userBO.registerUser(user);

            if (result) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } else {
                errorString = "Registration failed. Username might already exist.";
                request.setAttribute("errorString", errorString);
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/register.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            errorString = "An error occurred during registration.";
            request.setAttribute("errorString", errorString);
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/register.jsp");
            dispatcher.forward(request, response);
        }
    }
}
