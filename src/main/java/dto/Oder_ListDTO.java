package dto;

import java.util.Date;


public class Oder_ListDTO {
	
	private int o_no;
	private int u_no;
	private Date o_date;
	private int o_total;
	private int o_state;
	private String o_bank;
	private String o_name;
	
	public Oder_ListDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public int getO_total() {
		return o_total;
	}

	public void setO_total(int o_total) {
		this.o_total = o_total;
	}

	public int getO_state() {
		return o_state;
	}

	public void setO_state(int o_state) {
		this.o_state = o_state;
	}

	public String getO_bank() {
		return o_bank;
	}

	public void setO_bank(String o_bank) {
		this.o_bank = o_bank;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	
	
}
