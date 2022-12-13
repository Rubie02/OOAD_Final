package controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Account;
import entity.Customer;
import service.AccountServiceImpl;
import service.CustomerServiceImpl;
import service.IAccountService;
import service.ICustomerService;

@SuppressWarnings("serial")
@WebServlet(name = "CustomerInformation", urlPatterns = {"/cus_info"})
public class CustomerInformation extends HttpServlet{
	ICustomerService cusS = new CustomerServiceImpl();
	IAccountService accS = new AccountServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");

		Account acc = (Account) req.getSession().getAttribute("acc");
		if (acc != null) {
			Customer cus = cusS.getUsername(acc.getUsername());
			System.out.println(cus);
			Account a = accS.getAccByUsername(acc.getUsername());
			System.out.println(a);
			req.setAttribute("customer", cus);
			req.setAttribute("account", a);
			req.getRequestDispatcher("/views/customers/cus-info.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(req.getContextPath()+"/Home");
		}

	}
	
}
