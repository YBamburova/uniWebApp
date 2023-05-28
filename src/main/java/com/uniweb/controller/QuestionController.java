package com.uniweb.controller;

import com.uniweb.entity.Question;
import com.uniweb.entity.Test;
import com.uniweb.entity.UserType;
import com.uniweb.repository.TestRepository;
import com.uniweb.service.QuestionService;
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
@RequestMapping("/questions")
public class QuestionController {
    private final QuestionService questionService;
    private final TestRepository testRepository;

    @GetMapping
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        UserType type = (UserType) session.getAttribute("type");

        if (type == UserType.admin) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/question-add.jsp");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/");
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
        boolean option1IsCorrect = false;
        boolean option2IsCorrect = false;
        boolean option3IsCorrect = false;
        boolean option4IsCorrect = false;

        Integer testID = null;
        try {
            testID = Integer.parseInt(req.getParameter("testID"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        String text = req.getParameter("text");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");

        if (req.getParameter("option1IsCorrect") != null && req.getParameter("option1IsCorrect").equals("true")) {
          option1IsCorrect = true;
        }
        if (req.getParameter("option2IsCorrect") != null && req.getParameter("option2IsCorrect")
            .equals("true")) {
          option2IsCorrect = true;
        }

        if (req.getParameter("option3IsCorrect") != null && req.getParameter("option3IsCorrect")
            .equals("true")) {
          option3IsCorrect = true;
        }
        if (req.getParameter("option4IsCorrect") != null && req.getParameter("option4IsCorrect")
            .equals("true")) {
          option4IsCorrect = true;
        }
        Question question = new Question();
        if (testID!= null) {
            Test test = testRepository.findById(testID).orElseThrow(() -> new IllegalArgumentException("No test found"));
            question.setTest(test);
        }
        question.setText(text);
        question.setOption1(option1);
        question.setOption2(option2);
        question.setOption3(option3);
        question.setOption4(option4);
        question.setOption1IsCorrect(option1IsCorrect);
        question.setOption2IsCorrect(option2IsCorrect);
        question.setOption3IsCorrect(option3IsCorrect);
        question.setOption4IsCorrect(option4IsCorrect);
        if (questionService.save(question)) {
            req.setAttribute("message", "Question saved successfully");
            req.setAttribute("page", "question");
        }

        try {
            resp.sendRedirect(req.getContextPath() + "/tests");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
