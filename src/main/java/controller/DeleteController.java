package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHandler;

/**
 * Servlet implementation class DeleteController
 */
@WebServlet("/removed_item")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	DatabaseHandler dbHandler = new DatabaseHandler();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int delete_item_code = Integer.parseInt(request.getParameter("item-id"));
		
		try {
			if (dbHandler.deleteItem(delete_item_code) > 0) {
				System.out.println("Item successfully delete in database");
			} else {
				System.out.println("Item failed to delete in database");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		
		 RequestDispatcher dispatcher = request.getRequestDispatcher("donor_item_list.jsp?page=1");
		 dispatcher.forward(request, response);
	}

}
