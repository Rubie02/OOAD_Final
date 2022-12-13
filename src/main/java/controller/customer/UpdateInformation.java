package controller.customer;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Account;
import entity.Customer;
import entity.Product;
import service.AccountServiceImpl;
import service.CustomerServiceImpl;
import service.IAccountService;
import service.ICustomerService;
@SuppressWarnings("serial")
@WebServlet(name = "UpdateInformation", urlPatterns = {"/update_cus"})
public class UpdateInformation extends HttpServlet{
	ICustomerService cusS = new CustomerServiceImpl();
	IAccountService accS = new AccountServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		Customer customer = cusS.getUsername(username);
		Account acc = accS.getAccByUsername(username);
		req.setAttribute("cus", customer);
		req.setAttribute("acc", acc);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/customers/edit-cus-info.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	public static boolean
    isValidPassword(String password)
    {
        String regex = "^(?=.*[0-9])"
                       + "(?=.*[a-z])(?=.*[A-Z])"
                       + "(?=.*[@#$%^&+=])"
                       + "(?=\\S+$).{8,20}$";
  
        Pattern p = Pattern.compile(regex);

        if (password == null) {
            return false;
        }

        Matcher m = p.matcher(password);

        return m.matches();
    }
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String cusName = req.getParameter("cusName");
		String cusAddress = req.getParameter("cusAddress");
		String cusPhoneNumber = req.getParameter("cusPhoneNumber");
		Account acc = (Account) req.getSession().getAttribute("acc");
		
		
			
		cusS.editCustomer(cusName, cusAddress, cusPhoneNumber, acc.getUsername());
		accS.editAccount(acc.getUsername(), password, 0, email);
		req.setAttribute("status", "success");
		resp.sendRedirect(req.getContextPath()+"/cus_info");
		
	
	
}}
