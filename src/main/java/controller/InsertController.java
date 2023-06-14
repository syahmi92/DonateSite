package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.DatabaseHandler;
import model.PrelovedItem;

/**
 * Servlet implementation class InsertController
 */
@MultipartConfig
@WebServlet("/insert_new")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DatabaseHandler dbHandler = new DatabaseHandler();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertController() {
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

		Part photo1 = null, photo2 = null, photo3 = null, photo4 = null;
		String name_photo1 = null, name_photo2 = null, name_photo3 = null, name_photo4 = null;
		String uploadPath1 = null, uploadPath2 = null, uploadPath3 = null, uploadPath4 = null;   

		try {

			if (request.getPart("item-photo-1").getSize() > 0) {
				
				//Write file to path
				photo1 = request.getPart("item-photo-1");
				name_photo1 = photo1.getSubmittedFileName();
				uploadPath1 = "D:/OneDrive - Universiti Sains Islam Malaysia/University Documents/Degree/Semester 5/Advance Java Programming/Eclipse Workspace/DonateSite/src/main/webapp/database-image/"+ name_photo1;
				FileOutputStream fileOutputStream = new FileOutputStream(uploadPath1);
				InputStream inputStream=photo1.getInputStream();
				byte[] data=new byte[inputStream.available()];
				inputStream.read(data);
				fileOutputStream.write(data);
				fileOutputStream.close();
			}

			if (request.getPart("item-photo-2").getSize() > 0) {
				photo2 = request.getPart("item-photo-2");
				name_photo2 = photo2.getSubmittedFileName();
				uploadPath2 = "D:/OneDrive - Universiti Sains Islam Malaysia/University Documents/Degree/Semester 5/Advance Java Programming/Eclipse Workspace/DonateSite/src/main/webapp/database-image/"+ name_photo2;
				FileOutputStream fileOutputStream = new FileOutputStream(uploadPath2);
				InputStream inputStream=photo2.getInputStream();
				byte[] data=new byte[inputStream.available()];
				inputStream.read(data);
				fileOutputStream.write(data);
				fileOutputStream.close();
			}

			if (request.getPart("item-photo-3").getSize() > 0) {
				photo3 = request.getPart("item-photo-3");
				name_photo3 = photo3.getSubmittedFileName();
				uploadPath3 = "D:/OneDrive - Universiti Sains Islam Malaysia/University Documents/Degree/Semester 5/Advance Java Programming/Eclipse Workspace/DonateSite/src/main/webapp/database-image/"+ name_photo3;
				FileOutputStream fileOutputStream = new FileOutputStream(uploadPath3);
				InputStream inputStream=photo3.getInputStream();
				byte[] data=new byte[inputStream.available()];
				inputStream.read(data);
				fileOutputStream.write(data);
				fileOutputStream.close();
			}

			if (request.getPart("item-photo-4").getSize() > 0) {
				photo4 = request.getPart("item-photo-4");
				name_photo4 = photo4.getSubmittedFileName();
				uploadPath4 = "D:/OneDrive - Universiti Sains Islam Malaysia/University Documents/Degree/Semester 5/Advance Java Programming/Eclipse Workspace/DonateSite/src/main/webapp/database-image/"+ name_photo4;
				FileOutputStream fileOutputStream = new FileOutputStream(uploadPath4);
				InputStream inputStream=photo4.getInputStream();
				byte[] data=new byte[inputStream.available()];
				inputStream.read(data);
				fileOutputStream.write(data);
				fileOutputStream.close();
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		int item_id = 1000 + (int) (Math.random() * (10000 - 1000)); // Minimum + (int)(Math.random() * (Maximum - //
		// Minimum))
		String item_name = request.getParameter("itemName");
		String item_place = request.getParameter("itemPlace");
		String item_category = request.getParameter("itemCategory");
		String item_contact = request.getParameter("itemContact");
		String item_desc = request.getParameter("itemDesc");
		int account_id = Integer.parseInt(request.getParameter("getAccountID"));

		PrelovedItem item = new PrelovedItem();
		item.setFirst_image(name_photo1);
		item.setSecond_image(name_photo2);
		item.setThird_image(name_photo3);
		item.setFourth_image(name_photo4);
		item.setItem_id(item_id);
		item.setItem_name(item_name);
		item.setItem_place(item_place);
		item.setItem_category(item_category);
		item.setItem_contact(item_contact);
		item.setItem_desc(item_desc);
		item.setAccount_id(account_id);
		
		try {
			if (dbHandler.insert_item(item) > 0) {
				System.out.println("Item successfully saved in database");
			} else {
				System.out.println("Item failed to saved in database");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("donor_item_list.jsp?page=1");
		dispatcher.forward(request, response);
	}

}
