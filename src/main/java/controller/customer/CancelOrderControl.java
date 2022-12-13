package controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CartItemServiceImpl;
import service.ICartItemService;

@SuppressWarnings("serial")
@WebServlet(name = "CancelOrderControl", urlPatterns = {"/cancel_order"})
public class CancelOrderControl extends HttpServlet{
	ICartItemService cartIS = new CartItemServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		String odId = req.getParameter("odId");
		cartIS.delete(Integer.parseInt(odId));
		resp.sendRedirect(req.getContextPath()+"/ordered_list_after");
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");
//		String odId = req.getParameter("odId");
//		cartIS.delete(Integer.parseInt(odId));
//		resp.sendRedirect(req.getContextPath()+"/ordered_list_after");
	}
	
}
