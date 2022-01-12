package dto;

import java.util.Date;

public class Cart_ListDTO {
	   private int cl_no;
	   private int u_no;
	   private int i_no;
	   private String cl_menu;
	   private String cl_img;
	   private int cl_quantity;
	   private int cl_price;
	   private int cl_totalprice;
	   private Date cl_day;
	   private String cl_when;
	   private Date cl_regdate;
	   private int cl_gubun;

	public Cart_ListDTO() {

	}
	
	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public int getCl_gubun() {
		return cl_gubun;
	}

	public void setCl_gubun(int cl_gubun) {
		this.cl_gubun = cl_gubun;
	}

	public Date getCl_day() {
		return cl_day;
	}

	public void setCl_day(Date cl_day) {
		this.cl_day = cl_day;
	}

	public String getCl_when() {
		return cl_when;
	}

	public void setCl_when(String cl_when) {
		this.cl_when = cl_when;
	}

	public int getCl_no() {
		return cl_no;
	}

	public void setCl_no(int cl_no) {
		this.cl_no = cl_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getCl_menu() {
		return cl_menu;
	}

	public void setCl_menu(String cl_menu) {
		this.cl_menu = cl_menu;
	}

	public String getCl_img() {
		return cl_img;
	}

	public void setCl_img(String cl_img) {
		this.cl_img = cl_img;
	}

	public int getCl_quantity() {
		return cl_quantity;
	}

	public void setCl_quantity(int cl_quantity) {
		this.cl_quantity = cl_quantity;
	}

	public int getCl_price() {
		return cl_price;
	}

	public void setCl_price(int cl_price) {
		this.cl_price = cl_price;
	}

	public int getCl_totalprice() {
		return cl_totalprice;
	}

	public void setCl_totalprice(int cl_totalprice) {
		this.cl_totalprice = cl_totalprice;
	}

	public Date getCl_regdate() {
		return cl_regdate;
	}

	public void setCl_regdate(Date cl_regdate) {
		this.cl_regdate = cl_regdate;
	}

}
