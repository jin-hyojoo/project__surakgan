package dao;

import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import dto.Cart_ListDTO;
import dto.InformationDTO;
import dto.Information_CommentDTO;
import dto.Information_ImageDTO;
import dto.NoticeDTO;
import dto.Oder_ListDTO;
import dto.Oder_menuDTO;
import dto.QnaDTO;
import dto.UsersDTO;

public class InformationDaoImp implements InformationDAO{
	private SqlSessionTemplate sqlSession;
	
	public InformationDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public InformationDTO foodDetailMethod(int i_no) {
		return sqlSession.selectOne("king.detail_list", i_no);
	}
	
	@Override
	public List<Information_ImageDTO> imageListMethod(int i_no) {
		return sqlSession.selectList("king.detail_img", i_no);
	}

	@Override
	public List<Information_CommentDTO> commentListMethod(int i_no) {
		return sqlSession.selectList("king.detail_comm", i_no);
	}

	@Override
	public void commentInsertMethod(Information_CommentDTO cdto) {
		/*System.out.println("i_no:"+cdto.getI_no());
		System.out.println("u_no:"+cdto.getU_no());
		System.out.println("ic_star:"+cdto.getIc_star());
		System.out.println("ic_content:"+cdto.getIc_content());*/
		sqlSession.insert("king.insert_comm", cdto);
	}

	@Override
	public void commentDeleteMethod(int ic_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void commentUpdateMethod(Information_CommentDTO cdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<InformationDTO> lunchboxMethod(int i_gubun) {
		return sqlSession.selectList("king.lunchbox_list", i_gubun);
	}
	
	@Override
	public List<InformationDTO> foodListMethod(HashMap<String, Object> map) {
		return sqlSession.selectList("king.listAll",map);
	}

	@Override
	public List<InformationDTO> foodSelectListMethod(HashMap<String, Object> map) {
		return sqlSession.selectList("king.list",map);
	}

	@Override
	public List<InformationDTO> foodListMenuMethod(String c_type) {
		return sqlSession.selectList("king.listmenu",c_type);
	}

	@Override
	public InformationDTO foodtitleMethod(HashMap<String, Object> map) {
		return sqlSession.selectOne("king.title",map);
	}

	@Override
	public int idcheckMethod(String u_id) {
		return sqlSession.selectOne("king.idcheck", u_id);
		
	}

	@Override
	public int hpcheckMethod(String u_hp) {
		return sqlSession.selectOne("king.hpcheck", u_hp);
	}

	@Override
	public void usersInsertMethod(UsersDTO dto) {
		sqlSession.insert("king.usersinsert", dto);
	}

	@Override
	public InformationDTO foodSelectBasketMethod(int i_no) {
		
		return sqlSession.selectOne("king.basket_list",i_no);
	}

	@Override
	public List<InformationDTO> bestListMethod() {
		return sqlSession.selectList("king.bestlist");
	}

	@Override
	public String findidMethod(UsersDTO dto) {
		return sqlSession.selectOne("king.find_id", dto);
	}

	@Override
	public String findpwMethod(UsersDTO dto) {
		return sqlSession.selectOne("king.find_pw",dto);
	}

	@Override
	public boolean loginCheckMethod(UsersDTO dto) {
		String name = sqlSession.selectOne("king.logincheck", dto);
		return(name==null)?false:true;
	}

	@Override
	public UsersDTO loginInfoMethod(UsersDTO dto) {
		return sqlSession.selectOne("king.logininfo", dto);
	}

	@Override
	public void logoutMethod(HttpSession session) {
	}

	@Override
	public UsersDTO usersinfoMethod(String u_id) {
		return sqlSession.selectOne("king.usersinfo", u_id);
	}

	@Override
	public void infoupdateMethod(UsersDTO dto) {
		sqlSession.update("king.infoupdate", dto);
		
	}

	@Override
	public void infodelMethod(int u_no) {
		sqlSession.update("king.infodel", u_no);
	}

	@Override
	public List<Cart_ListDTO> listUserCartMethod(int u_no) {
		
		return sqlSession.selectList("king.login_cart_list",u_no);
	}

	@Override
	public void insertUserCartMethod(Cart_ListDTO dto) {
		sqlSession.insert("king.login_cart_ins",dto);
		
	}

	@Override
	public void updateUserCartMethod(Cart_ListDTO dto) {
		sqlSession.update("king.login_cart_update",dto);	
	}

	@Override
	public void deleteUserCartMethod(HashMap<String, Object> map) {
		sqlSession.delete("king.login_cart_del",map);	
	}

	@Override
	public void insertMycartMethod(Cart_ListDTO dto) {
		System.out.println("dao :"+dto.getCl_totalprice());
		sqlSession.insert("king.my_cart_ins",dto);
		
	}

	@Override
	public List<Cart_ListDTO> cartSelectMethod() {
		
		return sqlSession.selectList("king.cartlist");
	}

	@Override
	public void oderInsertMethod(Oder_ListDTO dto) {
		
		sqlSession.insert("king.oderinsert", dto);	
	}

	@Override
	public List<Oder_ListDTO> oderSelectMethod(int u_no) {
		
		return sqlSession.selectList("king.oderlist",u_no);
	}
	@Override
	public List<UsersDTO> userMethod() {
		
		return sqlSession.selectList("king.user");
	}

	@Override
	public void updateCartOrderMethod(HashMap<String, Object> map) {
		System.out.println("dao :"+map.get("cl_no"));
		sqlSession.update("king.cart_order_update", map);
		
	}

	@Override
	public List<QnaDTO> qnainfoMethod(int u_no) {
		return sqlSession.selectList("king.qnainfo", u_no);
	}

	@Override
	public QnaDTO myqnaviewMethod(int q_no) {
		return sqlSession.selectOne("king.myqnaview", q_no);
	}

	@Override
	public List<InformationDTO> newboxListMethod() {
		return sqlSession.selectList("king.newboxlist");
	}

	@Override
	public List<InformationDTO> newsideListMethod() {
		return sqlSession.selectList("king.newsidelist");
	}

	@Override
	public List<NoticeDTO> noticeListMethod() {
		return sqlSession.selectList("king.noticelist");
	}

	@Override
	public NoticeDTO mynoticeViewMethod(int n_no) {
		return sqlSession.selectOne("king.indexnoticeview", n_no);
	}

	@Override
	public List<InformationDTO> bestListViewMethod() {
		return sqlSession.selectList("king.bestlist");
	}

	@Override
	public void odermenuInsertMethod(Oder_menuDTO dto) {
		
		sqlSession.insert("king.odermenuinsert", dto);	
	}

	@Override
	public void cartDeleteMethod() {
		
		sqlSession.delete("king.cartdelete");
	}
	
}
