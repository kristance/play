package com.krist.play.vo;

public class SearchParame {
	
	private String keyword;
	private PlayReplyList list;
	
	public SearchParame() {
	}

	public SearchParame(String keyword, PlayReplyList list) {
		super();
		this.keyword = keyword;
		this.list = list;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public PlayReplyList getList() {
		return list;
	}

	public void setList(PlayReplyList list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "SearchParame [keyword=" + keyword + ", list=" + list + "]";
	}

	
	
}