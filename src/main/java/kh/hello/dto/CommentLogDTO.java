package kh.hello.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentLogDTO {
	private String dateis;
	private int newCom;
	private int delCom;
	public CommentLogDTO() {
		super();
	}
	public CommentLogDTO(String dateis, int newCom, int delCom) {
		super();
		this.dateis = dateis;
		this.newCom = newCom;
		this.delCom = delCom;
	}
	public String getDateis() {
		return dateis;
	}
	public void setDateis(String dateis) {
		this.dateis = dateis;
	}
	public int getNewCom() {
		return newCom-1;
	}
	public void setNewCom(int newCom) {
		this.newCom = newCom;
	}
	public int getDelCom() {
		return delCom-1;
	}
	public void setDelCom(int delCom) {
		this.delCom = delCom;
	}
		

	
}
