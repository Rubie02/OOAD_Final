package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Account;
import service.AccountServiceImpl;
import service.IAccountService;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SuppressWarnings("serial")
@WebServlet(name = "AddAccountControl", urlPatterns = {"/add_account"})
public class AddAccountControl extends HttpServlet {
	IAccountService accountService = new AccountServiceImpl();
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("UTF-8");
//        String user = request.getParameter("user");
//        String password = request.getParameter("pass");
//        int type = Integer.parseInt(request.getParameter("type"));
//        String email = request.getParameter("email");
//        
//        
//        accountService.insertAccount(user, password, type, email);
//        response.sendRedirect("manager_account");
//    }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/add-account.jsp");
		dispatcher.forward(request, response);
    }
    
  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    	
    	RequestDispatcher dispatcher = null;
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		int type = Integer.parseInt(request.getParameter("type"));
		String email = request.getParameter("email");
		System.out.println(username);
		System.out.println(password);
		System.out.println(type);
		System.out.println(email);
		
		Account existUser = accountService.getAccByUsername(username);
		Account existEmail = accountService.getAccByEmail(email);
		System.out.println(existEmail);
		System.out.println(existUser);
		if(!isValidPassword(password)) {
			request.setAttribute("status", "invalidPassword");
			dispatcher = request.getRequestDispatcher("views/admin/add-account.jsp");
			dispatcher.forward(request, response);
		}
		else if(existUser != null) {
			request.setAttribute("status", "existUsername");
			dispatcher = request.getRequestDispatcher("views/admin/add-account.jsp");
			dispatcher.forward(request, response);
		}
		else if(existEmail != null) {
			request.setAttribute("status", "existEmail");
			dispatcher = request.getRequestDispatcher("views/admin/add-account.jsp");
			dispatcher.forward(request, response);
		}
		else {
			accountService.insertAccount(username, password, type, email);
			request.setAttribute("status", "success");
			dispatcher = request.getRequestDispatcher("views/admin/add-account.jsp");
			dispatcher.forward(request, response);
		}
		
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
