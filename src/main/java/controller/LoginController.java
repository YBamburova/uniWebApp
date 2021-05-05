package controller;

import dao.LoginDAO;
import dao.LoginDAOImpl;
import entity.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    LoginDAO loginDAO = null;

    public LoginController() {
        loginDAO = new LoginDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("language") == null && session.getAttribute("country") == null) {
            session.setAttribute("language", "ua");
            session.setAttribute("country", "UA");
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/publicPages/login.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            req.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        HttpSession session = req.getSession();
        Login login = new Login();
        login.setUsername(req.getParameter("username"));
        login.setPassword(req.getParameter("password"));
        Login authResult = loginDAO.authenticate(login);
        if (authResult != null) {
            if (authResult.getIsBlocked().equals("true")) {
                try {
                    resp.sendRedirect("login?status=blocked");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                session.setAttribute("message", "Your account was blocked by administration");
            } else {
                session.setAttribute("username", authResult.getUsername());
                session.setAttribute("userID", authResult.getId());
                session.setAttribute("type", authResult.getType());
                session.setAttribute("password", authResult.getPassword());
                session.setAttribute("name", authResult.getName());
                session.setAttribute("surname", authResult.getSurname());
                session.setAttribute("email", authResult.getEmail());
                session.setAttribute("isBlocked", authResult.getIsBlocked());
                try {
                    resp.sendRedirect(req.getContextPath() + "/users");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            try {
                resp.sendRedirect("login?status=error");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

