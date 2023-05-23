package com.uniweb.controller;

import com.uniweb.dao.UserDAO;
import com.uniweb.dao.UserDAOImpl;
import com.uniweb.entity.User;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UserController {
    UserDAO userDAO = null;

    public UserController() {
        userDAO = new UserDAOImpl();
    }

    @GetMapping
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        String type = (String) session.getAttribute("type");
        if (type != null) {

            if (type.equals("admin")) {
                if (action == null) {
                    try {
                        listUsers(req, resp);
                    } catch (ServletException | IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    if (action.equals("LIST")) {
                        try {
                            listUsers(req, resp);
                        } catch (ServletException | IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (action.equals("EDIT")) {
                        try {
                            getSingleUser(req, resp);
                        } catch (ServletException | IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (action.equals("ADD")) {
                        try {
                            addUser(req, resp);
                        } catch (ServletException | IOException e) {
                            e.printStackTrace();
                        }
                    }


                }

            }
            if (type.equals("student")) {
                if (action == null) {
                    String id = session.getAttribute("userID").toString();
                    User user = null;
                    try {
                        user = userDAO.getByID(Integer.parseInt(id));
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                    req.setAttribute("user", user);
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/userPages/user-info.jsp");
                    try {
                        requestDispatcher.forward(req, resp);
                    } catch (ServletException | IOException e) {
                        e.printStackTrace();
                    }
                } else if (action.equals("EDIT")) {
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/userPages/user-edit.jsp");
                    try {
                        requestDispatcher.forward(req, resp);
                    } catch (ServletException | IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        if (action != null) {
            if (action.equals("SIGNUP")) {
                try {
                    signUpUser(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void listUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> list = userDAO.get();
        req.setAttribute("list", list);
        req.setAttribute("message", req.getSession().getAttribute("message"));

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/user-list.jsp");
        requestDispatcher.forward(req, resp);
    }

    @PostMapping
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        HttpSession session = req.getSession();
//        if (session.getAttribute("userID") == null) {


        String username = req.getParameter("username");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String id = req.getParameter("id");

        User user = new User();
        if (!id.isEmpty()) {
            try {
                user.setId(Integer.parseInt(id));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        user.setUsername(username);
        user.setName(name);
        user.setSurname(surname);
        user.setEmail(email);
        user.setPassword(password);

        if (!id.isEmpty()) {
            //save
            if (userDAO.update(user)) {
                req.setAttribute("message", "User saved successfully!");
                req.setAttribute("page", "user");
            }

        } else {
            //update
            if (userDAO.save(user)) {
                req.setAttribute("message", "User updated successfully!");
                req.setAttribute("page", "user");
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
//        }

//        else {
//            String username = req.getParameter("username");
//            String name = req.getParameter("name");
//            String surname = req.getParameter("surname");
//            String email = req.getParameter("email");
//            String password = req.getParameter("password");
//            Integer id = null;
//            if (session.getAttribute("type").equals("student")) {
//                id = (Integer) session.getAttribute("userID");
//            }
//            else if (session.getAttribute("type").equals("admin")) {
//                try {
//                    if (!req.getParameter("id").isEmpty()){
//                    id = Integer.parseInt(req.getParameter("id"));}
//                } catch (NumberFormatException e) {
//                    e.printStackTrace();
//                }
//            }
//
//            User user = new User();
//
//            user.setName(name);
//            user.setUsername(username);
//            user.setSurname(surname);
//            user.setEmail(email);
//            user.setPassword(password);
//            user.setId(id);
//
//            if (userDAO.update(user)){
//                session.setAttribute("message", "User updated successfully!");
//                req.setAttribute("page", "user");
//
//               if (session.getAttribute("type").equals("student")) {
//                   session.setAttribute("username", user.getUsername());
//                   session.setAttribute("password", user.getPassword());
//                   session.setAttribute("name", user.getName());
//                   session.setAttribute("surname", user.getSurname());
//                   session.setAttribute("email", user.getEmail());
//               }
//            }
//            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
//            try {
//                requestDispatcher.forward(req, resp);
//            } catch (ServletException | IOException e) {
//                e.printStackTrace();
//            }
//        }

    }


    public void getSingleUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        User user = userDAO.getByID(Integer.parseInt(id));
        req.setAttribute("user", user);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/user-add.jsp");
        requestDispatcher.forward(req, resp);


    }

    public void signUpUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/publicPages/user-add.jsp");
        requestDispatcher.forward(req, resp);
    }

    public void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/user-add.jsp");
        requestDispatcher.forward(req, resp);
    }
}
