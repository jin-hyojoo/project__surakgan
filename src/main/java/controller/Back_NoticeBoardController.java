package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.NoticeDTO;
import dto.PageDTO;
import service.NoticeBoardService;

@Controller
public class Back_NoticeBoardController {
	private NoticeBoardService service;
	private PageDTO pdto;
	
	int currentPage; //현재 페이지 값 넘길 때 사용하는 변수
	
	public Back_NoticeBoardController() { }
	
	public void setService(NoticeBoardService service) {
		this.service = service;
	}

	//--------------------------------------------------------------- 시작
	
	
	
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
