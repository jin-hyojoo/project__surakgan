package dto;

public class Information_ImageDTO {
	private int ii_no;				//이미지번호
	private int i_no;				//음식번호
	private String ii_image;
	private int ii_state;
	
	public Information_ImageDTO() {
		
	}

	public int getIi_no() {
		return ii_no;
	}

	public void setIi_no(int ii_no) {
		this.ii_no = ii_no;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public String getIi_image() {
		return ii_image;
	}

	public void setIi_image(String ii_image) {
		this.ii_image = ii_image;
	}

	public int getIi_state() {
		return ii_state;
	}

	public void setIi_state(int ii_state) {
		this.ii_state = ii_state;
	}
	
}
