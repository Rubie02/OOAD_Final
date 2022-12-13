package controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.OrderDetail;

@SuppressWarnings("serial")
@WebServlet(name = "QuantityControl", urlPatterns = {"/quantity_inc_dec"})
public class QuantityControl extends HttpServlet{

	@SuppressWarnings("rawtypes")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		try (PrintWriter out = resp.getWriter();) {
			String action = req.getParameter("action");
			int id = Integer.parseInt(req.getParameter("id"));

			@SuppressWarnings("unchecked")
			Map<Integer, OrderDetail> map = (Map<Integer, OrderDetail>) req.getSession().getAttribute("cart");
			Set<Map.Entry<Integer, OrderDetail>> set = map.entrySet();
			Iterator<Map.Entry<Integer, OrderDetail>> itr = set.iterator();
			if (action != null && id > 1) {	
				if (action.equals("inc")) {
					while(itr.hasNext()) {
						Map.Entry<Integer, OrderDetail> entry = itr.next();
						if (entry.getValue().getProduct().getProductId() == id) {
							int quantity = entry.getValue().getQuantity();
							quantity++;
							entry.getValue().setQuantity(quantity);
							resp.sendRedirect(req.getContextPath()+"/Cart");
						}
					}
				}
				if (action.equals("dec")) {
					while (itr.hasNext()) {
						Map.Entry<Integer, OrderDetail> entry = itr.next();
						if (entry.getValue().getProduct().getProductId() == id && entry.getValue().getQuantity() > 1) {
							int quantity = entry.getValue().getQuantity();
							quantity--;
							entry.getValue().setQuantity(quantity);
							break;
						}
					}
					resp.sendRedirect(req.getContextPath()+"/Cart");
				}
			} else {
				resp.sendRedirect(req.getContextPath()+"/Cart");
			}
		}
	}
}
