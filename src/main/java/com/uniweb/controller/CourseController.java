package com.uniweb.controller;

import com.uniweb.entity.Course;
import com.uniweb.entity.EducationalProgram;
import com.uniweb.entity.User;
import com.uniweb.entity.UserType;
import com.uniweb.repository.CourseRepository.CourseDuration;
import com.uniweb.service.CourseService;
import com.uniweb.service.UserService;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/courses")
public class CourseController {

  private final CourseService courseService;

  private final UserService userService;

  @GetMapping
  public void getCourses(HttpServletRequest req, HttpServletResponse resp) {
    HttpSession session = req.getSession();
    String action = req.getParameter("action");
    String id = req.getParameter("id");
    UserType type = (UserType) session.getAttribute("type");
    if (type != null) {
      if (type == UserType.admin) {
        if (action == null) {
          listCourses(req, resp);
        } else if (action.equals("view")) {
          viewCourse(req, resp, id);
        } else if (action.equals("edit_content")) {
          editCourseContent(req, resp, id);
        } else if (action.equals("add_course")) {
          addCoursePage(req, resp);
        } else if (action.equals("delete_course")) {
          deleteCourse(req, resp, id);
        } else if (action.equals("edit_course")) {
          updateCoursePage(req, resp, id);
        }
      } else if (type == UserType.student) {
        if (action == null) {
          listStudentCourses(req, resp);
        } else if (action.equals("view")) {
          viewStudentCourse(req, resp, id);
        } else if (action.equals("finish_course")) {
          finishCourse(req, resp, id);
        } else if (action.equals("begin_course")) {
          beginCourse( req, resp, id);
        }
      }
    }
  }

  private void finishCourse(HttpServletRequest req, HttpServletResponse resp, String id) {
    HttpSession session = req.getSession();
    courseService.completeCourse(Integer.valueOf(id));
    session.setAttribute("message", "Course with id: " + id + ", was completed.");
    listStudentCourses(req, resp);
  }

  private void beginCourse(HttpServletRequest req, HttpServletResponse resp, String id) {
    HttpSession session = req.getSession();
    courseService.beginCourse(Integer.valueOf(id));
    session.setAttribute("message", "Course with id: " + id + ", was started.");
    viewStudentCourse(req, resp, id);
  }

  @PostMapping("/content")
  public void updateCourseContent(HttpServletRequest req, HttpServletResponse resp) {
    HttpSession session = req.getSession();
    String id = req.getParameter("id");
    String content = req.getParameter("content");
    Course course = courseService.findById(Integer.valueOf(id));
    course.setContent(content);
    courseService.update(course);
    session.setAttribute("message",
        "Course content with id: " + id + ", was successfully updated.");
    listCourses(req, resp);
  }

  @PostMapping("/update")
  public void updateCourse(HttpServletRequest req, HttpServletResponse resp) {
    HttpSession session = req.getSession();
    String id = req.getParameter("id");
    Course course;
    if (StringUtils.hasText(id)) {
      course = courseService.findById(Integer.valueOf(id));
    } else {
      course = new Course();
    }
    String name = req.getParameter("name");
    String complexity = req.getParameter("complexity");
    List<Integer> assignedStudents = Arrays.stream(req.getParameterValues("assignedStudents"))
        .map(Integer::valueOf).collect(
            Collectors.toList());
    Set<User> students = new HashSet<>(userService.findAllById(assignedStudents));
    EducationalProgram educationalProgram = EducationalProgram.valueOf(
        req.getParameter("educationalProgram"));
    course.setName(name);
    course.setComplexity(Integer.valueOf(complexity));
    course.setEducationalProgram(educationalProgram);
    course.setAssignedStudents(students);
    course.setContent(DEFAULT_HTML);
    if (StringUtils.hasText(id)) {
      courseService.update(course);
      session.setAttribute("message",
          "Course with id: " + id + ", was successfully updated.");
    } else {
      Course created = courseService.create(course);
      session.setAttribute("message",
          "Course with id: " + created.getId() + ", was successfully created.");
    }
    listCourses(req, resp);
  }

  public void listCourses(HttpServletRequest req, HttpServletResponse resp) {
    List<Course> list = courseService.findAll();
    req.setAttribute("list", list);
    req.setAttribute("message", req.getSession().getAttribute("message"));
    RequestDispatcher requestDispatcher = req.getRequestDispatcher(
        "/views/adminPages/course-list.jsp");
    try {
      requestDispatcher.forward(req, resp);
    } catch (ServletException | IOException e) {
      throw new RuntimeException(e);
    }
  }

  public void listStudentCourses(HttpServletRequest req, HttpServletResponse resp) {
    HttpSession session = req.getSession();
    Integer id = (Integer) session.getAttribute("userID");
    User user = userService.getByID(id);
    Set<Course> list = user.getCourses();
    list.forEach(c -> {
      CourseDuration dates = courseService.getCourseStartEndDate(c.getId(), user.getId());
      c.setStartedDate(dates.getStarteddate());
      c.setCompletedDate(dates.getCompleteddate());
    });
    req.setAttribute("list", list);
    req.setAttribute("message", req.getSession().getAttribute("message"));
    RequestDispatcher requestDispatcher = req.getRequestDispatcher(
        "/views/userPages/course-list.jsp");
    try {
      requestDispatcher.forward(req, resp);
    } catch (ServletException | IOException e) {
      throw new RuntimeException(e);
    }
  }

  public void viewCourse(HttpServletRequest req, HttpServletResponse resp, String id) {
    Course course = courseService.findById(Integer.valueOf(id));
    req.setAttribute("course", course);
    req.setAttribute("message", req.getSession().getAttribute("message"));
    RequestDispatcher requestDispatcher = req.getRequestDispatcher(
        "/views/adminPages/view-course.jsp");
    try {
      requestDispatcher.forward(req, resp);
    } catch (ServletException | IOException e) {
      throw new RuntimeException(e);
    }
  }

  public void viewStudentCourse(HttpServletRequest req, HttpServletResponse resp, String id) {
    HttpSession session = req.getSession();
    Integer userId = (Integer) session.getAttribute("userID");
    Course course = courseService.findById(Integer.valueOf(id));
    CourseDuration duration = courseService.getCourseStartEndDate(Integer.valueOf(id), userId);
    req.setAttribute("course", course);
    req.setAttribute("completedDate", duration.getCompleteddate());
    req.setAttribute("message", req.getSession().getAttribute("message"));
    RequestDispatcher requestDispatcher = req.getRequestDispatcher(
        "/views/userPages/view-course.jsp");
    try {
      requestDispatcher.forward(req, resp);
    } catch (ServletException | IOException e) {
      throw new RuntimeException(e);
    }
  }

  private void updateCoursePage(HttpServletRequest req, HttpServletResponse resp, String id) {
    List<User> students = userService.findAllByType(UserType.student);
    Course course = courseService.findById(Integer.valueOf(id));
    req.setAttribute("students", students);
    req.setAttribute("course", course);
    RequestDispatcher requestDispatcher = req.getRequestDispatcher(
        "/views/adminPages/course-add.jsp");
    try {
      requestDispatcher.forward(req, resp);
    } catch (ServletException | IOException e) {
      throw new RuntimeException(e);
    }
  }

  private void addCoursePage(HttpServletRequest req, HttpServletResponse resp) {
    List<User> students = userService.findAllByType(UserType.student);
    req.setAttribute("students", students);
    RequestDispatcher requestDispatcher = req.getRequestDispatcher(
        "/views/adminPages/course-add.jsp");
    try {
      requestDispatcher.forward(req, resp);
    } catch (ServletException | IOException e) {
      throw new RuntimeException(e);
    }
  }

  private void deleteCourse(HttpServletRequest req, HttpServletResponse resp, String id) {
    HttpSession session = req.getSession();
    courseService.delete(Integer.valueOf(id));
    session.setAttribute("message", "Course with id: " + id + ", was successfully removed.");
    listCourses(req, resp);
  }

  private void editCourseContent(HttpServletRequest req, HttpServletResponse resp, String id) {
    Course course = courseService.findById(Integer.valueOf(id));
    req.setAttribute("course", course);
    req.setAttribute("message", req.getSession().getAttribute("message"));
    RequestDispatcher requestDispatcher = req.getRequestDispatcher(
        "/views/adminPages/edit-course-content.jsp");
    try {
      requestDispatcher.forward(req, resp);
    } catch (ServletException | IOException e) {
      throw new RuntimeException(e);
    }
  }

  public void updateCourse(HttpServletRequest req, HttpServletResponse resp, String id,
      String content) {
    Course course = courseService.findById(Integer.valueOf(id));
    course.setContent(content);
    courseService.update(course);
    listCourses(req, resp);
  }

  private static final String DEFAULT_HTML = "<html lang=\"en\">\n<body>\n<h1>\nThis is default content, please update.\n</h1>\n<p>\nDefault html content\n</p>\n</body>\n</html>";

}
