package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHandler;
import model.Account;

/**
 * Servlet implementation class ResetPassController
 */
@WebServlet("/reset")
public class ResetPassController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DatabaseHandler dbHandler = new DatabaseHandler();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResetPassController() {
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
		String username = request.getParameter("username_reset");
		String newPassword = request.getParameter("new_password");
		String confirmPassword = request.getParameter("confirm_password");

		Account acc = new Account();

		if (newPassword.equals(confirmPassword)) {
			acc.setPassword(newPassword);
			acc.setUsername(username);
		}
		try {
			if (dbHandler.reset_password(acc) > 0) {
				System.out.println("Password successfully reset.");
			} else {
				System.out.println("Password fail to reset.");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("reset_pass_success.jsp");
		dispatcher.forward(request, response);
	}

}
