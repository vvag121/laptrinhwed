package Model.BO;

import java.sql.SQLException;

import Model.Bean.User;
import Model.DAO.UserDAO;

public class UserBO {
    UserDAO userDAO = new UserDAO();


    public User getAccount(String username, String password) throws ClassNotFoundException, SQLException {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        return userDAO.getUser(username, password);
    }


    public boolean registerUser(User user) throws SQLException, ClassNotFoundException {
        // Check if the username already exists
        User existingUser = userDAO.findUser(user.getUsername());
        if (existingUser != null) {
            return false; // Username already exists
        }

        // Add the new user to the database
        return userDAO.addUser(user);
    }
}
