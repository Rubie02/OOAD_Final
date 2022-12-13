
package controller.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "LoginCusControl", urlPatterns = {"/Login"})
public class LoginCusControl extends HttpServlet {
	ILoginService loginService = new LoginServiceImpl();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        Account a = loginService.login(username, password);
        RequestDispatcher dispatcher = null;
        if(a==null)
        {
        	request.setAttribute("status", "invalidPassorUsername");
        	dispatcher = request.getRequestDispatcher("/views/customers/login.jsp");
        	dispatcher.forward(request, response);
        }
        else if(a.getType() == 1) {
        	HttpSession session = request.getSession();
         	session.setAttribute("acc", a);
         	request.getRequestDispatcher("views/admin/home.jsp").forward(request, response);
        }
        else 
        {

        	HttpSession session = request.getSession();
        	session.setAttribute("acc", a);
        	request.getRequestDispatcher("/views/customers/home.jsp").forward(request, response);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.getRequestDispatcher("/views/customers/login.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
      String username = request.getParameter("user");
      String password = request.getParameter("pass");
      Account a = loginService.login(username, password);
      RequestDispatcher dispatcher = null;
      if(a==null)
      {
      	request.setAttribute("status", "invalidPassorUsername");
      	dispatcher = request.getRequestDispatcher("/views/customers/login.jsp");
      	dispatcher.forward(request, response);
      }
      else if(a.getType() == 1) {
      	HttpSession session = request.getSession();
       	session.setAttribute("acc", a);
       	request.getRequestDispatcher("views/admin/home.jsp").forward(request, response);
      }
      else 
      {
      	HttpSession session = request.getSession();
      	session.setAttribute("acc", a);
      	request.getRequestDispatcher("/views/customers/home.jsp").forward(request, response);
      }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
