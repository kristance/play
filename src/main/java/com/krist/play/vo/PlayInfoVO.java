package com.krist.play.vo;

import java.util.Date;

public class PlayInfoVO {

	private int idxP;
	private String playTitle;
	private Date playStartDate; // 공연 시작일
	private Date playEndDate; //  공연 종료일
	private String playPlace; // 공연장소
	private String playDay;	// 공연일
	private String playTime; //  시간
	private int playFee; // 티켓가격
	private float playStar; // 평점
	private String playPoster; // 포스터 이미지
	private String playDetail; // 상세내용 이미지
	private String expire; // 오늘 날짜가 공연 종료일을 지났을 때
	private int orderCount; // 이 공연을 예약한 사람의 수	
	
	public PlayInfoVO() {
	}

	public PlayInfoVO(int idxP, String playTitle, Date playStartDate, Date playEndDate, String playPlace,
			String playDay, String playTime, int playFee, float playStar, String playPoster, String playDetail,
			String expire, int orderCount) {
		super();
		this.idxP = idxP;
		this.playTitle = playTitle;
		this.playStartDate = playStartDate;
		this.playEndDate = playEndDate;
		this.playPlace = playPlace;
		this.playDay = playDay;
		this.playTime = playTime;
		this.playFee = playFee;
		this.playStar = playStar;
		this.playPoster = playPoster;
		this.playDetail = playDetail;
		this.expire = expire;
		this.orderCount = orderCount;
	}

	public int getIdxP() {
		return idxP;
	}

	public void setIdxP(int idxP) {
		this.idxP = idxP;
	}

	public String getPlayTitle() {
		return playTitle;
	}

	public void setPlayTitle(String playTitle) {
		this.playTitle = playTitle;
	}

	public Date getPlayStartDate() {
		return playStartDate;
	}

	public void setPlayStartDate(Date playStartDate) {
		this.playStartDate = playStartDate;
	}

	public Date getPlayEndDate() {
		return playEndDate;
	}

	public void setPlayEndDate(Date playEndDate) {
		this.playEndDate = playEndDate;
	}

	public String getPlayPlace() {
		return playPlace;
	}

	public void setPlayPlace(String playPlace) {
		this.playPlace = playPlace;
	}

	public String getPlayDay() {
		return playDay;
	}

	public void setPlayDay(String playDay) {
		this.playDay = playDay;
	}

	public String getPlayTime() {
		return playTime;
	}

	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}

	public int getPlayFee() {
		return playFee;
	}

	public void setPlayFee(int playFee) {
		this.playFee = playFee;
	}

	public float getPlayStar() {
		return playStar;
	}

	public void setPlayStar(float playStar) {
		this.playStar = playStar;
	}

	public String getPlayPoster() {
		return playPoster;
	}

	public void setPlayPoster(String playPoster) {
		this.playPoster = playPoster;
	}

	public String getPlayDetail() {
		return playDetail;
	}

	public void setPlayDetail(String playDetail) {
		this.playDetail = playDetail;
	}

	public String getExpire() {
		return expire;
	}

	public void setExpire(String expire) {
		this.expire = expire;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	@Override
	public String toString() {
		return "PlayInfoVO [idxP=" + idxP + ", playTitle=" + playTitle + ", playStartDate=" + playStartDate
				+ ", playEndDate=" + playEndDate + ", playPlace=" + playPlace + ", playDay=" + playDay + ", playTime="
				+ playTime + ", playFee=" + playFee + ", playStar=" + playStar + ", playPoster=" + playPoster
				+ ", playDetail=" + playDetail + ", expire=" + expire + ", orderCount=" + orderCount + "]";
	}

	
	
	
	
}
