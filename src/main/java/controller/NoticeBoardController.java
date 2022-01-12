package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.NoticeDTO;
import dto.PageDTO;
import dto.SearchDTO;
import service.NoticeBoardService;

@Controller
public class NoticeBoardController {
	private NoticeBoardService service;
	private PageDTO pdto;
	
	int currentPage; //현재 페이지 값 넘길 때 사용하는 변수
	
	public NoticeBoardController() { }
	
	public void setService(NoticeBoardService service) {
		this.service = service;
	}

	//--------------------------------------------------------------- 시작
	
	@RequestMapping("/NoticeList.do")
	public ModelAndView NoticeList(HttpServletRequest request,PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		SearchDTO sdto = new SearchDTO();
		
		sdto.setHead(request.getParameter("head"));
		sdto.setOption(request.getParameter("option2"));
		sdto.setKeyword(request.getParameter("keyword2"));
		
		
		int boardTotalRecord = service.countProcessMethod(sdto);
		
		if(boardTotalRecord >= 1) {
			if(pv.getCurrentPage()==0) {
				currentPage = 1; 
			}
			else {
				currentPage = pv.getCurrentPage();
			}
		}//if문 종료
		
		sdto.setHead(request.getParameter("head"));
		sdto.setOption(request.getParameter("option"));
		sdto.setKeyword(request.getParameter("keyword"));
		pdto = new PageDTO(currentPage, boardTotalRecord);		
		mav.addObject("aList",service.listProcessMethod(pdto, sdto));
		mav.addObject("pdto", pdto); 
		
		mav.addObject("head", sdto.getHead());
		mav.addObject("option2",sdto.getOption());
		mav.addObject("keyword2",sdto.getKeyword());
		
		mav.setViewName("NoticeList");
		return mav;
	}//end NoticeList(공지 리스트)
	
	
	@RequestMapping("/NoticeView.do")	
	public ModelAndView NoticeView(int currentPage, int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("ndto",service.contentProcessMethod(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("NoticeView");
		return mav;
	}//end NoticeView(공지 게시글 내용)
	
	//관리자
	@RequestMapping(value="/NoticeWrite.do", method=RequestMethod.GET)
	public ModelAndView Noticewrite(PageDTO pv, NoticeDTO ndto) {
		ModelAndView mav = new ModelAndView();
		/*if(ndto.getN_ref() !=0) {
			mav.addObject("currentPage", pv.getCurrentPage());
			mav.addObject("ndto", ndto);
		}*/
		mav.setViewName("NoticeWrite");
		return mav;
	}
	
	@RequestMapping(value="/NoticeWrite.do", method=RequestMethod.POST)
	public String NoticewritePro(NoticeDTO ndto, HttpServletRequest request, HttpSession session) {
		ndto.setU_no((int)session.getAttribute("u_no"));
		service.saveProcessMethod(ndto);
		return "redirect:/admin.do";
	}//end writeMethod();
	
	
	@RequestMapping(value="/NoticeUpdate.do", method=RequestMethod.GET)
	public ModelAndView Noticeupdate(int num/*, int currentPage*/) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("ndto", service.updateSelectProcessMethod(num));
		//mav.addObject("currentPage", currentPage);
		mav.setViewName("NoticeUpdate");
		return mav;
	}//end updateMethod
	
	@RequestMapping(value="/NoticeUpdate.do", method=RequestMethod.POST)
	public ModelAndView NoticeupdatePro(NoticeDTO ndto/*, int currentPage*/, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.updateProcessMethod(ndto, request);
		/*mav.addObject("currentPage", currentPage);*/
		mav.setViewName("redirect:/admin.do");
		return mav;
	}//end updateProc
	
	
	
	@RequestMapping("/NoticeDelete.do")
	public ModelAndView deleteMethod(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcessMethod(Integer.parseInt(request.getParameter("num")), request);
		mav.setViewName("redirect:/admin.do");
		return mav;
	}//end deleteMethod()
	
	
}//end class
