
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
@WebServlet(name = "SearchBlogControl", urlPatterns = {"/Search_blog"})
public class SearchBlogControl extends HttpServlet {
	IBlogService blogService = new BlogServiceImpl();
	ICategoryService categoryService = new CategoryServiceImpl();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        List<Blog> list = blogService.searchByName(txtSearch);
//        List<Category> listC = categoryService.getAllCategory();
//        Product last = productService.getLast();
        
//        request.setAttribute("listC", listC);
//        request.setAttribute("p", last);
        request.setAttribute("listB", list);
        request.setAttribute("txtS", txtSearch);
        request.getRequestDispatcher("/views/customers/blog.jsp").forward(request, response);
        
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
