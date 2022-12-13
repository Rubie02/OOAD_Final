package service;

import java.util.List;

import dao.IProductDao;
import dao.ProductDaoImpl;
import entity.Product;

public class ProductServiceImpl implements IProductService{
	IProductDao productDao = new ProductDaoImpl();
	@Override
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return productDao.getAllProduct();
	}

	@Override
	public List<Product> getProductByCID(String cid) {
		// TODO Auto-generated method stub
		return productDao.getProductByCID(cid);
	}

	@Override
	public Product getProductByID(String id) {
		// TODO Auto-generated method stub
		return productDao.getProductByID(id);
	}

	@Override
	public List<Product> searchByName(String txtSearch) {
		// TODO Auto-generated method stub
		return productDao.searchByName(txtSearch);
	}

	@Override
	public void deleteProduct(String pid) {
		productDao.deleteProduct(pid);
		
	}

	@Override
	public void insertProduct(String name, int supId, int cateId, String information, float price, String mgf,
			String exp, String productImage) {
		productDao.insertProduct(name, supId, cateId, information, price, mgf, exp, productImage);
		
	}

//	@Override
//	public List<Product> getLast() {
//		// TODO Auto-generated method stub
//		return productDao.getLast();
//	}

	@Override
	public void updateProduct(String pid, String name, int supId, int cateId, String information, float price,
			String mgf, String exp, String productImage) {
		productDao.updateProduct(pid, name, supId, cateId, information, price, mgf, exp, productImage);
		
	}

}
