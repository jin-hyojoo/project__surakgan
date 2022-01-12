package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.InformationDTO;
import dto.Information_CommentDTO;
import service.InformationService;
@Controller
public class FoodController {
	private InformationService service;
	private String path;
	
	public FoodController() {
		
	}
	
	public void setService(InformationService service) {
		this.service = service;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	@RequestMapping(value = "/foodListIndex.do")
	public ModelAndView foodindexform(String c_type) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("c_type", c_type);
		mav.setViewName("foodList");
		return mav;
	}
	
	@RequestMapping(value ="/foodList.do")
	public @ResponseBody List<InformationDTO> foodListMethod(String c_type, int more) {
		int startrow = 1 + more;
		int endrow = 12 + more;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_type", c_type);
		map.put("startrow", startrow);
		map.put("endrow",endrow);
		return service.foodListMethod(map);
	}
		
	@RequestMapping(value="foodSelectList.do")
	public @ResponseBody List<InformationDTO> foodSelectMethod(String c_type, int i_gubun, int more){
		int startrow = 1 + more;
		int endrow = 12 + more;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_type", c_type);
		map.put("i_gubun", i_gubun);
		map.put("startrow", startrow);
		map.put("endrow",endrow);
		return service.foodSelectListMethod(map);
	}
	
	@RequestMapping(value ="/foodMenuList.do")
	public @ResponseBody List<InformationDTO> foodMenuListMethod(String c_type) {
		return service.foodListMenuMethod(c_type);
	}

	@RequestMapping("/foodDetail.do")
	public ModelAndView productDetail(String i_no) {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(i_no);
		mav.addObject("InformationDTO", service.foodDetailMethod(no));
		mav.addObject("imgList", service.imageListMethod(no));
		mav.addObject("commList", service.commentListMethod(no));
		mav.setViewName("foodDetail");
		
		return mav;
	}
	
	@RequestMapping("/comment.do")
	public @ResponseBody List<Information_CommentDTO> commentMethod(int i_no, int u_no, int ic_star, String ic_content) {
		Information_CommentDTO cdto = new Information_CommentDTO();
		cdto.setI_no(i_no);
		cdto.setU_no(u_no);
		cdto.setIc_star(ic_star);
		cdto.setIc_content(ic_content);
		
		return service.commentInsertMethod(cdto);
	}
	
	@RequestMapping("/mylunchbox.do")
	public ModelAndView myLunchBox() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", service.lunchboxMethod(0));
		mav.setViewName("mylunchbox");
		return mav;
	}
	
	@RequestMapping("/mylunchboxList.do")
	public @ResponseBody List<InformationDTO> myLunchBoxList(int i_gubun){
		return service.lunchboxMethod(i_gubun);
	}
	
}
