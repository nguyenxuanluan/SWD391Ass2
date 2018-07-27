/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.FriendDAO;
import model.RequestFriendDAO;
import model.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entities.User;
import org.bson.types.ObjectId;

/**
 *
 * @author Hoang Hiep
 */
public class ShowFriend extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            ArrayList<User> users = UserDAO.showAllUser();
            /* TODO output your page here. You may use following sample code. */

            out.print("<div style=\"background-color: white\"><div class=\"panel-heading\" style=\"background-color: #44474c\">"
                    + "<h4 style=\"color: white\"><b>Your friends</b>:</h4></div>");
            int count = 0;
            for (User user : users) {
                ObjectId fromUserID = (ObjectId) (session.getAttribute("sessionmemberid"));
                ObjectId toUserID = user.getId();
                if (FriendDAO.checkIsFriend(fromUserID, toUserID) || FriendDAO.checkIsFriend(toUserID, fromUserID)) {
                    count++;
                    out.print("<p style=\"margin-left: 10px\"><a href='UserInfo?userid="+user.getId()+"'>" + user.getUserName() + "</a> &emsp; <a href='RemoveFriendController?toUserID=" + user.getId() + "'>Remove Friend</a> </p>");
                }
            }
            out.print("<p style=\"margin-left: 10px\"><b>You have: " + count + " friends.</b></p></div>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
