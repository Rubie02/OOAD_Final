
package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Account;
import service.ILoginService;
import service.LoginServiceImpl;


@SuppressWarnings("serial")
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {
	ILoginService loginService = new LoginServiceImpl();
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String username = request.getParameter("user");
//        String password = request.getParameter("pass");
//        Account a = loginService.login(username, password);
//        if(a==null)
//        {
//        	request.setAttribute("mess", "Wrong user or password! Please check it again!");
//        	request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
//        	
//        }
//        else 
//        {
//
//        	HttpSession session = request.getSession();
//        	session.setAttribute("acc", a);
//        	request.getRequestDispatcher("home").forward(request, response);
//        }
//        
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		response.setContentType("text/html");
    		response.setCharacterEncoding("UTF-8"); 
    		request.setCharacterEncoding("UTF-8");
    	 String username = request.getParameter("user");
         String password = request.getParameter("pass");
         Account a = loginService.login(username, password);
         if(a==null)
         {
         	request.setAttribute("mess", "Wrong user or password! Please check it again!");
         	request.getRequestDispatcher("/views/admin/login.jsp").forward(request, response);
         	
         }
         else 
         {

         	HttpSession session = request.getSession();
         	session.setAttribute("acc", a);
         	request.getRequestDispatcher("views/admin/home.jsp").forward(request, response);
         }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
