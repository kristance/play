package com.krist.play.vo;

import java.util.Date;

public class PlayReplyVO {
	
	private int idxC;
	private String viewer;
	private String subjectReply;
	private String contentReply;
	private int playStar;
	Date writeDate;
	private String imageReply;
	private int viewCount;
	private int playInfoConnect;
	private int memberConnect;
	
	public PlayReplyVO() {
	}

	public PlayReplyVO(int idxC, String viewer, String subjectReply, String contentReply, int playStar, Date writeDate,
			String imageReply, int viewCount, int playInfoConnect, int memberConnect) {
		super();
		this.idxC = idxC;
		this.viewer = viewer;
		this.subjectReply = subjectReply;
		this.contentReply = contentReply;
		this.playStar = playStar;
		this.writeDate = writeDate;
		this.imageReply = imageReply;
		this.viewCount = viewCount;
		this.playInfoConnect = playInfoConnect;
		this.memberConnect = memberConnect;
	}

	public int getIdxC() {
		return idxC;
	}

	public void setIdxC(int idxC) {
		this.idxC = idxC;
	}

	public String getViewer() {
		return viewer;
	}

	public void setViewer(String viewer) {
		this.viewer = viewer;
	}

	public String getSubjectReply() {
		return subjectReply;
	}

	public void setSubjectReply(String subjectReply) {
		this.subjectReply = subjectReply;
	}

	public String getContentReply() {
		return contentReply;
	}

	public void setContentReply(String contentReply) {
		this.contentReply = contentReply;
	}

	public int getPlayStar() {
		return playStar;
	}

	public void setPlayStar(int playStar) {
		this.playStar = playStar;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getImageReply() {
		return imageReply;
	}

	public void setImageReply(String imageReply) {
		this.imageReply = imageReply;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
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

	@Override
	public String toString() {
		return "PlayReplyVO [idxC=" + idxC + ", viewer=" + viewer + ", subjectReply=" + subjectReply + ", contentReply="
				+ contentReply + ", playStar=" + playStar + ", writeDate=" + writeDate + ", imageReply=" + imageReply
				+ ", viewCount=" + viewCount + ", playInfoConnect=" + playInfoConnect + ", memberConnect="
				+ memberConnect + "]";
	}

	
	
	
}
