package com.army.choo.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.army.choo.dao.NoticeDAO;
import com.army.choo.dto.NoticeDTO;
import com.army.choo.dto.PageDTO;

@Service
public class NoticeService {


	public ModelAndView mav;
	
	@Autowired
	public NoticeDAO ndao;
	
	//공지사항 리스트
	private static final int PAGE_LIMIT = 5;  
	private static final int BLOCK_LIMIT = 5; 
	
	public ModelAndView noticeList(int page) {
		mav = new ModelAndView();
		int listcount = ndao.listcount();
		int startrow =(page-1)*PAGE_LIMIT+1;	
		int endrow = page*PAGE_LIMIT;		
		PageDTO pdto = new PageDTO();
		pdto.setStartrow(startrow);
		pdto.setEndrow(endrow);
		List<PageDTO> bplist = ndao.noticeListpaging(pdto);
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
		mav.addObject("noticelistpaging" , bplist);
		mav.setViewName("noticev/noticelist");
		return mav;
	}

	//공지사항 작성
	public ModelAndView noticeWrite(NoticeDTO ndto) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile nfile = ndto.getNfile();
		String nfilename = nfile.getOriginalFilename();
		String savepath = "D:\\source\\Spring\\Team_project\\src\\main"
				+ "\\webapp\\resources\\noticeimg";
		if(!nfile.isEmpty())
			{nfile.transferTo(new File(savepath));
			}
		ndto.setNfilename(nfilename);
		int result = ndao.noticeWrite(ndto);
		if(result ==1)
			{mav.setViewName("redirect:/noticelist");
			}
		else 
			{mav.setViewName("noticev/noticewritefail");
			}
		return mav;
	}
	
	//공지사항 삭제
	public ModelAndView noticeDelete(int nnumber) {
		mav = new ModelAndView();
		int result = ndao.noticeDelete(nnumber);
		if(result ==1)
			{mav.setViewName("redirect:/noticelist");
			}
		else 
			{mav.setViewName("noticev/noticedeletefail");
			}
		return mav;
	}
	
	//공지사항 상세보기
	public ModelAndView noticeView(int nnumber,int page) {
		mav = new ModelAndView();
		ndao.noticeHits(nnumber);
		NoticeDTO ndto = ndao.noticeView(nnumber);
		mav.addObject("ndto",ndto);
		mav.addObject("page",page);
		mav.setViewName("noticeview");
		return mav;
	}

	//공지사항 수정 정보 가져오기
	public ModelAndView noticeUpdate(int nnumber) {
		mav = new ModelAndView();
		NoticeDTO ndto = ndao.noticeView(nnumber);
		mav.addObject("ndto",ndto);
		mav.setViewName("noticeupdate");
		return mav;
	}
	

}
