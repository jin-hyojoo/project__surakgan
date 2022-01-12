package dto;

import java.util.Date;

public class NoticeDTO {
	private int n_no, u_no, n_readcount, n_ref, n_step, n_level, n_state; 	
	private String n_title, n_content, n_writer, upload, n_head;
	private Date n_regdate;	

	public NoticeDTO() { }

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getN_readcount() {
		return n_readcount;
	}

	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}

	public int getN_ref() {
		return n_ref;
	}

	public void setN_ref(int n_ref) {
		this.n_ref = n_ref;
	}

	public int getN_step() {
		return n_step;
	}

	public void setN_step(int n_step) {
		this.n_step = n_step;
	}

	public int getN_level() {
		return n_level;
	}

	public void setN_level(int n_level) {
		this.n_level = n_level;
	}

	public int getN_state() {
		return n_state;
	}

	public void setN_state(int n_state) {
		this.n_state = n_state;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_writer() {
		return n_writer;
	}

	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public String getN_head() {
		return n_head;
	}

	public void setN_head(String n_head) {
		this.n_head = n_head;
	}

	public Date getN_regdate() {
		return n_regdate;
	}

	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	
	
}//end class
