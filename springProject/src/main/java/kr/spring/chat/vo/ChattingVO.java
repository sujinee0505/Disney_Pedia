package kr.spring.chat.vo;

import java.sql.Date;

public class ChattingVO {
	
	private int dchat_num; //채팅방 번호
	private int chatroom_num; //채팅 개설 게시글 번호
	private int mem_num; //회원번호
	private int  opponent_num; //상대방 회원번호
	private String content; //내용
	private Date send_date; //발신일
	private Date read_date; //수신일
	private int read; //수신여부 
	
	
	public int getDchat_num() {
		return dchat_num;
	}
	public void setDchat_num(int dchat_num) {
		this.dchat_num = dchat_num;
	}
	public int getChatroom_num() {
		return chatroom_num;
	}
	public void setChatroom_num(int chatroom_num) {
		this.chatroom_num = chatroom_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getOpponent_num() {
		return opponent_num;
	}
	public void setOpponent_num(int opponent_num) {
		this.opponent_num = opponent_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	public Date getRead_date() {
		return read_date;
	}
	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	
	@Override
	public String toString() {
		return "ChattingVO [dchat_num=" + dchat_num + ", chatroom_num=" + chatroom_num + ", mem_num=" + mem_num
				+ ", opponent_num=" + opponent_num + ", content=" + content + ", send_date=" + send_date
				+ ", read_date=" + read_date + ", read=" + read + "]";
	}
	
}
