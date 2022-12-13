package service;

import java.util.List;

import dao.CartItemDaoImpl;
import dao.ICartItemDao;
import entity.OrderDetail;

public class CartItemServiceImpl implements ICartItemService{
	ICartItemDao cartItemDao = new CartItemDaoImpl();
	@Override
	public void insert(OrderDetail cart) {
		cartItemDao.insert(cart);
		
	}

	@Override
	public void edit(OrderDetail cart) {
		OrderDetail oldOd = cartItemDao.get(cart.getOdId());
		oldOd.setOrder(cart.getOrder());
		oldOd.setProduct(cart.getProduct());
		oldOd.setUnitPrice(cart.getUnitPrice());
		oldOd.setQuantity(cart.getQuantity());
		cartItemDao.edit(oldOd);
		
	}

	@Override
	public void delete(int id) {
		cartItemDao.delete(id);
		
	}

	@Override
	public OrderDetail get(int id) {
		// TODO Auto-generated method stub
		return cartItemDao.get(id);
	}

	@Override
	public List<OrderDetail> getAll() {
		// TODO Auto-generated method stub
		return cartItemDao.getAll();
	}

	@Override
	public List<OrderDetail> getByCusId(int id) {
		// TODO Auto-generated method stub
		return cartItemDao.getByCusId(id);
	}

}
