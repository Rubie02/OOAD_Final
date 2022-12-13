package controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(name = "OrderToOrdered", urlPatterns = {"/otod"})
public class OrderToOrdered extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8"); 
		req.setCharacterEncoding("UTF-8");
		
		req.getRequestDispatcher("/views/customers/order-to-ordered.jsp").forward(req, resp);
	}
	
}
