package com.aptech.Model;

public class ProductFilter {
	private String filterItemName;
	private String filterItemType;
	private int filterItemId;
	
	public ProductFilter() {
	}
	
	public ProductFilter(String filterItemName, String filterItemType, int filterItemId) {
		super();
		this.filterItemType = filterItemType;
		this.filterItemName = filterItemName;
		this.filterItemId = filterItemId;
	}
	
	public String getFilterItemName() {
		return filterItemName;
	}
	public void setFilterItemName(String filterItemName) {
		this.filterItemName = filterItemName;
	}
	public int getFilterItemId() {
		return filterItemId;
	}
	public void setFilterItemId(int filterItemId) {
		this.filterItemId = filterItemId;
	}

	public String getFilterItemType() {
		return filterItemType;
	}

	public void setFilterItemType(String filterItemType) {
		this.filterItemType = filterItemType;
	}
	
	

}
