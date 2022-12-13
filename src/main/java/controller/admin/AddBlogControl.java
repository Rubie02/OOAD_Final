
package controller.admin;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.BlogServiceImpl;
import service.IBlogService;

@SuppressWarnings("serial")
@WebServlet(name = "AddBlogControl", urlPatterns = {"/add_blog"})
public class AddBlogControl extends HttpServlet {
	IBlogService blogService = new BlogServiceImpl();
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("UTF-8");
//        String details = request.getParameter("details");
//        String name = request.getParameter("name");
//        String image = request.getParameter("image");
//        
//        blogService.insertBlog(details, name, image);
//        response.sendRedirect("manage_blog");
//    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/add-blog.jsp");
		dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");
	    String details = request.getParameter("details");
	    String name = request.getParameter("name");
	    String image = request.getParameter("image");
	    RequestDispatcher dispatcher = null;
	      
	    blogService.insertBlog(details, name, image);
	    request.setAttribute("status", "success");
		dispatcher = request.getRequestDispatcher("views/admin/add-blog.jsp");
		dispatcher.forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
