package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.InformationDTO;
import dto.NoticeDTO;
import service.InformationService;
import service.NoticeBoardService;

@Controller
public class IndexController {
	private InformationService service;
	public IndexController() {	}
	
	public void setService(InformationService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/foodindex.do")
	public String indexForm(HttpServletRequest request) {
		List<NoticeDTO> list = service.noticeListMethod();
		request.setAttribute("list", list);
		List<InformationDTO> ilist = service.bestListMethod();
		request.setAttribute("ilist", ilist);
		List<InformationDTO> blist = service.newboxListMethod();
		request.setAttribute("blist", blist);
		List<InformationDTO> slist = service.newsideListMethod();
		request.setAttribute("slist", slist);
		return "front_index";
	}

	@RequestMapping(value = "/foodstore.do")
	public String foodStore() {
		return "front_store";
	}
	
	//인덱스 공지사항 뷰창으로 넘어가기
	@RequestMapping(value="/mynoticeView.do")
	public ModelAndView mynoticeView(int n_no) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = service.mynoticeViewMethod(n_no);
		mav.addObject("ndto",service.mynoticeViewMethod(n_no));
		mav.setViewName("NoticeView");
		return mav;
	}

	//최고의 수락간 더보기 리스트
	@RequestMapping(value="/bestlistview.do")
	public String bestlistview(HttpServletRequest request) {
		List<InformationDTO> vlist = service.bestListViewMethod();
		request.setAttribute("vlist", vlist);
		return "best_list";
	}
	
}
