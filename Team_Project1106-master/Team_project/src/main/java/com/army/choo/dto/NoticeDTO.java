package com.army.choo.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	private int nnumber;
	private String ntitle ;
	private String ncontents ;
	private Date ndate ;
	private MultipartFile nfile;
	private String nfilename ;
	private int nhits;
	public NoticeDTO(int nnumber, String ntitle, String ncontents, Date ndate, MultipartFile nfile, String nfilename,
			int nhits) {
		super();
		this.nnumber = nnumber;
		this.ntitle = ntitle;
		this.ncontents = ncontents;
		this.ndate = ndate;
		this.nfile = nfile;
		this.nfilename = nfilename;
		this.nhits = nhits;
	}
	public NoticeDTO() {
		super();
	}
	public int getNnumber() {
		return nnumber;
	}
	public void setNnumber(int nnumber) {
		this.nnumber = nnumber;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontents() {
		return ncontents;
	}
	public void setNcontents(String ncontents) {
		this.ncontents = ncontents;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public MultipartFile getNfile() {
		return nfile;
	}
	public void setNfile(MultipartFile nfile) {
		this.nfile = nfile;
	}
	public String getNfilename() {
		return nfilename;
	}
	public void setNfilename(String nfilename) {
		this.nfilename = nfilename;
	}
	public int getNhits() {
		return nhits;
	}
	public void setNhits(int nhits) {
		this.nhits = nhits;
	}
	
	
}
