package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardLogDTO {
	private Timestamp dateis;
	private int newBoard;
	private int delBoard;
	public BoardLogDTO() {
		super();
	}
	public BoardLogDTO(Timestamp dateis, int newBoard, int delBoard) {
		super();
		this.dateis = dateis;
		this.newBoard = newBoard;
		this.delBoard = delBoard;
	}
	public Timestamp getDateis() {
		return dateis;
	}
	public void setDateis(Timestamp dateis) {
		this.dateis = dateis;
	}
	public int getNewBoard() {
		return newBoard;
	}
	public void setNewBoard(int newBoard) {
		this.newBoard = newBoard;
	}
	public int getDelBoard() {
		return delBoard;
	}
	public void setDelBoard(int delBoard) {
		this.delBoard = delBoard;
	}
	
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
		return sdf.format(this.dateis);
	}

	
	
	
}
