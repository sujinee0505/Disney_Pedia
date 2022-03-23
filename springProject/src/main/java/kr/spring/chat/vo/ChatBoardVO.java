package kr.spring.chat.vo;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

public class ChatBoardVO {
	private int chatboard_num; //채팅게시글 번호
	private int mem_num; //작성회원 번호 
	@NotEmpty
	private String title; //채팅게시글 제목
	@NotEmpty
	private String content; //채팅게시글 내용
	private Date reg_date; //채팅게시글 작성일
	
	private int hit; //조회수
	private int mate_state;//0:모집중/1:모집완료
	 
	//*테이블에 없지만 JOIN해서 빈번하게 사용하므로 추가
	//@NotEmpty
	private String name; //회원이름(닉네임)
	private String photo; //회원사진
	
	public int getChatboard_num() {
		return chatboard_num;
	}
	public void setChatboard_num(int chatboard_num) {
		this.chatboard_num = chatboard_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getMate_state() {
		return mate_state;
	}
	public void setMate_state(int mate_state) {
		this.mate_state = mate_state;
	}
	
	@Override
	public String toString() {
		return "ChatBoardVO [chatboard_num=" + chatboard_num + ", mem_num=" + mem_num + ", title=" + title
				+ ", content=" + content + ", reg_date=" + reg_date + ", hit=" + hit + ", mate_state=" + mate_state
				+ ", name=" + name + ", photo=" + photo + "]";
	}
}
