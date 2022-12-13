package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ReviewBlogServicesImpl;

import service.ReviewBlogService;

@SuppressWarnings("serial")
@WebServlet(name = "ReviewBlogDeleteControl", urlPatterns = {"/delete_reviewblog"})
public class DeleteReviewBlogControl extends HttpServlet {
	ReviewBlogService reviewService =  new ReviewBlogServicesImpl();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        reviewService.delete(Integer.parseInt(id));
        response.sendRedirect("reviewblog_list");
    	request.setAttribute("mess", "Delete Successful");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

