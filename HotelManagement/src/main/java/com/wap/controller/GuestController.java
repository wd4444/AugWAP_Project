package com.wap.controller;


import com.google.gson.Gson;
import com.wap.dao.GuestDao;
import com.wap.model.Guest;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class GuestController extends HttpServlet {
    private GuestDao dao;
    private String contactUs;
    private Gson gson = new Gson();

    @Override
    public void init() throws ServletException {
        dao = new GuestDao();
        ServletContext sc = this.getServletContext();
        this.contactUs = sc.getInitParameter("hotel-contact");
    }
// the service method doGet will accept the HttpServletRequest and HttpServlet Response

    /**
     * @param request  the request from the client
     * @param response the response send to back to client
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * @param request  the response
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jsonString = request.getParameter("guest");

        Guest guest = gson.fromJson(jsonString, Guest.class);// changes the josn 'guest' to object guest.
        // setAttribute to global getServletContext
        request.getServletContext().setAttribute("aGuest", guest);
        request.getServletContext().setAttribute("contactUs", contactUs);// not necessary
        // adding guest to dao
        if(request.getServletContext().getAttribute("guestDAO") != null) {
            dao = (GuestDao) request.getServletContext().getAttribute("guestDAO");
        }
        dao.addGuest(guest);

        request.getServletContext().setAttribute("guestDAO", dao);
        // return to js
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(guest));

    }

}

