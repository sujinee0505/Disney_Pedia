package kr.spring.comment.vo;

import java.sql.Date;

public class CommentVO {
	private int comment_num; // 코멘트번호
	private String contents_type; // 컨텐츠 타입
	private int contents_num; // 컨텐츠 넘버
	private String content; // 코멘트 내용
	private Date reg_date; // 등록날짜
	private Date modify_date; // 수정날짜
	private int mem_num; // 회원 번호

	// 수진
	private int count;
	private double star;

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public String getContents_type() {
		return contents_type;
	}

	public void setContents_type(String contents_type) {
		this.contents_type = contents_type;
	}

	public int getContents_num() {
		return contents_num;
	}

	public void setContents_num(int contents_num) {
		this.contents_num = contents_num;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

}
