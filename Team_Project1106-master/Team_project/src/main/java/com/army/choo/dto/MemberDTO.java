package com.army.choo.dto;



public class MemberDTO {
	private String mid;
	private String mpassword;
	private String mname;
	private String maddress;
	private String mphone;
	private String memail;
	private String mgender;
	private String mbirth;
	private String naverId;
	private String kakaoId;
	private String googleId;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getNaverId() {
		return naverId;
	}
	public void setNaverId(String naverId) {
		this.naverId = naverId;
	}
	public String getKakaoId() {
		return kakaoId;
	}
	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}
	public String getGoogleId() {
		return googleId;
	}
	public void setGoogleId(String googleId) {
		this.googleId = googleId;
	}
	@Override
	public String toString() {
		return "MemberDTO [mid=" + mid + ", mpassword=" + mpassword + ", mname=" + mname + ", maddress=" + maddress
				+ ", mphone=" + mphone + ", memail=" + memail + ", mgender=" + mgender + ", mbirth=" + mbirth
				+ ", naverId=" + naverId + ", kakaoId=" + kakaoId + ", googleId=" + googleId + "]";
	}
	public MemberDTO(String mid, String mpassword, String mname, String maddress, String mphone, String memail,
			String mgender, String mbirth, String naverId, String kakaoId, String googleId) {
		super();
		this.mid = mid;
		this.mpassword = mpassword;
		this.mname = mname;
		this.maddress = maddress;
		this.mphone = mphone;
		this.memail = memail;
		this.mgender = mgender;
		this.mbirth = mbirth;
		this.naverId = naverId;
		this.kakaoId = kakaoId;
		this.googleId = googleId;
	}
	public MemberDTO() {
		super();
	}
	
	
}
