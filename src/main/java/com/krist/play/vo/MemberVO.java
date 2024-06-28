package com.krist.play.vo;

public class MemberVO {
	
	private int idxM;
	private String id;
	private String password;
	private String addrPost;
	private String addrMain;
	private String addrDetail1;
	private String addrDetail2;
	private String email;
	private String phone;
	private String image = "default/default.jpg";
	private String name;
	
	public MemberVO() {
	}

	public MemberVO(int idxM, String id, String password, String addrPost, String addrMain, String addrDetail1,
			String addrDetail2, String email, String phone, String image, String name) {
		super();
		this.idxM = idxM;
		this.id = id;
		this.password = password;
		this.addrPost = addrPost;
		this.addrMain = addrMain;
		this.addrDetail1 = addrDetail1;
		this.addrDetail2 = addrDetail2;
		this.email = email;
		this.phone = phone;
		this.image = image;
		this.name = name;
	}

	public int getIdxM() {
		return idxM;
	}

	public void setIdxM(int idxM) {
		this.idxM = idxM;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddrPost() {
		return addrPost;
	}

	public void setAddrPost(String addrPost) {
		this.addrPost = addrPost;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MemberVO [idxM=" + idxM + ", id=" + id + ", password=" + password + ", addrPost=" + addrPost
				+ ", addrMain=" + addrMain + ", addrDetail1=" + addrDetail1 + ", addrDetail2=" + addrDetail2
				+ ", email=" + email + ", phone=" + phone + ", image=" + image + ", name=" + name + "]";
	}
	
	
	
	
}
