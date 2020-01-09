package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentLogDTO {
	private Timestamp dateis;
	private int newCom;
	private int delCom;
	public CommentLogDTO() {
		super();
	}
	public CommentLogDTO(Timestamp dateis, int newCom, int delCom) {
		super();
		this.dateis = dateis;
		this.newCom = newCom;
		this.delCom = delCom;
	}
	public Timestamp getDateis() {
		return dateis;
	}
	public void setDateis(Timestamp dateis) {
		this.dateis = dateis;
	}
	public int getNewCom() {
		return newCom;
	}
	public void setNewCom(int newCom) {
		this.newCom = newCom;
	}
	public int getDelCom() {
		return delCom;
	}
	public void setDelCom(int delCom) {
		this.delCom = delCom;
	}
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
		return sdf.format(this.dateis);
	}	
	
}
