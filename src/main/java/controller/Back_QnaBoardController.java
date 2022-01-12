package controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.PageDTO;
import dto.QnaDTO;
import dto.SearchDTO;
import service.QnaBoardService;

@Controller
public class Back_QnaBoardController {
	private QnaBoardService service;
	private PageDTO pdto;
	
	int currentPage; //현재 페이지 값 넘길 때 사용하는 변수
	
	public Back_QnaBoardController() { }
	
	public void setService(QnaBoardService service) {
		this.service = service;
	}

	//--------------------------------------------------------------- 시작
	
	// num에 해당되는 조회수 증가 하고 해당되는 레코드 값을 가져옴
	@RequestMapping("/QnaView.do")	
	public ModelAndView QnaView(String pageNum, int num, HttpServletRequest request) {
		String currentPage =  request.getParameter("pagenum") ;
		ModelAndView mav = new ModelAndView();
		mav.addObject("qdto",service.contentProcessMethod(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("QnaView");
		return mav;
	}//end viewMethod()
	
	@RequestMapping(value="/QnaUpdate.do", method=RequestMethod.GET)
	public ModelAndView Qnaupdate(int num/*, int currentPage*/, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qdto", service.updateSelectProcessMethod(Integer.parseInt(request.getParameter("num"))));
//		mav.addObject("currentPage", currentPage);
		mav.setViewName("QnaUpdate");
		return mav;
	}//end updateMethod
	
	@RequestMapping(value="/QnaUpdate.do", method=RequestMethod.POST)
	public ModelAndView QnaupdatePro(QnaDTO qdto/*, int currentPage*/, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.updateProcessMethod(qdto, request);
	/*	mav.addObject("currentPage", currentPage);*/
		mav.setViewName("redirect:/admin.do");
		return mav;
	}//end updateProc
	
	@RequestMapping("/QnaDelete.do")
	public ModelAndView deleteMethod(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcessMethod(Integer.parseInt(request.getParameter("num")), request);
		mav.setViewName("redirect:/admin.do");
		return mav;
	}//end deleteMethod()
	
}//end class
