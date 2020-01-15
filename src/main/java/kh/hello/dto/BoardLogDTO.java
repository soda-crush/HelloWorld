package kh.hello.dto;

public class BoardLogDTO {
	private String dateis;
	private int newBoard;
	private int delBoard;
	public BoardLogDTO() {
		super();
	}
	public BoardLogDTO(String dateis, int newBoard, int delBoard) {
		super();
		this.dateis = dateis;
		this.newBoard = newBoard;
		this.delBoard = delBoard;
	}
	public String getDateis() {
		return dateis;
	}
	public void setDateis(String dateis) {
		this.dateis = dateis;
	}
	public int getNewBoard() {
		return newBoard-1;
	}
	public void setNewBoard(int newBoard) {
		this.newBoard = newBoard;
	}
	public int getDelBoard() {
		return delBoard-1;
	}
	public void setDelBoard(int delBoard) {
		this.delBoard = delBoard;
	}

	


	
	
	
}
