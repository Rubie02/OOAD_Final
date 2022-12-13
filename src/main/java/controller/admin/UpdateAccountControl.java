package controller.admin;

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
import service.AccountServiceImpl;
import service.IAccountService;

@SuppressWarnings("serial")
@WebServlet(name = "UpdateAccountControl", urlPatterns = {"/update_account"})
public class UpdateAccountControl extends HttpServlet{
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
//        accountService.editAccount(user, password, type, email);
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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		processRequest(req, resp);
		String user = req.getParameter("user");
		Account account = accountService.getAccByUsername(user);
		req.setAttribute("acc", account);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/edit-account.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		processRequest(req, resp);
		RequestDispatcher dispatcher = null;
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String username = request.getParameter("user");		
		String password = request.getParameter("pass");
		int type = Integer.parseInt(request.getParameter("type"));
		String email = request.getParameter("email");
		
		Account exist = accountService.getAccByUsername(username);
		
		List<String> allEmailUsername = accountService.getAllEmailUsername();
		allEmailUsername.remove(exist.getEmail());
		allEmailUsername.remove(exist.getUsername());
		
		if(isValidPassword(password) ) {
			request.setAttribute("status", "invalidPassword");
			dispatcher = request.getRequestDispatcher("views/admin/edit-account.jsp");
			dispatcher.forward(request, response);
		}
		else if(allEmailUsername.contains(exist.getUsername())) {
			request.setAttribute("status", "existUsername");
			dispatcher = request.getRequestDispatcher("views/admin/edit-account.jsp");
			dispatcher.forward(request, response);
		}
		else if(allEmailUsername.contains(exist.getEmail())) {
			request.setAttribute("status", "existEmail");
			dispatcher = request.getRequestDispatcher("views/admin/edit-account.jsp");
			dispatcher.forward(request, response);
		}
		else {
			accountService.editAccount(username, password, type, email);
			request.setAttribute("status", "success");
			dispatcher = request.getRequestDispatcher("views/admin/edit-account.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	
}
