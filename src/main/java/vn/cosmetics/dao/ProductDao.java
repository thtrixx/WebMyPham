package vn.cosmetics.dao;

import java.util.List;

import vn.cosmetics.model.Product;

public interface ProductDao {
	void insert(Product product);

	void edit(Product product);

	void delete(String id);

	Product get(int id);
	
	Product get(String name);

	List<Product> getAll();
	
	List<Product> getProductById(int id);

	List<Product> searchByName(String productName);
	List<Product> getProductSelling();
	List<Product> getProductDiscount();
	List<Product> getProductNew();
	

}
