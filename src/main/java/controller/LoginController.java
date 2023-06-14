package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseHandler;
import model.Account;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login_home")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DatabaseHandler dbHandler = new DatabaseHandler();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username_login");
		String password = request.getParameter("password_login");
		Account acc = new Account();
		acc.setUsername(username);
		acc.setPassword(password);

		try {
			if (dbHandler.validate_login(acc)) {

				// get information of user when login
				ResultSet rs = dbHandler.getInfo_login(acc);
				while (rs.next()) {
					int id = rs.getInt("account_id");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String place = rs.getString("place");
					HttpSession session = request.getSession(true);
					session.setAttribute("id", id);
					session.setAttribute("name", name);
					session.setAttribute("phone", phone);
					session.setAttribute("place", place);
				}

				RequestDispatcher dispatcher = request.getRequestDispatcher("donor_main_menu.jsp");
				dispatcher.forward(request, response);
			} else {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("login_register.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
