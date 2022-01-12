package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.Cart_ListDTO;
import dto.InformationDTO;
import dto.NoticeDTO;
import dto.UsersDTO;
import service.InformationService;

@Controller
public class loginController {
	private InformationService service;
	
    public loginController() {
	}

    public void setService(InformationService service) {
		this.service = service;
	}
    
    //로그인 폼
	@RequestMapping(value="/loginform.do")
    public String loginForm() {
    	return "front_login";
    }
	
	//로그인
	   @RequestMapping(value="/logincheck.do", method = RequestMethod.POST)
	   public ModelAndView loginCheck(HttpSession session, HttpServletRequest res, HttpServletResponse response) throws IOException {
		  ArrayList<Cart_ListDTO> list = null;
		  List<Cart_ListDTO> memlist = null;
		  Cart_ListDTO cdto = null;
	      String u_id = res.getParameter("user_id");
	      String u_pw = res.getParameter("user_pw");
	      UsersDTO dto = new UsersDTO();
	      
	      dto.setU_id(u_id);
	      dto.setU_pw(u_pw);
	      
	     boolean result = service.loginCheckMethod(dto, session);
	         
	       ModelAndView mav = new ModelAndView();
	       if(result==true) {//로그인 성공
	   	   	  List<NoticeDTO> nlist = service.noticeListMethod();
			  mav.addObject("list", nlist);
			  List<InformationDTO> ilist = service.bestListMethod();
			  mav.addObject("ilist", ilist);
			  List<InformationDTO> blist = service.newboxListMethod();
			  mav.addObject("blist", blist);
			  List<InformationDTO> slist = service.newsideListMethod();
			  mav.addObject("slist", slist);
	    	   
	          mav.setViewName("front_index");
	          mav.addObject("msg","success");
	          response.setContentType("text/html; charset=UTF-8");
	          PrintWriter out = response.getWriter();
	          out.println("<script>alert('수락간 입장 완료!');</script>");
	          out.flush();
	          	
			if (session.getAttribute("cart_list") != null) {
				list = (ArrayList<Cart_ListDTO>) session.getAttribute("cart_list");

				int u_no = (int) session.getAttribute("u_no");
				memlist = service.listUserCartMethod(u_no);

				for (Cart_ListDTO clist : list) {
					cdto = new Cart_ListDTO();
					cdto.setU_no(u_no);
					cdto.setCl_img(clist.getCl_img());
					cdto.setCl_menu(clist.getCl_menu());
					cdto.setCl_price(clist.getCl_price());
					cdto.setCl_quantity(clist.getCl_quantity());
					cdto.setCl_totalprice(clist.getCl_totalprice());
					cdto.setCl_gubun(clist.getCl_gubun());
					cdto.setI_no(clist.getI_no());
					System.out.println("로그인 할때  데이터 :" + clist.getCl_menu() + clist.getCl_totalprice()+ "::" +clist.getI_no());

					if (memlist.size() == 0) {
						System.out.println("db 데이터가 아무것도 없네?");
						System.out.println("i_n0::"+cdto.getI_no());
						service.insertUserCartMethod(cdto);
					} else if (memlist.size() != 0) {
						boolean isOk = false;
						for (int i = 0; i < memlist.size(); i++) {
							if (cdto.getCl_menu().equals(memlist.get(i).getCl_menu())) {
								System.out.println("중복된게 있네?");
								cdto.setCl_quantity(memlist.get(i).getCl_quantity() + cdto.getCl_quantity());
								cdto.setCl_totalprice(memlist.get(i).getCl_totalprice() + cdto.getCl_totalprice());
								service.updateUserCartMethod(cdto);
								isOk = false;
								break;
							} else if (!cdto.getCl_menu().equals(memlist.get(i).getCl_menu())) {
								System.out.println("중복된거 없을때 : " + memlist.get(i).getCl_menu());
								isOk = true;

							}
						}
						if (isOk) {
							System.out.println("중복된거 없을때 삽입");
							session.removeAttribute("cart_list");
							service.insertUserCartMethod(cdto);
						}
					}
				}
			}

	       }else {//로그인 실패
	          mav.setViewName("front_login");
	          mav.addObject("msg","failure");
	          response.setContentType("text/html; charset=UTF-8");
	          PrintWriter out = response.getWriter();
	          out.println("<script>alert('아이디와 비밀번호를 확인해주세요');</script>");
	          out.flush();
	       }
	       return mav;
	       
	   }
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session){
		service.logoutMethod(session);
		ModelAndView mav = new ModelAndView();
		 mav.setViewName("front_login");
		 mav.addObject("msg","logout");
		return mav;
	}
	
	//회원가입 약관동의
	 @RequestMapping(value="/agreeForm.do")
	    public String agreeForm() {
	    	return "front_agree";
	    }
	
	 //회원 가입폼
    @RequestMapping(value="/joinform.do")
    public String joinForm() {
    	return "front_join";
    }
   
    //아이디 중복확인
    @RequestMapping(value="/idcheck.do", method =RequestMethod.GET)  
    public @ResponseBody int idcheck(String u_id) {
    	int count = 0;
        count = service.idCheckMethod(u_id);
        return count;
    }
    
    //휴대폰 중복확인
    @RequestMapping(value="/hpcheck.do", method =RequestMethod.GET)
    public @ResponseBody int hpcheck(String u_hp) {
    	int count=0;
    	count = service.hpCheckMethod(u_hp);
    	return count;
    }
    
    //회원가입
    @RequestMapping(value="/joinPro.do", method=RequestMethod.POST)
    public String joinPro(HttpServletRequest request, RedirectAttributes send) {
    	UsersDTO dto = new UsersDTO();
    	String u_name = request.getParameter("u_name");
    	String u_hp=request.getParameter("u_hp1")+"-"+request.getParameter("u_hp2")+"-"+request.getParameter("u_hp3");
    	String u_mail=request.getParameter("u_mail1")+"-"+request.getParameter("u_mail4");
    	String u_address=request.getParameter("u_address1")+"-"+request.getParameter("u_address2")+"-"+request.getParameter("u_address3");
    	dto.setU_id(request.getParameter("u_ID"));
    	dto.setU_pw(request.getParameter("u_pw"));
    	dto.setU_name(u_name);
    	dto.setU_hp(u_hp);
    	dto.setU_mail(u_mail);
    	dto.setU_address(u_address);
    	
    	service.userinsertMethod(dto);
    	send.addFlashAttribute("u_name", u_name);
    	return "redirect:/joinsuccess.do?";
    	
    }
    
    //회원가입 완료
    @RequestMapping(value="/joinsuccess.do")
    public String joinsuccess() {
    	return "front_joinsuccess";
    }
    
    //아이디 찾기
    @RequestMapping(value="/findid.do")
    public String findid() {
    	return "front_find_id";
    }
    
    //아이디 찾기
    @RequestMapping(value="/findproid.do",method=RequestMethod.POST)
    public @ResponseBody HashMap<String, Object> findidpro(@RequestBody String data, HttpServletRequest request) throws ParseException {
    	JSONParser parser = new JSONParser();
    	JSONObject jobject = (JSONObject) parser.parse(data);
    	
    	String u_name = (String) jobject.get("u_name");
        String u_hp = (String) jobject.get("u_hp");
        
        UsersDTO dto  = new UsersDTO();
        dto.setU_name(u_name);
        dto.setU_hp(u_hp);
        
        HashMap<String, Object> has = new HashMap<String, Object>();
        String gg = service.findidMethod(dto);
        System.out.println(gg);
        has.put("u_id", service.findidMethod(dto));
        
        return has;
  
    }
    
    //비밀번호 찾기
    @RequestMapping(value="/findpw.do")
    public String findpw() {
    	return "front_find_pw";
    }
    
    //비밀번호 찾기
    @RequestMapping(value="findpropw.do", method=RequestMethod.POST)
    public @ResponseBody HashMap<String, Object> findpwpro(@RequestBody String data, HttpServletRequest request) throws ParseException {
    	JSONParser parser = new JSONParser();
    	JSONObject jobject = (JSONObject) parser.parse(data);
    	
    	String u_id = (String) jobject.get("u_id");
    	String u_name = (String) jobject.get("u_name");
        String u_hp = (String) jobject.get("u_hp");
        

        UsersDTO dto = new UsersDTO();
        dto.setU_id(u_id);
        dto.setU_name(u_name);
        dto.setU_hp(u_hp);
        
        HashMap<String, Object> hash = new HashMap<String, Object>();
        String pw = service.findpwMethod(dto);
        hash.put("u_pw", service.findpwMethod(dto));
        
        return hash;
    	
    }

}
