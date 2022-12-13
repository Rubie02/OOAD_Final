/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Account;
import service.AccountServiceImpl;
import service.IAccountService;
import service.ISignupService;
import service.SignupServiceImpl;

@SuppressWarnings("serial")
@WebServlet(name = "SignupCusControl", urlPatterns = {"/Signup"})
public class SignupCusControl extends HttpServlet {
	ISignupService signupService = new SignupServiceImpl();
	IAccountService accountService = new AccountServiceImpl();
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
    	//response.setContentType("text/html;charset=UTF-8");
//        String user = request.getParameter("user");
//        String email = request.getParameter("email");
//        String pass = request.getParameter("pass");
//        String re_pass = request.getParameter("repass");
//
//        if(!pass.equals(re_pass))
//        {
//        	request.setAttribute("notification", "Password do not match!");
//        	request.getRequestDispatcher("/views/customer/signup.jsp").forward(request, response);
//        }
//        else
//        {
//        	Account a = signupService.checkAccountExist(user);
//        	if(a==null)
//        	{
//        		HttpSession session = request.getSession();
//            	session.setAttribute("acc", a);
//	        	signupService.signupforCustomer(user, pass, email);
//	        	request.getRequestDispatcher("/views/customer/home.jsp").forward(request, response);
//        	}
//        	else
//        	{
//        		response.sendRedirect("/views/customer/home.jsp");
//        	}
//        }
    //}
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/customers/signup.jsp").forward(request, response);
    	
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	RequestDispatcher dispatcher = null;
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
        
		Account existEmail = accountService.getAccByEmail(email);
		Account existUser = accountService.getAccByUsername(user);
        if(!pass.equals(re_pass)) {
        	request.setAttribute("status", "passwordNotMatch");
        	dispatcher = request.getRequestDispatcher("/views/customers/signup.jsp");
        	dispatcher.forward(request, response);
        }
        else if(!isValidPassword(pass)){
        	request.setAttribute("status", "invalidPassword");
        	dispatcher = request.getRequestDispatcher("/views/customers/signup.jsp");
        	dispatcher.forward(request, response);
        }
        else if(existUser != null) {
			request.setAttribute("status", "existUsername");
			dispatcher = request.getRequestDispatcher("/views/customers/signup.jsp");
			dispatcher.forward(request, response);
		}
        else if(existEmail != null) {
        	request.setAttribute("status", "existEmail");
        	dispatcher = request.getRequestDispatcher("/views/customers/signup.jsp");
        	dispatcher.forward(request, response);
        }
        else
        {
        	Account a = signupService.checkAccountExist(user);
        	if(a==null)
        	{
        		HttpSession session = request.getSession();
            	session.setAttribute("acc", a);
	        	signupService.signupforCustomer(user, pass, email);
	        	request.setAttribute("status", "success");
	        	request.getRequestDispatcher("/views/customers/signup.jsp").forward(request, response);
        	}
        	else
        	{
        		response.sendRedirect("/views/customers/home.jsp");
        	}
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
