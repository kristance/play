package com.krist.play.vo;

import java.util.ArrayList;

public class PlayInfoList {

	private int currentPage = 1;
	private int totalCount;
	private int pageSize;
	private ArrayList<PlayInfoVO> list = new ArrayList<PlayInfoVO>();
	private int startNo;
	private int totalPage;
	private int startPage;
	private int endPage;
	
	public PlayInfoList() {
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
		startPage = (currentPage - 1) / 5 * 5 + 1;
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

	public ArrayList<PlayInfoVO> getList() {
		return list;
	}

	public void setList(ArrayList<PlayInfoVO> list) {
		this.list = list;
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

	@Override
	public String toString() {
		return "Play_infoList [currentPage=" + currentPage + ", totalCount=" + totalCount + ", pageSize=" + pageSize
				+ ", list=" + list + ", startNo=" + startNo + ", totalPage=" + totalPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + "]";
	}
	
	
	
	
	
}
