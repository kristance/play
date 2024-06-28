package com.krist.play.vo;

import java.util.ArrayList;

public class PlayReplyList {

	private int currentPage = 1;
	private int totalCount;
	private int pageSize;
	private int startNo;
	private int totalPage;
	private int startPage;
	private int endPage;
	private ArrayList<PlayReplyVO> list = new ArrayList<PlayReplyVO>();
	
	
	public PlayReplyList() {
	}
	
	public void setInit(int currentPage, int totalCount, int pageSize) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		calculator();
	}
	
	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage - 1) * pageSize;
		startNo = startNo < 0 ? 0 : startNo;
		startPage = (currentPage - 1) / 7 * 7 + 1;
		endPage = startPage + (pageSize - 1);
		endPage = endPage > totalPage ? totalPage : endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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

	public ArrayList<PlayReplyVO> getList() {
		return list;
	}

	public void setList(ArrayList<PlayReplyVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "PlayReplyList [currentPage=" + currentPage + ", totalCount=" + totalCount + ", pageSize=" + pageSize
				+ ", startNo=" + startNo + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", list=" + list + "]";
	}
	
	
	
	
}
