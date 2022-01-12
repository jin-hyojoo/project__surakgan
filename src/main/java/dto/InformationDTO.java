package dto;

import java.util.Date;

public class InformationDTO {
	private String c_type;		//음식목록
	private String c_gubun;		//음식구분 (문자열)
	private int c_order;		//음식구분 (정수형)
	private String c_title;		//음식종류
	private int c_state;		//음식상태
	private int i_no;			//음식번호
	private int i_gubun;		//config
	private String i_menu;		//음식명
	private int i_price;		//가격
	private int sum_price;		//합계
	private int i_kcal;			//칼로리
	private String i_img;		//음식이미지
	private int cnt;			//수량
	private int i_hit;			//조회수
	private Date i_regdate;		//등록일
	private Date i_update;		//수정일
	private int i_state;		//상태
	
	public InformationDTO() {
		
	}
	
	public int getI_state() {
		return i_state;
	}

	public void setI_state(int i_state) {
		this.i_state = i_state;
	}

	public int getSum_price() {
		return sum_price;
	}

	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public int getI_gubun() {
		return i_gubun;
	}

	public void setI_gubun(int i_gubun) {
		this.i_gubun = i_gubun;
	}

	public String getI_menu() {
		return i_menu;
	}

	public void setI_menu(String i_menu) {
		this.i_menu = i_menu;
	}

	public int getI_price() {
		return i_price;
	}

	public void setI_price(int i_price) {
		this.i_price = i_price;
	}

	public int getI_kcal() {
		return i_kcal;
	}

	public void setI_kcal(int i_kcal) {
		this.i_kcal = i_kcal;
	}

	public String getI_img() {
		return i_img;
	}

	public void setI_img(String i_img) {
		this.i_img = i_img;
	}

	public int getI_hit() {
		return i_hit;
	}

	public void setI_hit(int i_hit) {
		this.i_hit = i_hit;
	}

	public Date getI_regdate() {
		return i_regdate;
	}

	public void setI_regdate(Date i_regdate) {
		this.i_regdate = i_regdate;
	}

	public Date getI_update() {
		return i_update;
	}

	public void setI_update(Date i_update) {
		this.i_update = i_update;
	}

	public String getC_type() {
		return c_type;
	}

	public void setC_type(String c_type) {
		this.c_type = c_type;
	}

	public String getC_gubun() {
		return c_gubun;
	}

	public void setC_gubun(String c_gubun) {
		this.c_gubun = c_gubun;
	}

	public int getC_order() {
		return c_order;
	}

	public void setC_order(int c_order) {
		this.c_order = c_order;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public int getC_state() {
		return c_state;
	}

	public void setC_state(int c_state) {
		this.c_state = c_state;
	}
	
	
}
