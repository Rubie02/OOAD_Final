/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Category;
import entity.Product;
import service.CategoryServiceImpl;
import service.ICategoryService;
import service.IProductService;
import service.ProductServiceImpl;

@SuppressWarnings("serial")
@WebServlet(name = "ManageProductControl", urlPatterns = {"/manage_product"})
public class ManageProductControl extends HttpServlet {
	IProductService productService = new ProductServiceImpl();
	ICategoryService categoryService = new CategoryServiceImpl();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List<Product> list = productService.getAllProduct();
        List<Category> listC = categoryService.getAllCategory();
        
        request.setAttribute("listC", listC);
        request.setAttribute("listP", list);
        request.getRequestDispatcher("/views/admin/list-product.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
