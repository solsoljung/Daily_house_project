package com.kh.dailyhouse.domain;

public class SearchKeywordDto {

	//검색 결과
	private String location_text = "";
	//입력
	private String search_keyword = "";

	public String getLocation_text() {
		return location_text;
	}

	public void setLocation_text(String location_text) {
		this.location_text = location_text;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	@Override
	public String toString() {
		return "SearchKeywordDto [location_text=" + location_text + ", search_keyword=" + search_keyword + "]";
	}

	
}
