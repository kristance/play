package com.krist.play.vo;

public class Parame {

	
	private int idxM;
	private String playTitle;
	private int currentPage;
	
	
	public Parame() {
	}


	public Parame(int idxM, String playTitle, int currentPage) {
		super();
		this.idxM = idxM;
		this.playTitle = playTitle;
		this.currentPage = currentPage;
	}


	public int getIdxM() {
		return idxM;
	}


	public void setIdxM(int idxM) {
		this.idxM = idxM;
	}


	public String getPlayTitle() {
		return playTitle;
	}


	public void setPlayTitle(String playTitle) {
		this.playTitle = playTitle;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	@Override
	public String toString() {
		return "Parame [idxM=" + idxM + ", playTitle=" + playTitle + ", currentPage=" + currentPage + "]";
	}

	
	
}
