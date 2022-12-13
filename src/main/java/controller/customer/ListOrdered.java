package controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Account;
import entity.Customer;
import entity.OrderDetail;
import service.CartItemServiceImpl;
import service.CustomerServiceImpl;
import service.ICartItemService;
import service.ICustomerService;

@SuppressWarnings("serial")
@WebServlet(name = "ListOrdered", urlPatterns = {"/ordered_list_after"})
public class ListOrdered extends HttpServlet{
	ICartItemService cartIS = new CartItemServiceImpl();
	ICustomerService cusS = new CustomerServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		Account acc = (Account) req.getSession().getAttribute("acc");
		if (acc != null) {
			Customer cus = cusS.getUsername(acc.getUsername());
			List<OrderDetail> list_orders = cartIS.getByCusId(cus.getCusId());
			req.setAttribute("list_orders", list_orders);
			req.getRequestDispatcher("/views/customers/orders.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath()+"/Home");
		}
	}

}
