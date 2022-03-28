package kr.spring.comment.vo;

public class CommentLikeVO {
	private int commentlike_num; //코멘트좋아요번호
	private int comment_num; //코멘트번호
	private int mem_num; //회원번호
	
	
	public int getComentlike_num() {
		return commentlike_num;
	}
	public void setComentlike_num(int comentlike_num) {
		this.commentlike_num = comentlike_num;
	}
	public int getComent_num() {
		return comment_num;
	}
	public void setComent_num(int coment_num) {
		this.comment_num = coment_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	
	@Override
	public String toString() {
		return "CommentLikeVO [commentlike_num=" + commentlike_num + ", comment_num=" + comment_num + ", mem_num=" + mem_num
				+ "]";
	}
}
