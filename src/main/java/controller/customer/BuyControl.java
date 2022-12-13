package controller.customer;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Account;
import entity.Customer;
import entity.Employee;
import entity.Order;
import service.CartServiceImpl;
import service.CustomerServiceImpl;
import service.ICartService;
import service.ICustomerService;
@SuppressWarnings("serial")
@WebServlet(name = "BuyControl", urlPatterns = {"/buy"})
public class BuyControl extends HttpServlet{
	ICustomerService cusS = new CustomerServiceImpl();
	ICartService cartS = new CartServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		Account acc = (Account) req.getSession().getAttribute("acc");
		if (acc != null) {
			Employee em = new Employee(1, "Nam", "HCM", "0234326564", 1000000, "2022-12-1");
			Customer cus = cusS.getUsername(acc.getUsername());
			LocalDateTime localDate = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-LLLL-yyyy");
			String date = localDate.format(formatter);
			Order order = new Order();
			order.setCusId(cus);
			order.setOrderDate(date);
			order.setEmployeeId(em);
			int o = cartS.insert(order);
			HttpSession session = req.getSession();
			session.setAttribute("order", o);
			req.setAttribute("cus", cus);
			req.getRequestDispatcher("/views/customers/customers-order.jsp").forward(req, resp);
				
				
		}
		else {
			resp.sendRedirect(req.getContextPath()+"/Home");
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");
//		Account acc = (Account) req.getSession().getAttribute("acc");
//		Employee em = new Employee(1, "Nam", "HCM", "0234326564", 1000000, "2022-12-1");
//		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
//		Customer cus = cusS.getUsername(acc.getUsername());
//		Date date = new Date(2022-12-12);
//		Order order = new Order();
//
//		order.setCusId(cus);
//		order.setOrderDate(fmt.format(date));
//		order.setEmployeeId(em);
//		cartS.insert(order);
//		req.getRequestDispatcher("/views/customer/customer-order.jsp").forward(req, resp);
	}

}
