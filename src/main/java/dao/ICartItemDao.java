package dao;

import java.util.List;

import entity.OrderDetail;

public interface ICartItemDao {
	void insert(OrderDetail cart);
	void edit(OrderDetail cart);
	void delete(int id);
	OrderDetail get(int id);
	List<OrderDetail> getAll();
	List<OrderDetail> getByCusId(int id);
}
