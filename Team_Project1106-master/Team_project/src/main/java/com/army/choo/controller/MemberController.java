package com.army.choo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dto.ComMemberDTO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	
	//선택 회원가입 창으로 가기
	@RequestMapping(value="/memberinsertpick")
	public String memberInsertPick() {
		return "MemberInsertPick";
	}
	
	//기업 회원가입창으로
	@RequestMapping(value="/commemberinsertgo")
	public String comMemberJoin() {
		return "commember/ComMemberJoin";
	}
	
	//기업 회원가입
	@RequestMapping(value="/commemberinsertform")
	public ModelAndView comMemberInsertForm(ComMemberDTO mDTO) {
		mav = ms.comMemberInsertForm(mDTO);
		return mav;
	}
	
	//로그인 선택 창으로 가기
	@RequestMapping(value="/loginpick")
	public String loginPick() {
		return "LoginPick";
	}
	
	//지점 리스트
	@RequestMapping(value="/commemberlistpaging")
	public ModelAndView commemberList(@RequestParam(value="page",
			required=false,defaultValue="1") int page) {
		mav = ms.commemberList(page);
		return mav;
	}
	
	
	//기업로그인 페이지 이동
	@RequestMapping(value="/commemberlogin")
	public String comMemberLogin() {
		return "commember/ComLogin";
	}
	
	//기업로그인
	@RequestMapping(value="/comlogin")
	public String comLoignForm(ComMemberDTO mDTO, HttpServletResponse response) {
		int result = ms.comLoignForm(mDTO);
		if(result==1)
			{
			 return "home";
			}
		else
			{return "Fail";
			}
	}
	//기업 회원 로그아웃
	@RequestMapping(value="/logout")
	public String logOut() {
		session.invalidate();
		return "Main";
	}
	
	//일반회원 회원가입 창으로
	@RequestMapping(value = "/memberinsertgo")
	public String memberinsertgo() {
		return "memberv/UserMemberJoin";
	}
	
	//일반회원 회원가입
	@RequestMapping(value = "/memberinsert")
	public ModelAndView memberinsert(@ModelAttribute MemberDTO member,
			@RequestParam("sample6_postcode") String address1,
			@RequestParam("sample6_address") String address2,
			@RequestParam("sample6_detailAddress") String address3,
			@RequestParam("sample6_extraAddress") String address4) {
		member.setMaddress(address1+""+address2+""+address3+""+address4);
		mav = ms.memberinset(member);
		return mav;	
	}
	
	// 아이디 중복확인
	@RequestMapping(value="/idoverlap")
		public @ResponseBody String idOverlap(@RequestParam("mid") String mid) {
			System.out.println("전달받은 값"+mid);
			String resultMsg = ms.idOverlap(mid);
			return resultMsg;
	}
	
	// 일반 회원 로그인창으로
	@RequestMapping(value = "/memberlogingo")
	public String memberlogingo(){
		return "memberv/UserMemberLogin";
	}
	
	// 일반 회원 로그인
	@RequestMapping(value = "/memberlogin")
	public String memberlogin(@ModelAttribute MemberDTO member,
			HttpServletResponse response) {
		 int result = ms.memberlogin(member);
		 if(result==1)
		 	{Cookie cookie1 = new Cookie("userinfo",member.getMid());
			 cookie1.setMaxAge(60*10);
			 cookie1.setPath("/");
			 response.addCookie(cookie1);
			 session.setAttribute("loginid",member.getMid());
			 return "home";
		 	}
		 else
		 	{return "home";
		 	}
	}
	
	// 일반 회원 로그아웃
	@RequestMapping(value="/memberlogout")
	public String memberLogout(HttpServletResponse response) {
		Cookie cookie1 = new Cookie("userinfo",null);
		cookie1.setMaxAge(0);
		cookie1.setPath("/");
		response.addCookie(cookie1);
		session.invalidate();
		return "memberv/Main";
	}
		
	
	
}
