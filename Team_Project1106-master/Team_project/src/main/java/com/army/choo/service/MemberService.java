package com.army.choo.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dao.MemberDAO;
import com.army.choo.dto.ComMemberDTO;
import com.army.choo.dto.MemberDTO;
import com.army.choo.dto.PageDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mDAO;
	
	private ModelAndView mav;
	
	//기업 회원가입
	public ModelAndView comMemberInsertForm(ComMemberDTO mDTO) {
		mav = new ModelAndView();
		int result = mDAO.comMemberInsertForm(mDTO);
		if(result > 0) {
			mav.setViewName("home");
		} else {
			mav.setViewName("Fail");
		}
		return mav;
	}
	
	private static final int PAGE_LIMIT = 5;  
	private static final int BLOCK_LIMIT = 5;
	//지점 리스트
	public ModelAndView commemberList(int page) {
		mav = new ModelAndView();
		int listcount = mDAO.listcount();
		int startrow =(page-1)*PAGE_LIMIT+1;	
		int endrow = page*PAGE_LIMIT;		
		PageDTO pdto = new PageDTO();
		pdto.setStartrow(startrow);
		pdto.setEndrow(endrow);
		List<PageDTO> bplist = mDAO.commemberListpaging(pdto);
		int startpage =(((int)(Math.ceil((double)page/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1;  //1 6  11 16
		int maxpage =(int)(Math.ceil((double)listcount/PAGE_LIMIT));					//5 10 15 20
		int endpage = startpage + BLOCK_LIMIT -1;
		
		if(endpage>maxpage) 
			{endpage=maxpage;
			}
		
		pdto.setPage(page);
		pdto.setStartpage(startpage);
		pdto.setEndpage(endpage);
		pdto.setMaxpage(maxpage);
		
		mav.addObject("paging" , pdto);
		mav.addObject("comlist" , bplist);
		mav.setViewName("commemberv/ComMemberList");
		
		return mav;
	}
	
	//기업로그인
	public int comLoignForm(ComMemberDTO mDTO) {
	mav = new ModelAndView();
	int result = 0;
	String loginid = mDAO.comLoginForm(mDTO);
	if(loginid != null) {
		result=1;
		} else {
			result=0;
		}
		return result;
		}
	
	//일반회원 회원가입
	public ModelAndView memberinset(MemberDTO member) {
		int joinResult = mDAO.memberinsert(member);
		mav = new ModelAndView();
		
		if(joinResult > 0) {
			mav.setViewName("memberv/UserMemberLogin");
		}
		return mav;
	}
	//아이디 중복체크
	public String idOverlap(String mid) {
		String checkResult = mDAO.idOverlap(mid);
		String resultMsg = null;
		if(checkResult == null) {
			resultMsg = "OK";
		}else {
			resultMsg ="NO";
		}
		return resultMsg;
	}

	//일반회원 로그인
	public int memberlogin(MemberDTO member) {
		String loginid = mDAO.memberlogin(member);
		int result =0;
		if(loginid != null) {
			result=1;
		} else {
			result=0;
		}
		return result;
		
		
	}

}
