package com.krist.play.vo;

import java.util.ArrayList;

public class PlayTicketList {

	
	private int idxTList;
	private int currentPage = 1;
	private int totalCount;
	private int pageSize;
	private int startNo;
	private int totalPage;
	private int startPage;
	private int endPage;
	private String email;
	private String phone;
	private int idxM;
	
	private ArrayList<PlayTicketVO> list = new ArrayList<PlayTicketVO>();
	
	public PlayTicketList() {
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
		startPage = (currentPage - 1) / 6 * 6 + 1;
		endPage = startPage + (pageSize - 1);
		endPage = endPage > totalPage ? totalPage : endPage;
	}


	public int getIdxTList() {
		return idxTList;
	}


	public void setIdxTList(int idxTList) {
		this.idxTList = idxTList;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getIdxM() {
		return idxM;
	}


	public void setIdxM(int idxM) {
		this.idxM = idxM;
	}


	public ArrayList<PlayTicketVO> getList() {
		return list;
	}


	public void setList(ArrayList<PlayTicketVO> list) {
		this.list = list;
	}


	@Override
	public String toString() {
		return "PlayTicketList [idxTList=" + idxTList + ", currentPage=" + currentPage + ", totalCount=" + totalCount
				+ ", pageSize=" + pageSize + ", startNo=" + startNo + ", totalPage=" + totalPage + ", startPage="
				+ startPage + ", endPage=" + endPage + ", email=" + email + ", phone=" + phone + ", idxM=" + idxM
				+ ", list=" + list + "]";
	}

	
	
	
	
	
}
