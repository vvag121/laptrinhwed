package Model.Controller;
import Model.Bean.User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserManual
 */
@WebServlet("/UserManual")
public class UserManual extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManual() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra xem người dùng đã đăng nhập hay chưa (tức là kiểm tra xem session có chứa đối tượng "User" không)
        if (request.getSession().getAttribute("User") == null) {
            response.sendRedirect("login.jsp"); // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            return;
        }

        // Lấy đối tượng User từ session
        User user = (User) request.getSession().getAttribute("User");

        // Lấy fullName từ đối tượng User
        String fullName = user.getFullName();
        //

        // Lưu fullName vào session nếu muốn sử dụng trong các trang khác
        request.getSession().setAttribute("FullName", fullName);

        // Thiết lập thuộc tính session cho hướng dẫn sử dụng
        request.getSession().setAttribute("Check", "Manual");

        // Chuyển hướng người dùng đến home.jsp
        response.sendRedirect("home.jsp");
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
