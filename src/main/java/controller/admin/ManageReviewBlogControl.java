package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.ReviewBlog;
import service.ReviewBlogService;
import service.ReviewBlogServicesImpl;
@SuppressWarnings("serial")
@WebServlet(name = "ManageReviewBlogControl", urlPatterns = {"/reviewblog_list"})
public class ManageReviewBlogControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ReviewBlogService reviewService = new ReviewBlogServicesImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ReviewBlog> reviewList = reviewService.getAll();
		req.setAttribute("reviewlist", reviewList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-reviewBlog.jsp");
		dispatcher.forward(req, resp);
	}
}
