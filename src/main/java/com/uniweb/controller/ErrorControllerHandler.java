package com.uniweb.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorControllerHandler implements ErrorController {


  @RequestMapping("/error")
  public void handleError(HttpServletRequest req, HttpServletResponse resp) {
    //do something like logging
    RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/publicPages/error.jsp");
    try {
      requestDispatcher.forward(req, resp);
    } catch (ServletException | IOException e) {
      e.printStackTrace();
    }
  }

}
