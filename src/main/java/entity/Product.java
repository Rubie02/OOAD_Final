package entity;

import java.util.Date;

public class Product {
	private int productId;
	private String productName;
	private int supId;
	private int cateId;
	private String information;
	private float price;
	private Date mgf;
	private Date exp;
	private String productImage;
	public Product() {
		super();
	}
	public Product(int productId, String productName, int supId, int cateId, String information, float price, Date mgf,
			Date exp, String productImage) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.supId = supId;
		this.cateId = cateId;
		this.information = information;
		this.price = price;
		this.mgf = mgf;
		this.exp = exp;
		this.productImage = productImage;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getSupId() {
		return supId;
	}
	public void setSupId(int supId) {
		this.supId = supId;
	}
	public int getCateId() {
		return cateId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Date getMgf() {
		return mgf;
	}
	public void setMgf(Date mgf) {
		this.mgf = mgf;
	}
	public Date getExp() {
		return exp;
	}
	public void setExp(Date exp) {
		this.exp = exp;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	
}
