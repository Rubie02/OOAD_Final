
package controller.customer;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Category;
import entity.Product;
import entity.Review;
import service.CategoryServiceImpl;
import service.ICategoryService;
import service.IProductService;
import service.ProductServiceImpl;
import service.ReviewService;
import service.ReviewServicesImpl;


@SuppressWarnings("serial")
@WebServlet(name = "ProductDetailCusControl", urlPatterns = {"/product_detail"})
public class ProductDetailCusControl extends HttpServlet {
	IProductService productService = new ProductServiceImpl();
	ICategoryService categoryService = new CategoryServiceImpl();
	ReviewService reviewService = new ReviewServicesImpl();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("pid");
        Product p = productService.getProductByID(id);
        List<Category> listC = categoryService.getAllCategory();
//        List<Product>  last = productService.getLast();
        List<Product> listP = productService.getAllProduct();
        List<Review> reviewById = reviewService.getReviewById(Integer.parseInt(id));
		request.setAttribute("reviewbyid", reviewById);
        
        request.setAttribute("detail", p);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
//        request.setAttribute("p", last);
        request.getRequestDispatcher("/views/customers/product-detail.jsp").forward(request, response);
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
