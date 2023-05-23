package com.uniweb.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LanguageModel {

    public static void switchLanguage(HttpServletRequest req) {
        HttpSession session = req.getSession();
        try {
            session.setAttribute("language", req.getParameter("lang"));
            session.setAttribute("country", req.getParameter("lang").toUpperCase());
        } catch (Exception e) {
            session.setAttribute("language", "en");
            session.setAttribute("country", "EN");
        }

    }

    public static void setDefaultLanguage(HttpServletRequest req) {
        HttpSession session = req.getSession();
        if (session.getAttribute("language") == null && session.getAttribute("country") == null) {
            session.setAttribute("language", "ua");
            session.setAttribute("country", "UA");
        }
    }

}
