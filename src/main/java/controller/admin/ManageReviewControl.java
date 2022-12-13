package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Review;
import service.ReviewService;
import service.ReviewServicesImpl;
@SuppressWarnings("serial")
@WebServlet(name = "ManageReviewControl", urlPatterns = {"/review_list"})
public class ManageReviewControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ReviewService reviewService = new ReviewServicesImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Review> reviewList = reviewService.getAll();
		req.setAttribute("reviewlist", reviewList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-reviewProduct.jsp");
		dispatcher.forward(req, resp);
	}
}
