package com.kh.dailyhouse.domain;

import java.sql.Timestamp;
import java.util.List;

public class SearchVo {
	
	//욕실, 침대
	private int room_bathroom = 1;
	private int room_bed = 1;
	
	//방옵션
	private List<String> listOption = null;
	private String arrOption;

	//방타입
	private String joinType = "R1|R2|R3";
	private String joinTypeName;
	
	//인원
	private int room_people = 1;
	
	//가격
	private int low_price;
	private int high_price;

	//날짜
	private String str_start_date = null;
	private String str_end_date = null;
	
	private Timestamp room_reserv_start_date = null;
	private Timestamp room_reserv_end_date = null;
	
	//페이징
	public static final int PAGE_BLOCK = 10;

	private int page = 1;
	private int startRow = 1;
	private int endRow = 12;
	private int startPage = 1;
	private int endPage = 10;
	private int totalCount;
	private boolean hasPrev = true;
	private boolean hasNext = true;
	private int perPage = 12;
	private int totalPage;
	private String searchType = "";
	private String keyword = "";
	

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;

		startRow = page * perPage - (perPage - 1); 
		endRow = page * perPage;

		startPage = ((page - 1) / PAGE_BLOCK) * PAGE_BLOCK + 1; 
		endPage = startPage + (PAGE_BLOCK - 1);
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
		totalPage = (int) Math.ceil((double) totalCount / perPage); 

		// 페이지 블럭(51~60), 전체 페이수는 51
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
		setPage(page);
	}

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

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public static int getPageBlock() {
		return PAGE_BLOCK;
	}
	

	public Timestamp getRoom_reserv_start_date() {
		return room_reserv_start_date;
	}

	public void setRoom_reserv_start_date(Timestamp room_reserv_start_date) {
		this.room_reserv_start_date = room_reserv_start_date;
	}

	public Timestamp getRoom_reserv_end_date() {
		return room_reserv_end_date;
	}

	public void setRoom_reserv_end_date(Timestamp room_reserv_end_date) {
		this.room_reserv_end_date = room_reserv_end_date;
	}

	public String getStr_start_date() {
		return str_start_date;
	}

	public void setStr_start_date(String str_start_date) {
		this.str_start_date = str_start_date;
	}

	public String getStr_end_date() {
		return str_end_date;
	}

	public void setStr_end_date(String str_end_date) {
		this.str_end_date = str_end_date;
	}

	public int getRoom_people() {
		return room_people;
	}

	public void setRoom_people(int room_people) {
		this.room_people = room_people;
	}

	public int getLow_price() {
		return low_price;
	}

	public void setLow_price(int low_price) {
		this.low_price = low_price;
	}

	public int getHigh_price() {
		return high_price;
	}

	public void setHigh_price(int high_price) {
		this.high_price = high_price;
	}

	public String getJoinType() {
		return joinType;
	}

	public void setJoinType(String joinType) {
		this.joinType = joinType;
	}

	public int getRoom_bathroom() {
		return room_bathroom;
	}

	public void setRoom_bathroom(int room_bathroom) {
		this.room_bathroom = room_bathroom;
	}

	public int getRoom_bed() {
		return room_bed;
	}

	public void setRoom_bed(int room_bed) {
		this.room_bed = room_bed;
	}

	public List<String> getListOption() {
		return listOption;
	}

	public void setListOption(List<String> listOption) {
		this.listOption = listOption;
	}

	public String getArrOption() {
		return arrOption;
	}

	public void setArrOption(String arrOption) {
		this.arrOption = arrOption;
	}

	public String getJoinTypeName() {
		return joinTypeName;
	}

	public void setJoinTypeName(String joinTypeName) {
		this.joinTypeName = joinTypeName;
	}

	@Override
	public String toString() {
		return "SearchVo [room_bathroom=" + room_bathroom + ", room_bed=" + room_bed + ", listOption=" + listOption
				+ ", arrOption=" + arrOption + ", joinType=" + joinType + ", joinTypeName=" + joinTypeName
				+ ", room_people=" + room_people + ", low_price=" + low_price + ", high_price=" + high_price
				+ ", str_start_date=" + str_start_date + ", str_end_date=" + str_end_date + ", room_reserv_start_date="
				+ room_reserv_start_date + ", room_reserv_end_date=" + room_reserv_end_date + ", page=" + page
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalCount=" + totalCount + ", hasPrev=" + hasPrev + ", hasNext=" + hasNext + ", perPage="
				+ perPage + ", totalPage=" + totalPage + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
