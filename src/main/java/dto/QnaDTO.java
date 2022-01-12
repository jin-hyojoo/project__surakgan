package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaDTO {
	//Qna번호,회원번호, 조회수, 그룹번호, 그룹순서, 그룹 들여쓰기, 상태 0(사용) 1(미사용), 테이블의 파일첨부 처리해주는 멤버변수
	//제목, 내용, 작성자 (회원번호로 값 받아옴), 업로드, 말머리
	//등록일
	//폼에서 파일첨부를 받아 처리해주는 멤버변수
	private int q_no, u_no, q_readcount, q_ref, q_step, q_level, q_state; 	
	private String q_title, q_content, u_name, upload, q_head;
	private Date q_regdate;	

	
	public QnaDTO() { }

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public int getQ_readcount() {
		return q_readcount;
	}

	public void setQ_readcount(int q_readcount) {
		this.q_readcount = q_readcount;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
		
	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}
	
	
	public String getQ_head() {
		return q_head;
	}

	public void setQ_head(String q_head) {
		this.q_head = q_head;
	}

	public int getQ_ref() {
		return q_ref;
	}

	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}

	public int getQ_step() {
		return q_step;
	}

	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}

	public int getQ_level() {
		return q_level;
	}

	public void setQ_level(int q_level) {
		this.q_level = q_level;
	}

	public Date getQ_regdate() {
		return q_regdate;
	}

	public void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}

	public int getQ_state() {
		return q_state;
	}

	public void setQ_state(int q_state) {
		this.q_state = q_state;
	}


}//end class
