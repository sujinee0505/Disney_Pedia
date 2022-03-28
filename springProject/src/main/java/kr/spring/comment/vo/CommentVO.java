package kr.spring.comment.vo;

import java.sql.Date;

public class CommentVO {
	private int comment_num; //코멘트번호
	private String content; //코멘트 내용
	private Date reg_date; //등록날짜
	private Date modify_date; //수정날짜
	private int mem_num; //회원번호 
	
	
	public int getComent_num() {
		return comment_num;
	}
	public void setComent_num(int coment_num) {
		this.comment_num = coment_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	
	@Override
	public String toString() {
		return "CommentVO [comment_num=" + comment_num + ", content=" + content + ", reg_date=" + reg_date
				+ ", modify_date=" + modify_date + ", mem_num=" + mem_num + "]";
	}
}
