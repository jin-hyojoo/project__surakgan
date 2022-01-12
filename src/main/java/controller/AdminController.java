package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dto.InformationDTO;
import dto.Information_ImageDTO;
import dto.OderDTO;
import dto.PageDTO;
import service.AdminService;
import service.MypageService;

@Controller
public class AdminController {
	private AdminService service;
	private MypageService service2;
	
	private String path;
	
	
	public AdminController() {
		
	}
	
	public void setService(AdminService service) {
		this.service = service;
	}
	public void setService2(MypageService service2) {
		this.service2 = service2;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	@RequestMapping("/admin.do")
	public ModelAndView adminForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH)+1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("u_no", session.getAttribute("u_no"));
		map.put("month", month);
		List<OderDTO> orderList = service2.myorderList(map);
		mav.addObject("orderList", orderList);
		mav.setViewName("back_index");
		return mav;
	}
	
	@RequestMapping("/adminUserList.do")
	public @ResponseBody Map<String, Object> userList(String pageNum, String searchKey, String searchWord) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchKey", searchKey);
		param.put("searchWord", searchWord);
		int currentPage = Integer.parseInt(pageNum);
		int cnt = service.totalUserList(param);
		Map<String, Object> map = new HashMap<String, Object>();
		if (cnt >= 0) {
			PageDTO pdto = new PageDTO(currentPage, cnt, searchKey, searchWord);
			map.put("gubun", "userList");
			map.put("pdto", pdto);
			map.put("alist", service.userList(pdto));
		}
		
		return map;
	}

	@RequestMapping("/adminProductList.do")
	public @ResponseBody Map<String, Object> productList(String pageNum, String searchKey, String searchWord) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchKey", searchKey);
		param.put("searchWord", searchWord);
		System.out.println("pageNum:"+pageNum);
		int currentPage = Integer.parseInt(pageNum);
		int cnt = service.totalProductList(param);
		Map<String, Object> map = new HashMap<String, Object>();
		if (cnt >= 0) {
			PageDTO pdto = new PageDTO(currentPage, cnt, searchKey, searchWord);
			map.put("gubun", "productList");
			map.put("pdto", pdto);
			map.put("alist", service.productList(pdto));
		}
			
		
		return map;
	}
	
	@RequestMapping("/adminQnaList.do")
	public @ResponseBody Map<String, Object> qnaList(String pageNum, String searchKey, String searchWord, HttpServletRequest request) {
		int currentPage;
//		String head=request.getParameter("qhead");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchKey", searchKey);
		param.put("searchWord", searchWord);
//		param.put("head", head);
		
//		if(head!=null) 
//			currentPage=Integer.parseInt(request.getParameter("pagenum"));
//		else
			currentPage = Integer.parseInt(pageNum);
		
		int cnt = service.totalQnaList(param);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (cnt >= 0) {
			PageDTO pdto = new PageDTO(currentPage, cnt, searchKey, searchWord/*, head*/);
			map.put("gubun", "qnaList");
			map.put("pdto", pdto);
			map.put("alist", service.qnaList(pdto));
		}
		 
		return map; 
	}
	
	@RequestMapping("/adminNoticeList.do")
	public @ResponseBody Map<String, Object> noticeList(String pageNum, String searchKey, String searchWord, String nhead) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchKey", searchKey);
		param.put("searchWord", searchWord);
		param.put("nhead", nhead);
		int currentPage = Integer.parseInt(pageNum);
		int cnt = service.totalNoticeList(param);
		System.out.println("notice:"+cnt);
		System.out.println("nhead:"+nhead);
		Map<String, Object> map = new HashMap<String, Object>();
		if (cnt >= 0) {
			PageDTO pdto = new PageDTO(currentPage, cnt, searchKey, searchWord, nhead);
			map.put("gubun", "noticeList");
			map.put("pdto", pdto);
			map.put("alist", service.noticeList(pdto));
		}
		
		return map;
	}
	
	@RequestMapping("/qnaHeadList.do")
	public @ResponseBody Map<String, Object> qnaHeadList(String pageNum, String searchKey, String searchWord, String head) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchKey", searchKey);
		param.put("searchWord", searchWord);
		param.put("head", head);
		
		System.out.println(head);
		
		int currentPage = Integer.parseInt(pageNum);
		int cnt = service.totalQnaList(param);
		
		System.out.println("해당 말머리의 게시글 카운트 갯수:"+cnt);
		System.out.println("질문과답변 말머리:"+head);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (cnt >= 0) {
			PageDTO pdto = new PageDTO(currentPage, cnt, searchKey, searchWord, head);
			map.put("gubun", "qnaHeadList");
			map.put("pdto", pdto);
			map.put("alist", service.qnaList(pdto));
		}
		
		return map;
	}
	
	
	@RequestMapping("/noticeHeadList.do")
	public @ResponseBody Map<String, Object> noticeHeadList(String pageNum, String searchKey, String searchWord, String head) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("searchKey", searchKey);
		param.put("searchWord", searchWord);
		param.put("head", head);
		
		int currentPage = Integer.parseInt(pageNum);
		int cnt = service.totalNoticeList(param);

		System.out.println("해당 말머리의 게시글 카운트 갯수:"+cnt);
		System.out.println("공지 말머리:"+head);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (cnt >= 0) {
			PageDTO pdto = new PageDTO(currentPage, cnt, searchKey, searchWord, head);
			map.put("gubun", "noticeHeadList");
			map.put("pdto", pdto);
			map.put("alist", service.noticeList(pdto));
		}
		
		return map;
	}
	
	@RequestMapping("/userUptGrade.do")
	public @ResponseBody String updateGrade(int no, int grade) {
		service.updateGrade(no, grade);
		return "성공";
	}
	
	private List<Information_ImageDTO> insertImgList(int i_no, int gubun, MultipartFile[] fileList){
		List<Information_ImageDTO> list = new ArrayList<Information_ImageDTO>();
		for(MultipartFile file: fileList) {
			String fileName = file.getOriginalFilename();
			
			// 중복파일명을 처리하기 위해 난수 발생
            UUID random = UUID.randomUUID();
            
            String saveDirectory=path;
            File fe = new File(saveDirectory);
            if (!fe.exists())
				fe.mkdir();
            
            File ff = new File(saveDirectory, random + "_" + fileName);
            
        	try {
				FileCopyUtils.copy(file.getInputStream(), 						
				        new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
        	
        	Information_ImageDTO dto = new Information_ImageDTO();
        	dto.setI_no(i_no);
        	dto.setIi_image(random + "_" + fileName);
        	dto.setIi_state(gubun);
        	list.add(dto);
		}//end for()
		
		return list;
	}
	
	@RequestMapping("/productInsert.do")
	public @ResponseBody String productInsert(MultipartHttpServletRequest req, InformationDTO dto, 
			@RequestParam("main_img") MultipartFile main_img,
			@RequestParam("subList") MultipartFile[] subList,
			@RequestParam("ctList") MultipartFile[] ctList) { 
		List<Information_ImageDTO>list = new ArrayList<Information_ImageDTO>();
		Information_ImageDTO idto = new Information_ImageDTO();
		if (main_img!=null ) {
			String fileName = main_img.getOriginalFilename();

			UUID random = UUID.randomUUID();
            
            String saveDirectory=path;
            File fe = new File(saveDirectory);
            if (!fe.exists())
				fe.mkdir();
            
            File ff = new File(saveDirectory, random + "_" + fileName);
            
        	try {
				FileCopyUtils.copy(main_img.getInputStream(), 						
				        new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
            
        	dto.setI_img(random + "_" + fileName);
        	idto.setIi_image(random + "_" + fileName);
		}
		int i_no = service.insertInfo(dto);
		idto.setI_no(i_no);
		idto.setIi_state(0);
		list.add(idto);
		if(subList.length>0) {
			list.addAll(insertImgList(i_no, 0, subList));
		}
		if(ctList.length>0) {
			list.addAll(insertImgList(i_no, 1, ctList));
		}
		
		service.insertInfoImg(list);
		return "성공";
	}
	
	@RequestMapping("/productDel.do") 
	public @ResponseBody String productDel(int no, int state) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("i_no", no);
		if(state==0) {
			map.put("i_state", 1);
		}else if(state==1) {
			map.put("i_state", 0);
		}
		service.uptInfoState(map);
		return "성공";
	}
	
	@RequestMapping("/lunchboxOrderList.do")
	public @ResponseBody List<String> lunchboxList(int on_no){
		return service.lunchboxList(on_no);
	}
	@RequestMapping("/lunchboxStateUpt.do")
	public @ResponseBody String lunchboxUpt(int on_no){
		service.lunchboxUpt(on_no);
		return "성공";
	}
	@RequestMapping("/depositChk.do")
	public @ResponseBody OderDTO depositChk(int o_no){
		return service.depositChk(o_no);
	}
	
	
}
