package service;

import java.util.List;

import entity.OrderDetail;

public interface ICartItemService {
	void insert(OrderDetail cart);
	void edit(OrderDetail cart);
	void delete(int id);
	OrderDetail get(int id);
	List<OrderDetail> getAll();
	List<OrderDetail> getByCusId(int id);
}
