
package controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import service.IProductService;
import service.ProductServiceImpl;

@SuppressWarnings("serial")
@WebServlet(name = "AddProductControl", urlPatterns = {"/add_product"})
public class AddProductControl extends HttpServlet {
	IProductService productService = new ProductServiceImpl();
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        RequestDispatcher dispatcher = null;
//        request.setCharacterEncoding("UTF-8");
//        String productName = request.getParameter("productName");
//        int supId = Integer.parseInt(request.getParameter("supId"));
//        int cateId = Integer.parseInt(request.getParameter("cateId"));
//        String information = request.getParameter("information");
//        float price = Float.parseFloat(request.getParameter("price"));
//        String mgf = request.getParameter("mgf");
//        String exp = request.getParameter("exp");
//        String productImage = request.getParameter("productImage");
//        
//        if(cateId > 4) {
//        	request.setAttribute("status", "invalidCateId");
//        	dispatcher = request.getRequestDispatcher("views/admin/add-product.jsp");
//    		dispatcher.forward(request, response);
//        }
//        else if (price == 0 || mgf == null || exp == null) {
//        	request.setAttribute("status", "invalidInput");
//        	dispatcher = request.getRequestDispatcher("views/admin/add-product.jsp");
//    		dispatcher.forward(request, response);
//        }
//        else {
//        	
//        	productService.insertProduct(productName, supId, cateId, information, price, mgf, exp, productImage);
//        	request.setAttribute("status", "success");
//        	dispatcher = request.getRequestDispatcher("views/admin/add-product.jsp");
//        	dispatcher.forward(request, response);
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/add-product.jsp");
		dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
      RequestDispatcher dispatcher = null;
      request.setCharacterEncoding("UTF-8");
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
      	dispatcher = request.getRequestDispatcher("views/admin/add-product.jsp");
  		dispatcher.forward(request, response);
      }
      else if (price == 0 || mgf == null || exp == null) {
      	request.setAttribute("status", "invalidInput");
      	dispatcher = request.getRequestDispatcher("views/admin/add-product.jsp");
  		dispatcher.forward(request, response);
      }
      else {
      	
      	productService.insertProduct(productName, supId, cateId, information, price, mgf, exp, productImage);
      	request.setAttribute("status", "success");
      	dispatcher = request.getRequestDispatcher("views/admin/add-product.jsp");
      	dispatcher.forward(request, response);
      }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
