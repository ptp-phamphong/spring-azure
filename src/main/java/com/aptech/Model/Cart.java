package com.aptech.Model;

public class Cart {
	private int productDetailsID;
	private int quantity;
	private int price;
	
	private ProductDetail productDetail;
	
	public Cart() {
		super();
	}

	public Cart(int productDetailsID, int quantity, int price) {
		super();
		this.productDetailsID = productDetailsID;
		this.quantity = quantity;
		this.price = price;
	}
	
	public Cart(int productDetailsID, int quantity, int price, ProductDetail productDetail) {
		super();
		this.productDetailsID = productDetailsID;
		this.quantity = quantity;
		this.price = price;
		this.productDetail = productDetail;
	}
	public int getProductDetailsID() {
		return productDetailsID;
	}
	public void setProductDetailsID(int productDetailsID) {
		this.productDetailsID = productDetailsID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public ProductDetail getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}
	
}
