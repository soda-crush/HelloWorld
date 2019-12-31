package kh.hello.dto;

public class ScrapDTO {
	private int seq;
	private String category;
	private String categorySeq;
	public ScrapDTO() {
		super();
	}
	public ScrapDTO(int seq, String category, String categorySeq) {
		super();
		this.seq = seq;
		this.category = category;
		this.categorySeq = categorySeq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(String categorySeq) {
		this.categorySeq = categorySeq;
	}
}
