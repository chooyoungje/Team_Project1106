package com.army.choo.dto;

public class PageDTO {
	
	private int page;
	private int maxpage;
	private int endpage;
	private int startpage;
	private int startrow;
	private int endrow;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public PageDTO(int page, int maxpage, int endpage, int startpage, int startrow, int endrow) {
		super();
		this.page = page;
		this.maxpage = maxpage;
		this.endpage = endpage;
		this.startpage = startpage;
		this.startrow = startrow;
		this.endrow = endrow;
	}
	public PageDTO() {
		super();
	}
	@Override
	public String toString() {
		return "PageDTO [page=" + page + ", maxpage=" + maxpage + ", endpage=" + endpage + ", startpage=" + startpage
				+ ", startrow=" + startrow + ", endrow=" + endrow + "]";
	}
	
	
}
