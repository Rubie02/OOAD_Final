package controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.OrderDetail;
import entity.Product;
import service.IProductService;
import service.ProductServiceImpl;

@SuppressWarnings("serial")
@WebServlet(name = "AddToCartControl", urlPatterns = {"/add_to_cart"})
public class AddToCartControl extends HttpServlet{
	IProductService proS = new ProductServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String productId = req.getParameter("productId");
		String quantity = req.getParameter("quantity");
		
		Product product = proS.getProductByID(productId);
		OrderDetail od = new OrderDetail();
		od.setQuantity(Integer.parseInt(quantity));
		od.setUnitPrice(product.getPrice());
		od.setProduct(product);
		HttpSession httpSession = req.getSession();
		Object obj =  httpSession.getAttribute("cart");
		if (obj==null) {
			Map<Integer, OrderDetail> map = new HashMap<Integer, OrderDetail>();
			map.put(od.getProduct().getProductId(), od);
			httpSession.setAttribute("cart", map);
		} else {
			Map<Integer, OrderDetail> map = extracted(obj); 
			OrderDetail existedOd = map.get(Integer.valueOf(productId));
			if (existedOd==null) {
				map.put(product.getProductId(), od);
			} else {
				existedOd.setQuantity(existedOd.getQuantity()+Integer.parseInt(quantity));
			}
			httpSession.setAttribute("cart", map);
			
		}
		resp.sendRedirect(req.getContextPath()+"/Cart");
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	@SuppressWarnings("unchecked")
	private Map<Integer, OrderDetail> extracted(Object obj){
		return (Map<Integer, OrderDetail>) obj;
	}

}
