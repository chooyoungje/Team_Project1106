package com.army.choo.dto;

public class ComMemberDTO {
	
	private String comnumber;
	private String compassword;
	private String comaddress1;
	private String comaddress2;
	private String comaddress3;
	private String comaddress4;
	private String comphone;
	private String company;
	private String comoffice;
	public String getComnumber() {
		return comnumber;
	}
	public void setComnumber(String comnumber) {
		this.comnumber = comnumber;
	}
	public String getCompassword() {
		return compassword;
	}
	public void setCompassword(String compassword) {
		this.compassword = compassword;
	}
	public String getComaddress1() {
		return comaddress1;
	}
	public void setComaddress1(String comaddress1) {
		this.comaddress1 = comaddress1;
	}
	public String getComaddress2() {
		return comaddress2;
	}
	public void setComaddress2(String comaddress2) {
		this.comaddress2 = comaddress2;
	}
	public String getComaddress3() {
		return comaddress3;
	}
	public void setComaddress3(String comaddress3) {
		this.comaddress3 = comaddress3;
	}
	public String getComaddress4() {
		return comaddress4;
	}
	public void setComaddress4(String comaddress4) {
		this.comaddress4 = comaddress4;
	}
	public String getComphone() {
		return comphone;
	}
	public void setComphone(String comphone) {
		this.comphone = comphone;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getComoffice() {
		return comoffice;
	}
	public void setComoffice(String comoffice) {
		this.comoffice = comoffice;
	}
	public ComMemberDTO(String comnumber, String compassword, String comaddress1, String comaddress2,
			String comaddress3, String comaddress4, String comphone, String company, String comoffice) {
		super();
		this.comnumber = comnumber;
		this.compassword = compassword;
		this.comaddress1 = comaddress1;
		this.comaddress2 = comaddress2;
		this.comaddress3 = comaddress3;
		this.comaddress4 = comaddress4;
		this.comphone = comphone;
		this.company = company;
		this.comoffice = comoffice;
	}
	public ComMemberDTO() {
		super();
	}
	@Override
	public String toString() {
		return "ComMemberDTO [comnumber=" + comnumber + ", compassword=" + compassword + ", comaddress1=" + comaddress1
				+ ", comaddress2=" + comaddress2 + ", comaddress3=" + comaddress3 + ", comaddress4=" + comaddress4
				+ ", comphone=" + comphone + ", company=" + company + ", comoffice=" + comoffice + "]";
	}
	
	
}
