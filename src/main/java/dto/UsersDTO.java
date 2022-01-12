package dto;

import java.util.Date;

public class UsersDTO {

	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_mail;
	private String u_hp;
	private Date u_regdate;
	private Date u_update;
	private String u_address;
	private int u_grade;
	private int u_state;
	
	public UsersDTO() {
		
	}
	
	public int getU_grade() {
		return u_grade;
	}

	public void setU_grade(int u_grade) {
		this.u_grade = u_grade;
	}

	public int getU_state() {
		return u_state;
	}

	public void setU_state(int u_state) {
		this.u_state = u_state;
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

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_mail() {
		return u_mail;
	}

	public void setU_mail(String u_mail) {
		this.u_mail = u_mail;
	}

	public String getU_hp() {
		return u_hp;
	}

	public void setU_hp(String u_hp) {
		this.u_hp = u_hp;
	}

	public Date getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}

	public Date getU_update() {
		return u_update;
	}

	public void setU_update(Date u_update) {
		this.u_update = u_update;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	
	
	
}
