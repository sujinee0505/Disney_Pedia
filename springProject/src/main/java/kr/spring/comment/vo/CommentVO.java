package kr.spring.comment.vo;

import kr.spring.util.DurationFromNow;

public class CommentVO {
	private int comment_num; // 코멘트번호
	private String contents_type; // 컨텐츠 타입
	private int contents_num; // 컨텐츠 넘버
	private String content; // 코멘트 내용
	private String reg_date; // 등록날짜
	private String modify_date; // 수정날짜
	private int mem_num; // 회원 번호;

	// 수진
	private int count;
	private double star;
	private int countLike;
	private int countReply;
	private int checkCmtLike;

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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = DurationFromNow.getTimeDiffLabel(reg_date);
	}

	public String getModify_date() {
		return modify_date;
	}

	public void setModify_date(String modify_date) {
		this.modify_date = DurationFromNow.getTimeDiffLabel(modify_date);
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

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	public int getCountReply() {
		return countReply;
	}

	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}

	public int getCheckCmtLike() {
		return checkCmtLike;
	}

	public void setCheckCmtLike(int checkCmtLike) {
		this.checkCmtLike = checkCmtLike;
	}

}
