package com.uniweb.controller;

import com.uniweb.entity.User;
import com.uniweb.service.UserService;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping({"/login", "/"})
public class LoginController {

    private final UserService userService;

    @GetMapping
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
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

    @PostMapping
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

        try {
            req.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        HttpSession session = req.getSession();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User authResult = userService.authenticate(username, password);
        if (authResult != null) {
            if (authResult.getIsBlocked()) {
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

