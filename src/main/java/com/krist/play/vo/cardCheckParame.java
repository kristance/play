package com.krist.play.vo;

public class cardCheckParame {

	
	private String chargeKey;
	private int amount;
	
	public cardCheckParame() {
	}

	public cardCheckParame(String chargeKey, int amount) {
		super();
		this.chargeKey = chargeKey;
		this.amount = amount;
	}

	public String getChargeKey() {
		return chargeKey;
	}

	public void setChargeKey(String chargeKey) {
		this.chargeKey = chargeKey;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "cardCheckParam [chargeKey=" + chargeKey + ", amount=" + amount + "]";
	}
	
	
}
