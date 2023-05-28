package com.uniweb.controller;

import com.uniweb.entity.PassedTest;
import com.uniweb.entity.Test;
import com.uniweb.entity.Topic;
import com.uniweb.service.PassedTestService;
import com.uniweb.service.TestService;
import com.uniweb.service.TopicService;
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
@RequestMapping("/tests")
public class TestController {

    private final TestService testService;
    private final PassedTestService passedTestService;

    private final TopicService topicService;


    @GetMapping
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        String type = session.getAttribute("type").toString();

        if (type.equals("admin")) {
            String action = req.getParameter("action");
            if (action != null && action.equals("add")) {

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/test-add.jsp");
                try {
                    List<Topic> topicList = topicService.getAllTopics();
                    req.setAttribute("topics", topicList);
                    requestDispatcher.forward(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else if (action != null && action.equals("EDIT")) {
                List<Topic> topicList = topicService.getAllTopics();
                req.setAttribute("topics", topicList);
                String testToEdit = req.getParameter("testID");
                if (testToEdit != null) {
                    req.setAttribute("test", testService.get(Integer.parseInt(testToEdit)));
                }
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/test-edit.jsp");
                try {
                    requestDispatcher.forward(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                List<PassedTest> passedTestList = passedTestService.get((Integer) session.getAttribute("userID"));
                List<Test> testsList = testService.get();
                List<Topic> topicList = topicService.getAllTopics();
                req.setAttribute("list", testsList);
                req.setAttribute("topics", topicList);
                req.setAttribute("listpassed", passedTestList);
                req.setAttribute("message", req.getSession().getAttribute("message"));

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/adminPages/test-list.jsp");
                try {
                    requestDispatcher.forward(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
        if (type.equals("student")) {
            List<PassedTest> passedTestList = passedTestService.get((Integer) session.getAttribute("userID"));
            List<Test> testsList = testService.get();
            List<Topic> topicList = topicService.getAllTopics();
            req.setAttribute("list", testsList);
            req.setAttribute("topics", topicList);
            req.setAttribute("listpassed", passedTestList);
            req.setAttribute("message", req.getSession().getAttribute("message"));

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/userPages/test-list.jsp");
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

        String action = req.getParameter("action");
        String testId = req.getParameter("testID");

        if (action != null && testId != null && action.equalsIgnoreCase("EDIT")) {
            System.out.println("UPDATE");
            String name = req.getParameter("name");
            Integer complexity = null;
            try {
                complexity = Integer.parseInt(req.getParameter("complexity"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            Integer timeForTest = null;
            try {
                timeForTest = Integer.parseInt(req.getParameter("timeForTest"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            Integer topic = null;
            try {
                topic = Integer.parseInt(req.getParameter("topic"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            Test test = new Test();
            test.setName(name);
            test.setComplexity(complexity);
            test.setTimeForTest(timeForTest);
            test.setTopic(topic);
            try {
                test.setId(Integer.parseInt(req.getParameter("testID")));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            if (testService.update(test)) {
                req.getSession().setAttribute("message", "test updated successfully");
                req.setAttribute("page", "test");
            }
            try {
                resp.sendRedirect(req.getContextPath() + "/tests");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {

            String name = req.getParameter("name");
            Integer complexity = null;
            try {
                complexity = Integer.parseInt(req.getParameter("complexity"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            Integer timeForTest = null;
            try {
                timeForTest = Integer.parseInt(req.getParameter("timeForTest"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            Integer topic = null;
            try {
                topic = Integer.parseInt(req.getParameter("topic"));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            Test test = new Test();
            test.setName(name);
            test.setComplexity(complexity);
            test.setTimeForTest(timeForTest);
            test.setTopic(topic);
            test.setNumberOfRequests(0);

            if (testService.save(test)) {
                req.getSession().setAttribute("message", "test saved successfully");
                req.setAttribute("page", "test");
            }

            try {
                resp.sendRedirect(req.getContextPath() + "/tests");
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
}
