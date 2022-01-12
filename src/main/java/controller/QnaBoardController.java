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
public class QnaBoardController {
	private QnaBoardService service;
	private PageDTO pdto;
	
	int currentPage; //현재 페이지 값 넘길 때 사용하는 변수
	
	public QnaBoardController() { }
	
	public void setService(QnaBoardService service) {
		this.service = service;
	}

	//--------------------------------------------------------------- 시작
	
	@RequestMapping("/QnaList.do")
	public ModelAndView QnaList(HttpServletRequest request,PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		
		SearchDTO sdto = new SearchDTO();

		//QnaList.jsp페이지에 위치한 값을 요청해 불러와 불러온 값을 sdto에  set해줌
		sdto.setHead(request.getParameter("head"));
		sdto.setOption(request.getParameter("option2"));
		sdto.setKeyword(request.getParameter("keyword2"));

		//게시글 레코드 수 가져옴
		int boardTotalRecord = service.countProcessMethod(sdto);
	
		if(boardTotalRecord >= 1) {
			if(pv.getCurrentPage()==0) 
				currentPage = 1; 
			else 
				// page클릭했을때 넘겨준 값을 저장
				currentPage = pv.getCurrentPage();
		}//if문 종료
		
		pdto = new PageDTO(currentPage, boardTotalRecord);		
		mav.addObject("aList",service.listProcessMethod(pdto, sdto));
		mav.addObject("pdto", pdto);
		
		//각 변수명이름을 설정해 sdto에 저장된 값들을 불러와 저장함
		mav.addObject("head", sdto.getHead());
		mav.addObject("option2", sdto.getOption());
		mav.addObject("keyword2",sdto.getKeyword());
		
		//QnaList페이지로 이동(값과 함꼐)
		mav.setViewName("QnaList");
		return mav;
	}//end QnaList(QNA 리스트)
	
	
	// num에 해당되는 조회수 증가 하고 해당되는 레코드 값을 가져옴
	@RequestMapping("/QnaView.do")	
	public ModelAndView QnaView(int currentPage, int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qdto",service.contentProcessMethod(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("QnaView");
		return mav;
	}//end viewMethod()
	
	
	@RequestMapping(value="/QnaWrite.do", method=RequestMethod.GET)
	public ModelAndView Qnawrite(PageDTO pv, QnaDTO qdto) {
		ModelAndView mav = new ModelAndView();
		if(qdto.getQ_ref() !=0) {
			mav.addObject("currentPage", pv.getCurrentPage());
			mav.addObject("qdto", qdto);
		}
		mav.setViewName("QnaWrite");
		return mav;
	}
	
	@RequestMapping(value="/QnaWrite.do", method=RequestMethod.POST)
	public String QnawritePro(QnaDTO qdto, HttpServletRequest request) {
		service.saveProcessMethod(qdto);
		System.out.println(qdto.getU_no() + qdto.getQ_head() + qdto.getQ_title() + qdto.getQ_content() );
		return "redirect:/QnaList.do";
	}//end writeMethod();

	@RequestMapping(value="/QnaUpdate.do", method=RequestMethod.GET)
	public ModelAndView Qnaupdate(int num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qdto", service.updateSelectProcessMethod(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("QnaUpdate");
		return mav;
	}//end updateMethod
	
	@RequestMapping(value="/QnaUpdate.do", method=RequestMethod.POST)
	public ModelAndView QnaupdatePro(QnaDTO qdto, int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.updateProcessMethod(qdto, request);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/QnaList.do");
		System.out.println(qdto.getQ_head() + qdto.getQ_title() + qdto.getQ_content() );
		return mav;
	}//end updateProc
	
	@RequestMapping("/QnaDelete.do")
	public ModelAndView deleteMethod(int num, int currentPage,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.deleteProcessMethod(num, request);
		
		/*PageDTO pv = new PageDTO(currentPage,service.countProcessMethod());
	
		//	중간 페이지에 있는 글을 삭제했을 경우에는 해당페이지가 나와야 함 
		//	따라서 currentPage가 현재페이지 값 보다 크면 현재페이지 값이 나오게 조건설정
		if(pv.getTotalPage() <= currentPage) 
			mav.addObject("currentPage",pv.getTotalPage());
		else 
			mav.addObject("currentPage",currentPage);*/
		
		mav.setViewName("redirect:/QnaList.do");
		return mav;
	}//end deleteMethod()
	
	
	
/*	
		@RequestMapping("/image")
		 파일 전송 때 id를 file로 받아서 requestparam 역시 file로 -> form_data.append('file',file);
		   MultipartFile은 스프링 지원 객체, 전송한 파일 데이터가 담김 
	   @ResponseBody
		public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file) {
	        try {
	            UploadFile uploadedFile = imageService.store(file);
	            return ResponseEntity.ok().body("/image/" + uploadedFile.getId());
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.badRequest().build();
	        }
	    }
*/

	
	//관리자
	// num에 해당되는 조회수 증가 하고 해당되는 레코드 값을 가져옴
		@RequestMapping("/bQnaView.do")	
		public ModelAndView QnaView(String pageNum, int num, HttpServletRequest request) {
			String currentPage =  request.getParameter("pagenum") ;
			ModelAndView mav = new ModelAndView();
			mav.addObject("qdto",service.contentProcessMethod(num));
			mav.addObject("currentPage", currentPage);
			mav.setViewName("QnaView");
			return mav;
		}//end viewMethod()
		
		@RequestMapping(value="/bQnaUpdate.do", method=RequestMethod.GET)
		public ModelAndView Qnaupdate(int num/*, int currentPage*/, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("qdto", service.updateSelectProcessMethod(Integer.parseInt(request.getParameter("num"))));
//			mav.addObject("currentPage", currentPage);
			mav.setViewName("QnaUpdate");
			return mav;
		}//end updateMethod
		
		@RequestMapping(value="/bQnaUpdate.do", method=RequestMethod.POST)
		public ModelAndView QnaupdatePro(QnaDTO qdto/*, int currentPage*/, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			service.updateProcessMethod(qdto, request);
		/*	mav.addObject("currentPage", currentPage);*/
			mav.setViewName("redirect:/admin.do");
			return mav;
		}//end updateProc
		
		@RequestMapping("/bQnaDelete.do")
		public ModelAndView deleteMethod(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			service.deleteProcessMethod(Integer.parseInt(request.getParameter("num")), request);
			mav.setViewName("redirect:/admin.do");
			return mav;
		}//end deleteMethod()
	
}//end class
