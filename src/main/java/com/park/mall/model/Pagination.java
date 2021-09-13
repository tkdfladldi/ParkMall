package com.park.mall.model;

public class Pagination {
	private int listSize = 10;  //한 페이지 목록 개수 초기값으로 목록개수를 10으로 셋팅
	
	private int rangeSize = 10; //한 페이지 범위의 개수 초기값으로 페이지범위를 10으로 셋팅
	
	private int page; //현재페이지

	private int range; //현재 페이지 범위

	private int listCnt; //총 게시물의 개수

	private int pageCnt; // 총 페이지 범위의 개수

	private int startPage; //시작번호

	private int startList;	//디비 리스트조회 인덱스  

	private int endPage; // 끝번호

	private boolean prev; // 이전 페이지

	private boolean next; // 다음페이지

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	@Override
	public String toString() {
		return "Pagination [listSize=" + listSize + ", rangeSize=" + rangeSize + ", page=" + page + ", range=" + range
				+ ", listCnt=" + listCnt + ", pageCnt=" + pageCnt + ", startPage=" + startPage + ", startList="
				+ startList + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}
	
	public void pageInfo(int page,int range ,int ListCnt) {
		this.page = page;

		this.range = range;
		
		this.pageCnt = (int) Math.ceil((double)ListCnt/listSize);
		
		this.endPage = range * rangeSize;
		
		this.startPage = (range - 1) * rangeSize + 1 ;
		
		this.startList = (page - 1) * listSize;
		
		this.prev = range == 1 ? false : true;
		
		this.next = (endPage >= pageCnt) ? false : true;
		if (this.endPage > this.pageCnt) {

			this.endPage = this.pageCnt;

			this.next = false;

		}
	}
	
	
	
}

