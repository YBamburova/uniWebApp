package com.uniweb.controller;

import com.uniweb.service.QuestionService;
import com.uniweb.service.TestService;
import com.uniweb.service.UserService;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/delete")
public class DeleteController {

    private final UserService userService;
    private final TestService testService;
    private final QuestionService questionService;

    @GetMapping
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
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
        testService.delete(testID);
    }
    public void deleteUser(String userID) {
        userService.delete(userID);
    }
    public void deleteQuestion(String questionID) {
        questionService.delete(questionID);
    }
}
