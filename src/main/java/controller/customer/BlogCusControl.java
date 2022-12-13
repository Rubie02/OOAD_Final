/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Blog;
import entity.Category;
import entity.Product;
import service.BlogServiceImpl;
import service.CategoryServiceImpl;
import service.IBlogService;
import service.ICategoryService;
import service.IProductService;
import service.ProductServiceImpl;

@SuppressWarnings("serial")
@WebServlet(name = "BlogCusControl", urlPatterns = {"/Blog"})
public class BlogCusControl extends HttpServlet {
	IProductService productService = new ProductServiceImpl();
	ICategoryService categoryService = new CategoryServiceImpl();
	IBlogService blogService = new BlogServiceImpl();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //b1: get data from dao
        List<Product> list = productService.getAllProduct();
        List<Category> listC = categoryService.getAllCategory();
//        List<Product>  last = productService.getLast();
        List<Blog> listB = blogService.getAllBlog();

        
        //b2: set data to jsp
 

        
        //b2: set data to jsp
        request.setAttribute("listB", listB);
        request.setAttribute("listP", list);
        request.setAttribute("listC", listC);
//        request.setAttribute("p", last);
        request.getRequestDispatcher("/views/customers/blog.jsp").forward(request, response);
        //404 -> url
        //500 -> jsp properties
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
    }

}
