package com.aptech.Model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the InvoiceDetails database table.
 * 
 */
@Entity
@Table(name="InvoiceDetails")
@NamedQuery(name="InvoiceDetail.findAll", query="SELECT i FROM InvoiceDetail i")
public class InvoiceDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Id")
	private int id;

	@Column(name="Quantity")
	private int quantity;

	@Column(name="Unit")
	private int unit;

	//bi-directional many-to-one association to Invoice
	@ManyToOne
	@JoinColumn(name="InvoiceId")
	private Invoice invoice;

	//bi-directional many-to-one association to ProductDetail
	@ManyToOne
	@JoinColumn(name="ProductDetailsId")
	private ProductDetail productDetail;

	public InvoiceDetail() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getUnit() {
		return this.unit;
	}

	public void setUnit(int unit) {
		this.unit = unit;
	}

	public Invoice getInvoice() {
		return this.invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

	public ProductDetail getProductDetail() {
		return this.productDetail;
	}

	public void setProductDetail(ProductDetail productDetail) {
		this.productDetail = productDetail;
	}

}