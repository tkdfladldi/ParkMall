package com.park.mall.model;

public class Search extends Pagination{
	private String searchType;
	private String keyword;	
	private int product_id;
	
	public String getSearchType() {
		return searchType;

	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;

	}

	public String getKeyword() {

		return keyword;

	}


	public void setKeyword(String keyword) {

		this.keyword = keyword;

	}
	

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", keyword=" + keyword + ", product_id=" + product_id + "]";
	}

	

}


