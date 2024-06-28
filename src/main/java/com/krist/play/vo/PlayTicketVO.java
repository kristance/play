package com.krist.play.vo;

import java.util.Date;

public class PlayTicketVO {

	private int idxT;
	private String bookNumber; // 예약번호
	private String id; // 구매자 id
	private String viewer; // 관람자
	private int viewerCount; // 관람인수
	private String phone; // 전화번호
	private String email; // 이메일
	private String addrMain; // 주소1
	private String addrDetail1; // 주소2
	private String addrDetail2; // 주소3
	private String seatNumber; // 좌석번호;a-1-1
	private String viewPlace; // 관람장소
	private String viewDate; // 관람일자
	private String viewTime; // 관람시간
	private Date orderDate; // 티켓주문날짜
	private int playInfoConnect; // playInfo 외래키; title, place, price
	private int memberConnect; // member 외래키; title, place, price
	private int amount; // 결제 금액
	private String playPoster;
	private String playTitle;
	private Date playStartDate;
	private Date playEndDate;
	private String chargeKey;
	private String starTrigger; // 별점 중복 적용 방지를 위해 사용
	
	public PlayTicketVO() {
	}

	public PlayTicketVO(int idxT, String bookNumber, String id, String viewer, int viewerCount, String phone,
			String email, String addrMain, String addrDetail1, String addrDetail2, String seatNumber, String viewPlace,
			String viewDate, String viewTime, Date orderDate, int playInfoConnect, int memberConnect, int amount,
			String playPoster, String playTitle, Date playStartDate, Date playEndDate, String chargeKey,
			String starTrigger) {
		super();
		this.idxT = idxT;
		this.bookNumber = bookNumber;
		this.id = id;
		this.viewer = viewer;
		this.viewerCount = viewerCount;
		this.phone = phone;
		this.email = email;
		this.addrMain = addrMain;
		this.addrDetail1 = addrDetail1;
		this.addrDetail2 = addrDetail2;
		this.seatNumber = seatNumber;
		this.viewPlace = viewPlace;
		this.viewDate = viewDate;
		this.viewTime = viewTime;
		this.orderDate = orderDate;
		this.playInfoConnect = playInfoConnect;
		this.memberConnect = memberConnect;
		this.amount = amount;
		this.playPoster = playPoster;
		this.playTitle = playTitle;
		this.playStartDate = playStartDate;
		this.playEndDate = playEndDate;
		this.chargeKey = chargeKey;
		this.starTrigger = starTrigger;
	}

	public int getIdxT() {
		return idxT;
	}

	public void setIdxT(int idxT) {
		this.idxT = idxT;
	}

	public String getBookNumber() {
		return bookNumber;
	}

	public void setBookNumber(String bookNumber) {
		this.bookNumber = bookNumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getViewer() {
		return viewer;
	}

	public void setViewer(String viewer) {
		this.viewer = viewer;
	}

	public int getViewerCount() {
		return viewerCount;
	}

	public void setViewerCount(int viewerCount) {
		this.viewerCount = viewerCount;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddrMain() {
		return addrMain;
	}

	public void setAddrMain(String addrMain) {
		this.addrMain = addrMain;
	}

	public String getAddrDetail1() {
		return addrDetail1;
	}

	public void setAddrDetail1(String addrDetail1) {
		this.addrDetail1 = addrDetail1;
	}

	public String getAddrDetail2() {
		return addrDetail2;
	}

	public void setAddrDetail2(String addrDetail2) {
		this.addrDetail2 = addrDetail2;
	}

	public String getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}

	public String getViewPlace() {
		return viewPlace;
	}

	public void setViewPlace(String viewPlace) {
		this.viewPlace = viewPlace;
	}

	public String getViewDate() {
		return viewDate;
	}

	public void setViewDate(String viewDate) {
		this.viewDate = viewDate;
	}

	public String getViewTime() {
		return viewTime;
	}

	public void setViewTime(String viewTime) {
		this.viewTime = viewTime;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getPlayInfoConnect() {
		return playInfoConnect;
	}

	public void setPlayInfoConnect(int playInfoConnect) {
		this.playInfoConnect = playInfoConnect;
	}

	public int getMemberConnect() {
		return memberConnect;
	}

	public void setMemberConnect(int memberConnect) {
		this.memberConnect = memberConnect;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPlayPoster() {
		return playPoster;
	}

	public void setPlayPoster(String playPoster) {
		this.playPoster = playPoster;
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

	public String getChargeKey() {
		return chargeKey;
	}

	public void setChargeKey(String chargeKey) {
		this.chargeKey = chargeKey;
	}

	public String getStarTrigger() {
		return starTrigger;
	}

	public void setStarTrigger(String starTrigger) {
		this.starTrigger = starTrigger;
	}

	@Override
	public String toString() {
		return "PlayTicketVO [idxT=" + idxT + ", bookNumber=" + bookNumber + ", id=" + id + ", viewer=" + viewer
				+ ", viewerCount=" + viewerCount + ", phone=" + phone + ", email=" + email + ", addrMain=" + addrMain
				+ ", addrDetail1=" + addrDetail1 + ", addrDetail2=" + addrDetail2 + ", seatNumber=" + seatNumber
				+ ", viewPlace=" + viewPlace + ", viewDate=" + viewDate + ", viewTime=" + viewTime + ", orderDate="
				+ orderDate + ", playInfoConnect=" + playInfoConnect + ", memberConnect=" + memberConnect + ", amount="
				+ amount + ", playPoster=" + playPoster + ", playTitle=" + playTitle + ", playStartDate="
				+ playStartDate + ", playEndDate=" + playEndDate + ", chargeKey=" + chargeKey + ", starTrigger="
				+ starTrigger + "]";
	}
	
	
}
