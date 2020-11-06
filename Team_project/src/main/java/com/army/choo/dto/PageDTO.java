package com.army.choo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PageDTO {
	
	private int page;
	private int maxpage;
	private int endpage;
	private int startpage;
	private int startrow;
	private int endrow;
	
	
}
