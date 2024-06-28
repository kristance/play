package com.krist.play.vo;

public class CardVO {

	private int idxCard;
	private String cardName;
	private String owner;
	private String ownerAmho;
	private int password;
	private String passwordAmho;
	private String cardNoAmho;
	private String expDate;
	
	public CardVO() {
	}

	public CardVO(int idxCard, String cardName, String owner, String ownerAmho, int password, String passwordAmho,
			String cardNoAmho, String expDate) {
		super();
		this.idxCard = idxCard;
		this.cardName = cardName;
		this.owner = owner;
		this.ownerAmho = ownerAmho;
		this.password = password;
		this.passwordAmho = passwordAmho;
		this.cardNoAmho = cardNoAmho;
		this.expDate = expDate;
	}

	public int getIdxCard() {
		return idxCard;
	}

	public void setIdxCard(int idxCard) {
		this.idxCard = idxCard;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getOwnerAmho() {
		return ownerAmho;
	}

	public void setOwnerAmho(String ownerAmho) {
		this.ownerAmho = ownerAmho;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public String getPasswordAmho() {
		return passwordAmho;
	}

	public void setPasswordAmho(String passwordAmho) {
		this.passwordAmho = passwordAmho;
	}

	public String getCardNoAmho() {
		return cardNoAmho;
	}

	public void setCardNoAmho(String cardNoAmho) {
		this.cardNoAmho = cardNoAmho;
	}

	public String getExpDate() {
		return expDate;
	}

	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}

	@Override
	public String toString() {
		return "CardVO [idxCard=" + idxCard + ", cardName=" + cardName + ", owner=" + owner + ", ownerAmho=" + ownerAmho
				+ ", password=" + password + ", passwordAmho=" + passwordAmho + ", cardNoAmho=" + cardNoAmho
				+ ", expDate=" + expDate + "]";
	}

	
	
	
	
}
