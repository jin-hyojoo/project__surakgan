package dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import dto.Cart_ListDTO;
import dto.InformationDTO;
import dto.Information_CommentDTO;
import dto.Information_ImageDTO;
import dto.NoticeDTO;
import dto.Oder_ListDTO;
import dto.Oder_menuDTO;
import dto.QnaDTO;
import dto.UsersDTO;

public interface InformationDAO {
	public List<InformationDTO> bestListMethod();//최고의 수락간 슬라이더
	public List<InformationDTO> newboxListMethod();//새로운 도시락 슬라이더
	public List<InformationDTO> newsideListMethod();//새로운 사이드 슬라이더
	public List<NoticeDTO> noticeListMethod();//공지사항 슬라이더
	public NoticeDTO mynoticeViewMethod(int n_no);//공지사항 뷰창으로 넘어가기
	public List<InformationDTO> bestListViewMethod();
	
	public InformationDTO foodtitleMethod(HashMap<String, Object> map); //음식제목
	public List<InformationDTO> foodListMenuMethod(String c_type); //음식목록메뉴
	public List<InformationDTO> foodListMethod(HashMap<String, Object> map); //음식 전체목록 조회
	public List<InformationDTO> foodSelectListMethod(HashMap<String, Object> map); //음식선택목록조회
	
	public InformationDTO foodDetailMethod(int i_no);	//음식상세정보조회
	public List<Information_ImageDTO> imageListMethod(int i_no);	//음식이미지조회
	public List<Information_CommentDTO> commentListMethod(int i_no);	//음식후기조회
	public void commentInsertMethod(Information_CommentDTO cdto);	//음식후기삽입
	public void commentDeleteMethod(int ic_no);	//음식후기삭제
	public void commentUpdateMethod(Information_CommentDTO cdto);	//음식후기수정

	public List<InformationDTO> lunchboxMethod(int i_gubun);	//나만의도시락 메뉴조회
	
	public InformationDTO foodSelectBasketMethod(int i_no); 	//세션 장바구니
	public List<Cart_ListDTO> listUserCartMethod(int u_no);	//회원 장바구니 목록
	public void insertUserCartMethod(Cart_ListDTO dto);		//회원 장바구니 
	public void updateUserCartMethod(Cart_ListDTO dto);			//회원 장바구니 추가
	public void deleteUserCartMethod(HashMap<String, Object> map);	//회원 장바구니 삭제
	public void insertMycartMethod(Cart_ListDTO dto);		//나만의 도시락 추가
	public void updateCartOrderMethod(HashMap<String, Object> map); //장바구니 주문
    
	public List<Cart_ListDTO> cartSelectMethod();//장바구니 출력
	public void oderInsertMethod(Oder_ListDTO dto); //주문내역 저장
	public List<Oder_ListDTO> oderSelectMethod(int u_no); 
	public void odermenuInsertMethod(Oder_menuDTO dto);//주문상품 저장
	public void cartDeleteMethod();	//장바구니 비우기
	
	public int idcheckMethod(String u_id);//아이디 중복확인
    public int hpcheckMethod(String u_hp);//전화번호 중복확인
    public void usersInsertMethod(UsersDTO dto);//회원가입
    public String findidMethod(UsersDTO dto);//아이디 찾기
    public String findpwMethod(UsersDTO dto);//비밀번호 찾기
    
    public boolean loginCheckMethod(UsersDTO dto);//로그인
	public UsersDTO loginInfoMethod(UsersDTO dto);//로그인 정보
	public void logoutMethod(HttpSession session);//회원로그인
	public List<UsersDTO> userMethod();//유저 정보
	

	public UsersDTO usersinfoMethod(String u_id);//회원정보 가져오기
	public void infoupdateMethod(UsersDTO dto);//회원 정보 수정
	public List<QnaDTO> qnainfoMethod(int u_no);//마이페이지 나의 질문
	public QnaDTO myqnaviewMethod(int q_no);//마이페이지 뷰창으로 넘어가기
	
	public void infodelMethod(int u_no);//회원 탈퇴
}
