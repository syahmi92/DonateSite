package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SearchBoxController
 */
@WebServlet("/search_result")
public class SearchBoxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBoxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String item_place = request.getParameter("location");
		String item_category = request.getParameter("category");
		String item_name = request.getParameter("search");
		
		//Debugging search box
		/*System.out.println("Place chosen in search box :" + item_place);
		System.out.println("Category chosen in search box :"+ item_category);
		System.out.println("Name chosen in search box :" +item_name);*/
		
		
		HttpSession session = request.getSession();
		session.setAttribute("item_place", item_place);
		session.setAttribute("item_name", item_name);
		session.setAttribute("item_category", item_category);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("item_list_search_result.jsp?page=1");
		dispatcher.forward(request, response);
		
	}

}
