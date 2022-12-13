package controller.customer;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.OrderDetail;

@SuppressWarnings("serial")
@WebServlet(name = "RemoveCartControl", urlPatterns = {"/remove_from_cart"})
public class RemoveCartControl extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		HttpSession httpSession = req.getSession();
		Object obj =  httpSession.getAttribute("cart");
		String productId = req.getParameter("productId");
		if(obj!=null) {
			Map<Integer, OrderDetail> map = extracted(obj);
			map.remove(Integer.parseInt(productId));
			httpSession.setAttribute("cart", map);
		}
		resp.sendRedirect(req.getContextPath()+"/Cart");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	@SuppressWarnings("unchecked")
	private Map<Integer, OrderDetail> extracted(Object obj){
		return (Map<Integer, OrderDetail>) obj;
	}
}
