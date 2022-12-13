package service;

import java.util.List;

import dao.CartDaoImpl;
import dao.ICartDao;
import entity.Order;

public class CartServiceImpl implements ICartService{
	ICartDao cartD = new CartDaoImpl();
	@Override
	public int insert(Order cart) {
		 return cartD.insert(cart);
		
	}

	@Override
	public void edit(Order cart) {
		Order oldOrder = cartD.get(cart.getOrderId());
		oldOrder.setCusId(cart.getCusId());
		oldOrder.setOrderDate(cart.getOrderDate());
		oldOrder.setEmployeeId(cart.getEmployeeId());
		cartD.edit(oldOrder);
		
	}

	@Override
	public void delete(int id) {
		cartD.delete(id);
		
	}

	@Override
	public Order get(int id) {
		return cartD.get(id);
	}

	@Override
	public List<Order> getAll() {
		return cartD.getAll();
	}
}
