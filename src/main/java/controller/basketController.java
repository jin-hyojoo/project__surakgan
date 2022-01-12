package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.Cart_ListDTO;
import dto.InformationDTO;
import dto.Oder_ListDTO;
import dto.Oder_menuDTO;
import service.InformationService;

@Controller
public class basketController {
	private InformationService service;
	private int cnt = 1;
	
	public basketController() {
		
	}

	public void setService(InformationService service) {
		this.service = service;
	}
	@RequestMapping(value="/cartform.do")
	public String nonBasket() {
		return "cart_list";
	}
	
	@RequestMapping(value="/membercartform.do")
	public String memberBasket(HttpSession session, HttpServletRequest request) {
		ArrayList<Cart_ListDTO> list = null;
		List<Cart_ListDTO> memlist = null;
		Cart_ListDTO cdto = null;
		int u_no = (int) session.getAttribute("u_no");

		if (session.getAttribute("cart_list") != null) {
			list = (ArrayList<Cart_ListDTO>) session.getAttribute("cart_list");

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
				System.out.println("로그인 할때  데이터 :" + clist.getCl_menu() + clist.getCl_totalprice() +"::"+clist.getI_no());

				if (memlist.size() == 0) {
					System.out.println("db 데이터가 아무것도 없네?");
					System.out.println("i_no ::"+cdto.getI_no());
					service.insertUserCartMethod(cdto);
				} else if (memlist.size() != 0) {
					boolean isOk = false;
					for (int i = 0; i < memlist.size(); i++) {
						if (cdto.getCl_menu().equals(memlist.get(i).getCl_menu())) {
							System.out.println("중복된게 있네?"+ cdto.getI_no());
							cdto.setCl_quantity(memlist.get(i).getCl_quantity() + cdto.getCl_quantity());
							cdto.setCl_totalprice(memlist.get(i).getCl_totalprice() + cdto.getCl_totalprice());
							service.updateUserCartMethod(cdto);
							isOk = false;
							break;
						} else if (!cdto.getCl_menu().equals(memlist.get(i).getCl_menu())) {
							System.out.println("중복된거 없을때 : " + memlist.get(i).getCl_menu() +"::"+memlist.get(i).getI_no());
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

		session.removeAttribute("cart_list");
		System.out.println("목록 출력 :" + u_no);
		memlist = service.listUserCartMethod(u_no);
		request.setAttribute("list", memlist);

		return "mem_cart_list";
	}	

	@RequestMapping(value="/myfood.do", method= RequestMethod.POST)
	public @ResponseBody boolean minefood(@RequestBody String cart, HttpSession session) throws ParseException, java.text.ParseException {
		int u_no = (int)session.getAttribute("u_no");
		JSONParser parser = new JSONParser();
		JSONObject JSON =(JSONObject) parser.parse(cart);
		String cl_menu = (String) JSON.get("content");
		String price = (String) JSON.get("price");
		int cl_totalprice = Integer.parseInt(price);
		String day = (String) JSON.get("day");
		Date cl_day = new SimpleDateFormat("yyyy-MM-dd").parse(day);
		String cl_when = (String) JSON.get("when");
		System.out.println(cl_day +" "+ cl_menu+" "+cl_totalprice+" "+ cl_when);
		Cart_ListDTO dto = new Cart_ListDTO();
		dto.setU_no(u_no);
		dto.setCl_menu(cl_menu);
		dto.setCl_totalprice(cl_totalprice);
		dto.setCl_day(cl_day);
		dto.setCl_when(cl_when);
		service.insertMycartMethod(dto);
		
		return true;
	}
	

	@RequestMapping(value="/cartsession.do", method = RequestMethod.POST)
	public @ResponseBody Cart_ListDTO basketCookie(@RequestBody String cart, HttpServletResponse response ,HttpSession session) throws ParseException, IOException {
		JSONParser parser = new JSONParser();
		JSONObject JSON = (JSONObject) parser.parse(cart);
		String i_menu = (String) JSON.get("i_menu");
		String i_price = (String) JSON.get("i_price");
		String i_img = (String) JSON.get("i_img");
		String foodcnt = (String) JSON.get("foodcnt");
		String gubun =  (String) JSON.get("i_gubun");
		String no = (String)JSON.get("i_no");
		int i_no = Integer.parseInt(no);
		int i_gubun = Integer.parseInt(gubun);
		
		ArrayList<Cart_ListDTO> list = (ArrayList<Cart_ListDTO>) session.getAttribute("cart_list");		

		Cart_ListDTO dto = new Cart_ListDTO();

		dto.setCl_menu(i_menu);
		dto.setCl_price(Integer.parseInt(i_price));
		dto.setCl_img(i_img);
		dto.setCl_quantity(Integer.parseInt(foodcnt));
		dto.setCl_totalprice(Integer.parseInt(i_price)*Integer.parseInt(foodcnt));
		dto.setCl_gubun(i_gubun);
		dto.setI_no(i_no);
		if(list == null) {
			list = new ArrayList<Cart_ListDTO>();
		}
		
		session.setAttribute("cart_list", list);
		session.setMaxInactiveInterval(60*60);
		
		boolean isOk = true;
		for(int i = 0; i<list.size();i++) {
			if(list.get(i).getCl_menu().equals(dto.getCl_menu())) {
				dto.setCl_quantity(list.get(i).getCl_quantity()+dto.getCl_quantity());
				dto.setCl_totalprice(list.get(i).getCl_totalprice()+dto.getCl_totalprice());
				list.set(i, dto);
				isOk = false;
				break;
			}
		}
		if(isOk) {
		list.add(dto);
		}
		return dto;	
	}
	
	@RequestMapping(value="/cartdel.do")
	public @ResponseBody int cartdel(int itemNo,HttpSession session) {
		ArrayList<Cart_ListDTO> list = (ArrayList<Cart_ListDTO>) session.getAttribute("cart_list");
		list.remove(itemNo);
		return itemNo;
	}
	
	@RequestMapping(value="/cartselectdel.do")
	public @ResponseBody String[] cartselectdel(HttpServletRequest request,HttpSession session) throws ParseException {
		ArrayList<Cart_ListDTO> list = (ArrayList<Cart_ListDTO>) session.getAttribute("cart_list");
		String []item= request.getParameterValues("itemNo");
		
			for(int x=item.length-1; x>=0;x--){
				int i = Integer.parseInt(item[x]);
				list.remove(i);
			}
		return item;
	}

	@RequestMapping(value="/cartcnt.do")
	public @ResponseBody int cartcnt(int cart_cnt, int cnt, int price, HttpSession session) {
		ArrayList<Cart_ListDTO> list = (ArrayList<Cart_ListDTO>) session.getAttribute("cart_list");
		list.get(cnt).setCl_quantity(cart_cnt);
		list.get(cnt).setCl_totalprice(cart_cnt*price);
		return cart_cnt*price;
	}
	
	@RequestMapping(value="/memcartcnt.do")
	public @ResponseBody int memcartcnt(int cart_cnt, int cnt, int price,String menu, HttpSession session) {
		int u_no = (int)session.getAttribute("u_no");
		Cart_ListDTO dto = new Cart_ListDTO();
		
		dto.setU_no(u_no);
		dto.setCl_quantity(cart_cnt);
		dto.setCl_totalprice(cart_cnt*price);
		dto.setCl_menu(menu);
	
		service.updateUserCartMethod(dto);
		return cart_cnt*price;
	}
	
	@RequestMapping(value="/memcartdel.do")
	public @ResponseBody int memcartdel(int itemNo,String cl_menu,String menu,HttpSession session) {
		int u_no = (int)session.getAttribute("u_no");
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("u_no", u_no);
		map.put("cl_menu",menu);
		service.deleteUserCartMethod(map);
		return itemNo;
	}
	
	@RequestMapping(value="/memcartselectdel.do", method=RequestMethod.POST)
	public @ResponseBody int memcartselectdel(HttpServletRequest request,HttpSession session) throws ParseException {
		int u_no = (int)session.getAttribute("u_no");
		String []item= request.getParameterValues("cl_manu");
		
			for(int x=item.length-1; x>=0;x--){
				HashMap<String, Object> map = new HashMap<String, Object>();
				String cl_menu = item[x];
				
				map.put("u_no", u_no);
				map.put("cl_menu", cl_menu);
				
				service.deleteUserCartMethod(map);
			}
			return u_no;
	}
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.POST)
	public @ResponseBody String foodindexPro(@RequestBody String cart, HttpServletRequest request, HttpSession session)
			throws java.text.ParseException {
		////////////////////////////////////////////////////////////////////////
		String day[] = request.getParameterValues("order_day");
		String when[] = request.getParameterValues("order_time");
		String no[] = request.getParameterValues("cl_no");

		int u_no = (int) session.getAttribute("u_no");
		int total = Integer.parseInt(request.getParameter("total"));

		Date cl_day = new Date();
		String cl_when = null;
		int cl_no = 0;

		SimpleDateFormat transDate = new SimpleDateFormat("yyyy-MM-dd");

		HashMap<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < day.length; i++) {
			cl_day = transDate.parse(day[i]);
			cl_when = when[i];
			cl_no = Integer.parseInt(no[i]);
			
			System.out.println("cl_day :"+cl_day +"::"+"cl_when :"+cl_when);

			map.put("cl_day", cl_day);
			map.put("cl_when", cl_when);
			map.put("cl_no", cl_no);
			map.put("u_no", u_no);

			service.updateCartOrderMethod(map);
		}
		////////////////////////////////////////////////////////////////////////
		return "sssss";
	}
	
	@RequestMapping(value = "/payment.do", method=RequestMethod.GET)
	public ModelAndView foodindexform() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", service.userMethod());
		mav.addObject("cartlist", service.cartSelectMethod());
		List<Cart_ListDTO> list = service.cartSelectMethod();
/*		System.out.println(list.get(1).getCl_day());
		
		Date[] from = null; list.get(1).getCl_day();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(from);
		
		for(int i=0;i<list.size();i++) {
			from[i] = list.get(i).getCl_day();
		}
		System.out.println("to"+to);
		mav.addObject("cl_day", from);*/
		mav.setViewName("payment");
		return mav;
	}
	
	@RequestMapping(value="/paymentCompleted.do", method=RequestMethod.POST)
	   public ModelAndView PaymentCompleted(HttpServletRequest request, HttpSession session) throws java.text.ParseException {
	      
	      ArrayList<Oder_ListDTO> olist;
	      ArrayList<Cart_ListDTO> list = null;
	      Oder_menuDTO mdto = null;
	      
	      Oder_ListDTO dto = new Oder_ListDTO();
	      ModelAndView mav = new ModelAndView();
	      dto.setU_no((int) session.getAttribute("u_no"));
	      dto.setO_total(Integer.parseInt(request.getParameter("total_price")));
	      dto.setO_bank(request.getParameter("o_bank"));
	      dto.setO_name(request.getParameter("first_menu"));
	      
	      Date from = new Date(System.currentTimeMillis());
	      SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
	      String to = transFormat.format(from);
	      
	      SimpleDateFormat trans = new SimpleDateFormat("yyyyMMdd");
	      Date date = trans.parse(to);
	      
	      dto.setO_date(date);
	      service.oderinsertMethod(dto);
	      
	      session.removeAttribute("cart_list");
	      
	      //olist = (ArrayList<Oder_ListDTO>) service.oderSelectMethod((int) session.getAttribute("u_no"));
	      list = (ArrayList<Cart_ListDTO>) service.cartSelectMethod();

	      for (Cart_ListDTO clist : list) {
	         mdto = new Oder_menuDTO();
	         mdto.setI_no(clist.getCl_no());
	         mdto.setI_name(clist.getCl_menu());
	         mdto.setO_no(cnt);
	         mdto.setOn_cnt(clist.getCl_quantity());
	         mdto.setOn_getdate(clist.getCl_day());
	         mdto.setOn_time(clist.getCl_when());
	         service.odermenuInsertMethod(mdto);
	      }
	      cnt++;
	      
	      service.cartDeleteMethod();
	      mav.addObject("date", to);
	      mav.addObject("oderlist",dto);
	      mav.setViewName("paymentCompleted");
	      return mav;
	   }

}
