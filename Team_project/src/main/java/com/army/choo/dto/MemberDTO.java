package com.army.choo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
}
