package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Account;
import model.PrelovedItem;

public class DatabaseHandler {

	// check existing account in database for login
	public boolean validate_login(Account acc) throws ClassNotFoundException {

		boolean status = false;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

				// STEP 2: Create statement

				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM account WHERE username = ? AND password = ? ")) {
			preparedStatement.setString(1, acc.getUsername());
			preparedStatement.setString(2, acc.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			status = rs.next();

		}

		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			// printSQLException(e);
		}
		return status;

	}

	// Get information from database when login
	public ResultSet getInfo_login(Account acc) throws ClassNotFoundException {

		ResultSet rs = null;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create Statement
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT * FROM account WHERE username = ?");
			preparedStatement.setString(1, acc.getUsername());

			System.out.println(preparedStatement);
			rs = preparedStatement.executeQuery();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return rs;
	}

	// register new donor account
	public int register(Account acc) throws ClassNotFoundException {

		int registerSuccess = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create statement
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO account(account_id, username, password, email, name, phone, place) VALUES (?, ?, ?, ?, ?, ?, ?);");

			preparedStatement.setInt(1, acc.getAccount_id());
			preparedStatement.setString(2, acc.getUsername());
			preparedStatement.setString(3, acc.getPassword());
			preparedStatement.setString(4, acc.getEmail());
			preparedStatement.setString(5, acc.getName());
			preparedStatement.setString(6, acc.getPhone());
			preparedStatement.setString(7, acc.getPlace());

			System.out.println(preparedStatement);

			registerSuccess = preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return registerSuccess;
	}

	// insert new item list
	public int insert_item(PrelovedItem item) throws ClassNotFoundException {

		int insertSuccess = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create statement
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO preloved_item(item_id, first_img, second_img, third_img, fourth_img, item_name, item_place, item_category, item_contact, item_desc, account_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");

			preparedStatement.setInt(1, item.getItem_id());
			preparedStatement.setString(2, item.getFirst_image());
			preparedStatement.setString(3, item.getSecond_image());
			preparedStatement.setString(4, item.getThird_image());
			preparedStatement.setString(5, item.getFourth_image());
			preparedStatement.setString(6, item.getItem_name());
			preparedStatement.setString(7, item.getItem_place());
			preparedStatement.setString(8, item.getItem_category());
			preparedStatement.setString(9, item.getItem_contact());
			preparedStatement.setString(10, item.getItem_desc());
			preparedStatement.setInt(11, item.getAccount_id());

			System.out.println(preparedStatement);

			insertSuccess = preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return insertSuccess;
	}

	// get particular Donor item list
	public ResultSet getDonor_itemList(int account_id, int start_row, int total_row_record)
			throws ClassNotFoundException {

		ResultSet rs = null;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create Statement
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT * FROM preloved_item WHERE account_id = ? LIMIT ?,?");
			preparedStatement.setInt(1, account_id);
			preparedStatement.setInt(2, start_row);
			preparedStatement.setInt(3, total_row_record);

			System.out.println(preparedStatement);
			rs = preparedStatement.executeQuery();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return rs;
	}

	// Retrieve item in database
	public ResultSet get_item(int start_row, int total_row_record) throws ClassNotFoundException {

		ResultSet rs = null;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create Statement
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM preloved_item LIMIT ?, ?");
			preparedStatement.setInt(1, start_row);
			preparedStatement.setInt(2, total_row_record);

			System.out.println(preparedStatement);
			rs = preparedStatement.executeQuery();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return rs;
	}

	// get particular item detail
	public ResultSet getItem_detail(int item_id) throws ClassNotFoundException {

		ResultSet rs = null;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create Statement
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT * FROM preloved_item WHERE item_id = ?");
			preparedStatement.setInt(1, item_id);

			System.out.println(preparedStatement);
			rs = preparedStatement.executeQuery();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return rs;
	}

	// Get blob for converting image to output stream
	public ResultSet retrieve_image(int item_id) throws ClassNotFoundException {

		ResultSet rs = null;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create Statement
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT * FROM preloved_item WHERE item_id = ?");
			preparedStatement.setInt(1, item_id);
			rs = preparedStatement.executeQuery();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return rs;
	}

	// Delete item in donor list
	public int deleteItem(int item_id) throws ClassNotFoundException {

		int deleteSuccess = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create statement
			PreparedStatement preparedStatement = connection
					.prepareStatement("DELETE FROM preloved_item WHERE item_id=?");

			preparedStatement.setInt(1, item_id);

			System.out.println(preparedStatement);

			deleteSuccess = preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return deleteSuccess;
	}

	// Get item detail for edit
	public ResultSet getDonor_item_detail(int item_id) throws ClassNotFoundException {

		ResultSet rs = null;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create Statement
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT * FROM preloved_item WHERE item_id = ?");
			preparedStatement.setInt(1, item_id);

			System.out.println(preparedStatement);
			rs = preparedStatement.executeQuery();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return rs;
	}

	public int update_item(PrelovedItem item) throws ClassNotFoundException {

		int updateSuccess = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create statement
			PreparedStatement preparedStatement = connection.prepareStatement(
					"UPDATE preloved_item set  first_img=?, second_img=?, third_img=?, fourth_img=?, item_name=?, item_place=?, item_category=?, item_contact=?, item_desc=? WHERE item_id=?");

			preparedStatement.setString(1, item.getFirst_image());
			preparedStatement.setString(2, item.getSecond_image());
			preparedStatement.setString(3, item.getThird_image());
			preparedStatement.setString(4, item.getFourth_image());
			preparedStatement.setString(5, item.getItem_name());
			preparedStatement.setString(6, item.getItem_place());
			preparedStatement.setString(7, item.getItem_category());
			preparedStatement.setString(8, item.getItem_contact());
			preparedStatement.setString(9, item.getItem_desc());
			preparedStatement.setInt(10, item.getItem_id());

			System.out.println(preparedStatement);

			updateSuccess = preparedStatement.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return updateSuccess;
	}

	// Get item for search result
	public ResultSet search_result(String item_place, String item_category, String item_name, int start_row,
			int total_data_row_record) throws ClassNotFoundException {

		ResultSet rs = null;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create Statement
			if (item_place != null && item_category != null && item_name != null) {
				PreparedStatement preparedStatement = connection.prepareStatement(
						"SELECT * FROM preloved_item WHERE item_place = ? AND item_category = ? AND item_name LIKE ? LIMIT ?,?");
				preparedStatement.setString(1, item_place);
				preparedStatement.setString(2, item_category);
				preparedStatement.setString(3, "%" + item_name + "%");
				preparedStatement.setInt(4, start_row);
				preparedStatement.setInt(5, total_data_row_record);

				System.out.println(preparedStatement);
				rs = preparedStatement.executeQuery();
			}

			if (item_place != null && item_category == null && item_name.isEmpty()) {
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM preloved_item WHERE item_place = ? LIMIT ?,?");
				preparedStatement.setString(1, item_place);
				preparedStatement.setInt(2, start_row);
				preparedStatement.setInt(3, total_data_row_record);

				System.out.println(preparedStatement);
				rs = preparedStatement.executeQuery();
			}

			if (item_place == null && item_category != null && item_name.isEmpty()) {
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM preloved_item WHERE item_category = ? LIMIT ?,?");
				preparedStatement.setString(1, item_category);
				preparedStatement.setInt(2, start_row);
				preparedStatement.setInt(3, total_data_row_record);

				System.out.println(preparedStatement);
				rs = preparedStatement.executeQuery();
			}

			if (item_place == null && item_category == null && item_name != null) {
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM preloved_item WHERE item_name LIKE ? LIMIT ?,?");
				preparedStatement.setString(1, "%" + item_name + "%");
				preparedStatement.setInt(2, start_row);
				preparedStatement.setInt(3, total_data_row_record);

				System.out.println(preparedStatement);
				rs = preparedStatement.executeQuery();
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return rs;
	}

	public int reset_password(Account acc) throws ClassNotFoundException {
		int resetSuccess = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/donate_site?useTimeZone=true&serverTimezone=UT", "root", "root");

			// Create statement
			PreparedStatement preparedStatement = connection
					.prepareStatement("UPDATE account set password = ? WHERE username=?");

			preparedStatement.setString(1, acc.getPassword());
			preparedStatement.setString(2, acc.getUsername());

			System.out.println(preparedStatement);

			resetSuccess = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return resetSuccess;
	}

}
