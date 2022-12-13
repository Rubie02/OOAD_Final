package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entity.Product;
import service.IProductService;
import service.ProductServiceImpl;

@SuppressWarnings("serial")
@WebServlet(name = "UpdateProductControl", urlPatterns = {"/update_product"})
public class UpdateProductControl extends HttpServlet{
	IProductService proS = new ProductServiceImpl();
//	protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//		resp.setContentType("text/html");
//		resp.setCharacterEncoding("UTF-8"); 
//		req.setCharacterEncoding("UTF-8");
//        
//		String productId = req.getParameter("productId");
//        String productName= req.getParameter("productName");
//        int supId = Integer.parseInt(req.getParameter("supId"));
//        int cateId = Integer.parseInt(req.getParameter("cateId"));
//        String information = req.getParameter("information");
//        float price = Float.parseFloat(req.getParameter("price"));
//        String mgf = req.getParameter("mgf");
//        String exp = req.getParameter("exp");
//        String productImage = req.getParameter("productImage");
//        
//        proS.updateProduct(productId, productName, supId, cateId, information, price, mgf, exp, productImage);
//        resp.sendRedirect("manager_product");
//    }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productId = req.getParameter("pid");
		Product product = proS.getProductByID(productId);
		req.setAttribute("product", product);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/edit-product.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
	      request.setCharacterEncoding("UTF-8");
	      String productId = request.getParameter("pid");
	      String productName = request.getParameter("productName");
	      int supId = Integer.parseInt(request.getParameter("supId"));
	      int cateId = Integer.parseInt(request.getParameter("cateId"));
	      String information = request.getParameter("information");
	      float price = Float.parseFloat(request.getParameter("price"));
	      String mgf = request.getParameter("mgf");
	      String exp = request.getParameter("exp");
	      String productImage = request.getParameter("productImage");
	      
	      if(cateId > 4) {
	      	request.setAttribute("status", "invalidCateId");
	      	dispatcher = request.getRequestDispatcher("views/admin/edit-product.jsp");
	  		dispatcher.forward(request, response);
	      }
	      else if (price == 0 || mgf == null || exp == null) {
	      	request.setAttribute("status", "invalidInput");
	      	dispatcher = request.getRequestDispatcher("views/admin/edit-product.jsp");
	  		dispatcher.forward(request, response);
	      }
	      else {

	      	proS.updateProduct(productId,productName, supId, cateId, information, price, mgf, exp,productImage);
	      	request.setAttribute("status", "success");
	      	dispatcher = request.getRequestDispatcher("views/admin/edit-product.jsp");
	      	dispatcher.forward(request, response);
	      }
	    }
	}

