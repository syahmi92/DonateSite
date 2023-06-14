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
 * Servlet implementation class RegisterController
 */
@WebServlet("/register_home")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	DatabaseHandler dbHandler = new DatabaseHandler();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = 1000 + (int)(Math.random() * (10000 - 1000));  //Minimum + (int)(Math.random() * (Maximum - Minimum))
		String username = request.getParameter("username_register"); 
		String password = request.getParameter("password_register");
		String email = request.getParameter("email_register");
		String name = request.getParameter("name_register");
		String phone = request.getParameter("phone_register");
		String place = request.getParameter("place_register");

		Account acc = new Account();
		
		acc.setAccount_id(id);
		acc.setUsername(username);
		acc.setPassword(password);
		acc.setEmail(email);
		acc.setName(name);
		acc.setPhone(phone);
		acc.setPlace(place);
		
		

		try {
			if (dbHandler.register(acc) > 0) {
				System.out.println("Account successfully register in database");
			} else {
				System.out.println("Account failed to register in database");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("donor_success_register.jsp");
		dispatcher.forward(request, response);
	}

}
