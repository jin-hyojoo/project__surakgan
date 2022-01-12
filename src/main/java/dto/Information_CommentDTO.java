package dto;

import java.util.Date;

public class Information_CommentDTO {
	private int ic_no;				//후기번호
	private int i_no;				//음식번호
	private String i_menu;			//음식명
	private int u_no;				//회원번호
	private String u_id;			//회원ID
	private int ic_star;			//별점
	private String ic_content;		//후기내용
	private Date ic_regdate;		//등록일
	private int ic_state;			//상태값(0:사용, 1:미사용)
	
	public Information_CommentDTO() {
		
	}

	public int getIc_no() {
		return ic_no;
	}

	public void setIc_no(int ic_no) {
		this.ic_no = ic_no;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}
	
	public String getI_menu() {
		return i_menu;
	}
	
	public void setI_menu(String i_menu) {
		this.i_menu = i_menu;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getIc_star() {
		return ic_star;
	}

	public void setIc_star(int ic_star) {
		this.ic_star = ic_star;
	}

	public String getIc_content() {
		return ic_content;
	}

	public void setIc_content(String ic_content) {
		this.ic_content = ic_content;
	}

	public Date getIc_regdate() {
		return ic_regdate;
	}

	public void setIc_regdate(Date ic_regdate) {
		this.ic_regdate = ic_regdate;
	}

	public int getIc_state() {
		return ic_state;
	}

	public void setIc_state(int ic_state) {
		this.ic_state = ic_state;
	}
	
}
