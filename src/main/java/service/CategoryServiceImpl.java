package service;

import java.util.List;

import dao.CategoryDaoImpl;
import dao.ICategoryDao;
import entity.Category;

public class CategoryServiceImpl implements ICategoryService{
	ICategoryDao categoryDao = new CategoryDaoImpl();
	@Override
	public List<Category> getAllCategory() {
		return categoryDao.getAllCategory();
	}

}
