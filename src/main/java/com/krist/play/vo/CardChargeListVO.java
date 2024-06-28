package com.krist.play.vo;

import java.util.Date;

public class CardChargeListVO {

	private int idxCardCharge;
	private String chargeKey;
	private String name;
	private int amount;
	private String chargePlace;
	private int cardConnect;
	private Date chargeDate;
	
	
	public CardChargeListVO() {
	}


	public CardChargeListVO(int idxCardCharge, String chargeKey, String name, int amount, String chargePlace,
			int cardConnect, Date chargeDate) {
		super();
		this.idxCardCharge = idxCardCharge;
		this.chargeKey = chargeKey;
		this.name = name;
		this.amount = amount;
		this.chargePlace = chargePlace;
		this.cardConnect = cardConnect;
		this.chargeDate = chargeDate;
	}


	public int getIdxCardCharge() {
		return idxCardCharge;
	}


	public void setIdxCardCharge(int idxCardCharge) {
		this.idxCardCharge = idxCardCharge;
	}


	public String getChargeKey() {
		return chargeKey;
	}


	public void setChargeKey(String chargeKey) {
		this.chargeKey = chargeKey;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public String getChargePlace() {
		return chargePlace;
	}


	public void setChargePlace(String chargePlace) {
		this.chargePlace = chargePlace;
	}


	public int getCardConnect() {
		return cardConnect;
	}


	public void setCardConnect(int cardConnect) {
		this.cardConnect = cardConnect;
	}


	public Date getChargeDate() {
		return chargeDate;
	}


	public void setChargeDate(Date chargeDate) {
		this.chargeDate = chargeDate;
	}


	@Override
	public String toString() {
		return "CardChargeListVO [idxCardCharge=" + idxCardCharge + ", chargeKey=" + chargeKey + ", name=" + name
				+ ", amount=" + amount + ", chargePlace=" + chargePlace + ", cardConnect=" + cardConnect
				+ ", chargeDate=" + chargeDate + "]";
	}

	
	
	
}
