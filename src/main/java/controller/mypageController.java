package controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.Information_CommentDTO;
import dto.OderDTO;
import dto.QnaDTO;
import dto.UsersDTO;
import service.InformationService;
import service.MypageService;

@Controller
public class mypageController {

	private InformationService service;
	private MypageService service2;
	
	
	public void setService(InformationService service) {
		this.service = service;
	}
	
	public void setService2(MypageService service2) {
		this.service2 = service2;
	}
	//마이페이지
	@RequestMapping(value="/mypage.do")
	public String mypage() {
		return "mypage";
	}
	
	//마이페이지 탭
	@RequestMapping(value="/mypagetab.do")
	public String mypagetab(HttpSession session, HttpServletRequest request) {
	    String u_id = (String) session.getAttribute("u_id");
	    String u_address = null;
	    String u_mail = null;
		UsersDTO dto = service.usersinfoMethod(u_id);
		request.setAttribute("list", dto);
		if(u_address != dto.getU_address()) {
			request.setAttribute("u_address", dto.getU_address());
		}
		if(u_mail != dto.getU_mail()) {
			request.setAttribute("u_mail", dto.getU_mail());
		}
		request.setAttribute("u_address", u_address);
		request.setAttribute("u_mail", u_mail);
	    return "myinfo";	
	}
	
	//회원정보수정 pro
	@RequestMapping(value="/infoupdatePro.do", method=RequestMethod.POST)
	public String infoupdatePro(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		UsersDTO dto = new UsersDTO();
		String u_hp=request.getParameter("u_hp1")+"-"+request.getParameter("u_hp2")+"-"+request.getParameter("u_hp3");
    	String u_mail=request.getParameter("u_mail1")+"-"+request.getParameter("u_mail4");
    	String u_address=request.getParameter("u_address1")+"-"+request.getParameter("u_address2")+"-"+request.getParameter("u_address3");
    	String u_id = (String) session.getAttribute("u_id");
    	dto.setU_id(u_id);
    	dto.setU_pw(request.getParameter("u_pw"));
    	dto.setU_hp(u_hp);
    	dto.setU_mail(u_mail);
    	dto.setU_address(u_address);
    	
    	service.infoupdateMethod(dto);
    	
    	return "redirect:/updatesuccess.do";
	}
	
	//회원수정 완료
    @RequestMapping(value="/updatesuccess.do")
    public String joinsuccess(HttpSession session) {
    	service.logoutMethod(session);
		return "front_login";
    }
    
    //회원 탈퇴 pro
    @RequestMapping(value="/infodelPro.do", method = RequestMethod.POST)
    public String infodelpro(HttpSession session, HttpServletRequest request) {
    	String u_no = request.getParameter("u_id_val");
   /* 	String u_no = (String) session.getAttribute("u_no");*/
    	service.infodelMethod(Integer.parseInt(u_no));
    	service.logoutMethod(session);
    	return "front_login";
    } 
    
    //마이페이지 나의 질문
    @RequestMapping(value="/qnainfo.do")
    public ModelAndView qnainfo( HttpServletRequest request, HttpSession session) {
    	int u_no = (int) session.getAttribute("u_no");
    	ModelAndView mav = new ModelAndView();
    	List<QnaDTO> list = service.qnainfoMethod(u_no);
    	/*System.out.println(list.get(0).getQ_no());*/
    	mav.addObject("aList", service.qnainfoMethod(u_no));
    	mav.setViewName("myqna");
    	return mav;
    }
    
    //마이페이지 나의 qna뷰창
	@RequestMapping("/mypageQnaView.do")	
	public ModelAndView QnaView(int q_no) {
		ModelAndView mav = new ModelAndView();
		QnaDTO dto= service.myqnaviewMethod(q_no);
	    dto.getQ_head();
		mav.addObject("qdto",service.myqnaviewMethod(q_no));
		mav.setViewName("QnaView");
		return mav;
	}//end viewMethod()
    
    
    //마이페이지 주문내역조회
	@RequestMapping("/myorder.do")
	public ModelAndView myorder(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("u_no")==null) {
			mav.setViewName("front_login"); 
		}else {
			Calendar cal = Calendar.getInstance();
			int month = cal.get(Calendar.MONTH)+1;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("u_no", session.getAttribute("u_no"));
			map.put("month", month);
			List<OderDTO> orderList = service2.myorderList(map);
			mav.addObject("orderList", orderList);
			mav.setViewName("myorder");
		}
		return mav;
	}
	@RequestMapping("/detailOrder.do")
	public @ResponseBody List<OderDTO> detailOrder(HttpSession session, int today) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String month;
		String day;
		if(cal.get(Calendar.MONTH)+1<10) {
			month = "0"+(cal.get(Calendar.MONTH)+1);
		}else {
			month = ""+(cal.get(Calendar.MONTH)+1);
		}
		if(today<10) {
			day = "0"+today;
		}else {
			day = ""+today;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("u_no", session.getAttribute("u_no"));
		map.put("date", year+"-"+month+"-"+day);
		
		return service2.detailOrder(map);
	}
	
	//후기
	@RequestMapping("/myreview.do")
	public ModelAndView myreview(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("u_no")==null) {
			mav.setViewName("front_login"); 
		}else {
			int u_no = (int)session.getAttribute("u_no");
			mav.addObject("commList", service2.myreviewList(u_no));
			mav.setViewName("myreview");
		}
		return mav;
	}
	
	@RequestMapping("/reviewDel.do")
	public String reviewDel(int ic_no) {
		System.out.println(ic_no);
		Map<String, Object> map = new HashMap<String, Object>();
		service2.reviewDel(ic_no);
		
		return "redirect:/myreview.do";
	}
	
	@RequestMapping("reviewUpt.do")
	public String reviewUpt(HttpSession session, Information_CommentDTO dto) {
		service2.reviewUpt(dto);
		return "redirect:/myreview.do";
	}
	
	
}





