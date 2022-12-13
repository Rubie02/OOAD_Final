package service;

import java.util.List;

import entity.Product;

public interface IProductService {
	public List<Product> getAllProduct();
	public List<Product> getProductByCID(String cid);
	public Product getProductByID(String id);
	public List<Product> searchByName(String txtSearch);
	public void deleteProduct(String pid);
	public void insertProduct(String name, int supId, int cateId, String information, float price, String mgf, String exp, String productImage);
//	public List<Product> getLast();
	public void updateProduct(String pid, String name, int supId, int cateId, String information, float price, String mgf, String exp, String productImage);
}
