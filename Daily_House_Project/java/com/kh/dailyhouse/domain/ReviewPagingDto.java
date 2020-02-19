package com.kh.dailyhouse.domain;

public class ReviewPagingDto {
	
	public static final int REVIEW_PAGE_BLOCK = 5;
	
	private int page = 1;
	private int startRow = 1;
	private int endRow = 5;
	private int startPage = 1;
	private int endPage = 5;
	private int totalCount;
	private boolean hasPrev = true;
	private boolean hasNext = true;
	private int perPage = 5;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		
		startRow = page * perPage - (perPage -1);
		endRow = page * perPage;
		
		startPage = ((page - 1) / REVIEW_PAGE_BLOCK) * REVIEW_PAGE_BLOCK + 1;
		endPage = startPage + (REVIEW_PAGE_BLOCK - 1);
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		int totalPage = (int)Math.ceil((double) totalCount / perPage);
		
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		if (startPage == 1) {
			hasPrev = false;
		}
		if (endPage == totalPage) {
			hasNext = false;
		}
	}
	public boolean isHasPrev() {
		return hasPrev;
	}
	public void setHasPrev(boolean hasPrev) {
		this.hasPrev = hasPrev;
	}
	public boolean isHasNext() {
		return hasNext;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	@Override
	public String toString() {
		return "ReviewPagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", startPage="
				+ startPage + ", endPage=" + endPage + ", totalCount=" + totalCount + ", hasPrev=" + hasPrev
				+ ", hasNext=" + hasNext + ", perPage=" + perPage + "]";
	}
	
	
}
