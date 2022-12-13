package controller.admin;


import java.io.IOException;
import java.util.List;

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
@WebServlet(name = "ManageAccountControl", urlPatterns = {"/manager_account"})
public class ManageAccountControl extends HttpServlet {
	IAccountService accountService = new AccountServiceImpl();
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String user = request.getParameter("user");
//        System.out.println(user);
//        List<Account> list = accountService.getAllAccount();
//        Account account = accountService.getAccByUsername(user);
//        
//        request.setAttribute("listP", list);
//        request.setAttribute("account", account);
//        request.getRequestDispatcher("/views/admin/list-account.jsp").forward(request, response);
//    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    	List<Account> acc = accountService.getAllAccount();
		request.setAttribute("accList", acc);
		RequestDispatcher dispatcherUser  = request.getRequestDispatcher("/views/admin/list-account.jsp");
		dispatcherUser.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
