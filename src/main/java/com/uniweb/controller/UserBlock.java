package com.uniweb.controller;

import com.uniweb.dao.UserDAO;
import com.uniweb.dao.UserDAOImpl;
import com.uniweb.entity.User;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users/block")
public class UserBlock {
    UserDAO userDAO = null;

    public UserBlock() {
        userDAO = new UserDAOImpl();
    }

    @GetMapping
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String type = (String) session.getAttribute("type");

        if (type.equals("admin")) {

            System.out.println("block servlet");
            String userName = req.getParameter("userName");
            User user = new User();
            user.setUsername(userName);
            if (userDAO.block(user)) {
                req.setAttribute("message", "User blocked successfully");
            }
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/users?action=LIST");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/users?action=LIST");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
