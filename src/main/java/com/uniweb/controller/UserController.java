package com.uniweb.controller;

import com.uniweb.entity.EducationalProgram;
import com.uniweb.entity.User;
import com.uniweb.entity.UserType;
import com.uniweb.service.UserService;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
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
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    @GetMapping
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        UserType type = (UserType) session.getAttribute("type");
        if (type != null) {

            if (type == UserType.admin) {
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
            if (type == UserType.student) {
                if (action == null) {
                    String id = session.getAttribute("userID").toString();
                    User user = null;
                    try {
                        user = userService.getByID(Integer.parseInt(id));
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
        List<User> list = userService.findAll();
        req.setAttribute("list", list);
        req.setAttribute("message", req.getSession().getAttribute("message"));

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/user-list.jsp");
        requestDispatcher.forward(req, resp);
    }

    @GetMapping("/block")
    protected void blockUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        UserType type = (UserType) session.getAttribute("type");

        if (type == UserType.admin) {
            int id = Integer.parseInt(req.getParameter("id"));
            if (userService.block(id)) {
                req.setAttribute("message", "User blocked successfully");
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

    @GetMapping("/unblock")
    protected void unblockUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserType type = (UserType) session.getAttribute("type");
        if (type == UserType.admin) {
            int id = Integer.parseInt(req.getParameter("id"));
            if (userService.unBlock(id)) {
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

    @PostMapping
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String username = req.getParameter("username");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        EducationalProgram educationalProgram = EducationalProgram.valueOf(req.getParameter("educationalProgram"));
        int support = Integer.parseInt(req.getParameter("supportLevel"));
        String additionalInfo = req.getParameter("additionalInfo");
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
        user.setSupportLevel(support);
        user.setEducationalProgram(educationalProgram);
        user.setAdditionalInfo(additionalInfo);
        user.setEmail(email);
        user.setPassword(password);

        if (!id.isEmpty()) {
            //save
            if (userService.update(user)) {
                req.setAttribute("message", "User saved successfully!");
                req.setAttribute("page", "user");
            }

        } else {
            //update
            user.setType(UserType.student);
            user.setEducationalProgram(EducationalProgram.typical);
            if (userService.save(user)) {
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

    }


    public void getSingleUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        User user = userService.getByID(Integer.parseInt(id));
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
