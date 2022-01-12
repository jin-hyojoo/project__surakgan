package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dao.InformationDAO;
import dto.Cart_ListDTO;
import dto.InformationDTO;
import dto.Information_CommentDTO;
import dto.Information_ImageDTO;
import dto.NoticeDTO;
import dto.Oder_ListDTO;
import dto.Oder_menuDTO;
import dto.QnaDTO;
import dto.UsersDTO;

public class InformationServiceImp implements InformationService{
	private InformationDAO dao;
	
	public InformationServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setDao(InformationDAO dao) {
		this.dao = dao;
	}

	@Override
	public InformationDTO foodDetailMethod(int i_no) {
		return dao.foodDetailMethod(i_no);
	}
	
	@Override
	public List<Information_ImageDTO> imageListMethod(int i_no) {
		return dao.imageListMethod(i_no);
	}

	@Override
	public List<Information_CommentDTO> commentListMethod(int i_no) {
		return dao.commentListMethod(i_no);
	}
	
	@Override
	public List<Information_CommentDTO> commentInsertMethod(Information_CommentDTO cdto) {
		dao.commentInsertMethod(cdto);
		return dao.commentListMethod(cdto.getI_no());
	}

	@Override
	public List<Information_CommentDTO> commentDeleteMethod(int ic_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Information_CommentDTO> commentUpdateMethod(Information_CommentDTO cdto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<InformationDTO> lunchboxMethod(int i_gubun) {
		return dao.lunchboxMethod(i_gubun);
	}
	
	@Override
	public List<InformationDTO> foodListMethod(HashMap<String, Object> map) {
		
		return dao.foodListMethod(map);
	}

	@Override
	public List<InformationDTO> foodSelectListMethod(HashMap<String, Object> map) {
		return dao.foodSelectListMethod(map);
	}

	@Override
	public List<InformationDTO> foodListMenuMethod(String c_type) {
		return dao.foodListMenuMethod(c_type);
	}

	@Override
	public InformationDTO foodtitleMethod(HashMap<String, Object> map) {
		return dao.foodtitleMethod(map);
	}

	@Override
	public int idCheckMethod(String u_id) {
		return dao.idcheckMethod(u_id);
	}

	@Override
	public int hpCheckMethod(String u_hp) {
		return dao.hpcheckMethod(u_hp);
	}

	@Override
	public void userinsertMethod(UsersDTO dto) {
		dao.usersInsertMethod(dto);
		
	}

	@Override
	public InformationDTO foodSelectBasketMethod(int i_no) {
		return dao.foodSelectBasketMethod(i_no);
	}
	@Override
	public List<InformationDTO> bestListMethod() {
		return dao.bestListMethod();
	}

	@Override
	public String findidMethod(UsersDTO dto) {
		return dao.findidMethod(dto);
	}

	@Override
	public String findpwMethod(UsersDTO dto) {
		return dao.findpwMethod(dto);
	}

	@Override
	public boolean loginCheckMethod(UsersDTO dto, HttpSession session) {
		dto.setU_state(0); //구분값이 0일때 로그인 가능 
		boolean result = dao.loginCheckMethod(dto);
		if(result) {//true일때 세션에 등록
			UsersDTO dto2 = loginInfoMethod(dto);
			
			//세션변수등록
			session.setAttribute("u_id", dto2.getU_id());
			session.setAttribute("u_no", dto2.getU_no());
			session.setAttribute("u_name", dto2.getU_name());
			session.setAttribute("u_grade", dto2.getU_grade());
			session.setMaxInactiveInterval(60*60);
		}
		return result;
	}

	@Override
	public UsersDTO loginInfoMethod(UsersDTO dto) {
		return dao.loginInfoMethod(dto);
	}

	@Override
	public void logoutMethod(HttpSession session) {
		session.invalidate();
		
	}

	@Override
	public void insertUserCartMethod(Cart_ListDTO dto) {
		System.out.println("dao: "+dto.getU_no()+" "+dto.getCl_menu()+" "+dto.getCl_img()+" "+dto.getCl_quantity()+" "+dto.getCl_totalprice());
		dao.insertUserCartMethod(dto);
		
	}

	@Override
	public void updateUserCartMethod(Cart_ListDTO dto) {
		System.out.println("update: "+dto.getCl_quantity()+" "+dto.getCl_totalprice());
		dao.updateUserCartMethod(dto);
	}

	@Override
	public List<Cart_ListDTO> listUserCartMethod(int u_no) {
		return dao.listUserCartMethod(u_no);
	}

	@Override
	public void deleteUserCartMethod(HashMap<String, Object> map) {
		dao.deleteUserCartMethod(map);
	}

	@Override
	public UsersDTO usersinfoMethod(String u_id) {
		return dao.usersinfoMethod(u_id);
	}

	@Override
	public void infoupdateMethod(UsersDTO dto) {
		dao.infoupdateMethod(dto);
		
	}

	@Override
	public void infodelMethod(int u_no) {
		dao.infodelMethod(u_no);
		
	}

	@Override
	public void insertMycartMethod(Cart_ListDTO dto) {
		dao.insertMycartMethod(dto);
		
	}

	@Override
	public List<Cart_ListDTO> cartSelectMethod() {
		return dao.cartSelectMethod();
	}

	@Override
	public void oderinsertMethod(Oder_ListDTO dto) {
		
		dao.oderInsertMethod(dto);	
	}

	@Override
	public List<Oder_ListDTO> oderSelectMethod(int u_no) {
		
		return dao.oderSelectMethod(u_no);
	}
	
	@Override
	public List<UsersDTO> userMethod() {
		
		return dao.userMethod();
	}

	@Override
	public void updateCartOrderMethod(HashMap<String, Object> map) {
		dao.updateCartOrderMethod(map);
		
	}

	@Override
	public List<QnaDTO> qnainfoMethod(int u_no) {
		return dao.qnainfoMethod(u_no);
	}

	@Override
	public QnaDTO myqnaviewMethod(int q_no) {
		return dao.myqnaviewMethod(q_no);
	}

	@Override
	public List<NoticeDTO> noticeListMethod() {
		return dao.noticeListMethod();
	}

	@Override
	public NoticeDTO mynoticeViewMethod(int n_no) {
		return dao.mynoticeViewMethod(n_no);
	}

	@Override
	public List<InformationDTO> newboxListMethod() {
		return dao.newboxListMethod();
	}

	@Override
	public List<InformationDTO> newsideListMethod() {
		return dao.newsideListMethod();
	}

	@Override
	public List<InformationDTO> bestListViewMethod() {
		return dao.bestListViewMethod();
	}

	@Override
	public void odermenuInsertMethod(Oder_menuDTO dto) {
		
		dao.odermenuInsertMethod(dto);
	}

	@Override
	public void cartDeleteMethod() {
		
		dao.cartDeleteMethod();
	}
}
