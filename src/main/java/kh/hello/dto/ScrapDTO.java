package kh.hello.dto;

public class ScrapDTO {
	private int seq;
	private String id;
	private String category;
	private int categorySeq;
	public ScrapDTO() {
		super();
	}
	public ScrapDTO(int seq, String id, String category, int categorySeq) {
		super();
		this.seq = seq;
		this.id = id;
		this.category = category;
		this.categorySeq = categorySeq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}
	
	
}
