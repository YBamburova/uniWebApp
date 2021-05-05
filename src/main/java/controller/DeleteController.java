package controller;

import dao.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete")
public class DeleteController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
        if (action == null) {
            resp.sendRedirect(req.getContextPath() + "/");
        } else if (req.getParameter("id") != null && action.equals("test")) {
            deleteTest(req.getParameter("id"));
            session.setAttribute("message", "Test deleted successfully");
            requestDispatcher = req.getRequestDispatcher("/tests");
        } else if (req.getParameter("id") != null && action.equals("user")) {
            deleteUser(req.getParameter("id"));
            session.setAttribute("message", "User deleted successfully");
            requestDispatcher = req.getRequestDispatcher("/users?action=LIST");
        } else if (req.getParameter("id") != null && action.equals("question")) {
            deleteQuestion(req.getParameter("id"));
            session.setAttribute("message", "Question deleted successfully");
            requestDispatcher = req.getRequestDispatcher("/tests");
        }

        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteTest(String testID) {
        TestDAO testDAO = new TestDAOImpl();
        testDAO.delete(testID);

    }

    public void deleteUser(String userID) {
        UserDAO userDAO = new UserDAOImpl();
        userDAO.delete(userID);
    }

    public void deleteQuestion(String questionID) {
        QuestionDAO questionDAO = new QuestionDAOImpl();
        questionDAO.delete(questionID);
    }
}
