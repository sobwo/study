package com.myezen.myapp.domain;

public class CommentVo {
	private int cidx,midx,bidx;
	private String cwriter,ccontents,ip,cwriteDay;
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getCwriter() {
		return cwriter;
	}
	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}
	public String getCcontents() {
		return ccontents;
	}
	public void setCcontents(String ccontents) {
		this.ccontents = ccontents;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCwriteDay() {
		return cwriteDay;
	}
	public void setCwriteDay(String cwriteDay) {
		this.cwriteDay = cwriteDay;
	}

}
