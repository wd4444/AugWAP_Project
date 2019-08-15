package com.wap.controller;

import com.google.gson.Gson;
import com.wap.dao.GuestDao;
import com.wap.model.BillingInfo;
import com.wap.model.Guest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GuestDao guestDao;
    Gson mapper = new Gson();


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        request.setAttribute("products", dao.getAllProducts());
        RequestDispatcher view = request.getRequestDispatcher("login.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jsonSting = request.getParameter("billingInfo");
        BillingInfo billingInfo = mapper.fromJson(request.getParameter("billingInfo"), BillingInfo.class);
        String guestId = billingInfo.getId();
        GuestDao guestDao = (GuestDao) request.getSession().getAttribute("guestDAO");
        Guest guest = guestDao.getGuestById(Integer.parseInt(guestId));
        float rate = guest.getRoom().getRate();
         String in= guest.getCheckInTime();
         guestDao.removeGuest(guest);
        response.sendRedirect("checkin.jsp");
    }

}
