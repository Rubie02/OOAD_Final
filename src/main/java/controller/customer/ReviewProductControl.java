/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "ReviewProductControl", urlPatterns = {"/Review"})
public class ReviewProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReviewService reviewService = new ReviewServicesImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product-detail?pid=" +req.getParameter("pid"));
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		String id = req.getParameter("pid");
		System.out.println("thử: " + id);
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String content = req.getParameter("content");
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);  
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String today = df.format(date);
		Review review = new Review();
		review.setName(name);
		review.setEmail(email);
		review.setProduct_id(id);
		review.setContent(content);
		review.setCreated(today);
		System.out.println("thử tostring: " + review);
		reviewService.insert(review);
		resp.sendRedirect("product_detail?pid=" + id);
	}
}

