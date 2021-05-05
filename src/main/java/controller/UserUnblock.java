package controller;

import dao.UserDAO;
import dao.UserDAOImpl;
import entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/users/unblock")
public class UserUnblock extends HttpServlet {
    UserDAO userDAO = null;

    public UserUnblock() {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String type = (String) session.getAttribute("type");

        if (type.equals("admin")) {


            System.out.println("unblock servlet");
            String userName = req.getParameter("userName");
            User user = new User();
            user.setUsername(userName);
            if (userDAO.unBlock(user)) {
                req.setAttribute("message", "User unblocked successfully");
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/users?action=LIST");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/users?action=LIST");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }
}
