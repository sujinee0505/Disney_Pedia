package kr.spring.chat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.chat.vo.ChatBoardReplyVO;
import kr.spring.chat.vo.ChatBoardVO;

public interface ChatBoardMapper {
	
	//**글 목록
	//xml
	public List<ChatBoardVO> selectList(Map<String,Object> map); 
	public List<ChatBoardVO> selectListHit(Map<String,Object> map); 
	//xml
	public int selectRowCount(Map<String,Object> map);

	//**글 등록 폼에서 전송된 데이터 처리 
	@Insert("INSERT INTO dchatboard (chatboard_num,mem_num,title,content,reg_date) " +
			"VALUES (dchatboard_seq.nextval,#{mem_num},#{title},#{content},SYSDATE)")
	public void insertBoard(ChatBoardVO board); 
	
	//**글 상세
	@Select("SELECT * FROM dchatboard b JOIN dmember_detail m "
			+ "ON b.mem_num=m.mem_num WHERE b.chatboard_num=#{chatboard_num}")
	public ChatBoardVO selectBoard(Integer chatboard_num);
	
	//**조회수
	@Update("UPDATE dchatboard SET hit=hit+1 WHERE chatboard_num=#{chatboard_num}")
	public void updateHit(Integer chatboard_num);//조회수
	
 
	//**글 수정
	//xml
	public void updateBoard(ChatBoardVO chatboard);

	//**글 삭제
	@Delete("DELETE FROM dchatboard WHERE chatboard_num=#{chatboard_num}")
	public void deleteBoard(Integer chatboard_num);

	/*
	//사진 업로드 안함
	@Update("UPDATE dchatboard SET uploadfile='',filename='' "
			+ "WHERE chatboard_num=#{chatboard_num}")
	public void deleteFile(Integer chatboard_num);
	*/
	
	
	/*
	//[댓글]
		//xml
		public List<ChatBoardReplyVO> selectListReply(Map<String,Object>map);
		
		@Select("SELECT COUNT(*) FROM spboard_reply b JOIN spmember m "
				+ "ON b.mem_num=m.mem_num WHERE b.board_num=#{board_num}")
		public int selectRowCountReply(Map<String,Object> map);
		
		@Select("SELECT * FROM spboard_reply WHERE re_num=#{re_num} ") //update.delete시 사용할 것(작성자와 로그인회원이 일치하는지 확인)
		public ChatBoardReplyVO selectReply(Integer re_num);
		
		//**1.댓글등록
		@Insert("INSERT INTO dchatboard_reply (re_num,re_content,chatboard_num,mem_num) "
				+ "VALUES (dchatreply_seq.nextval,#{re_content},#{chatboard_num},#{mem_num})")
		public void insertReply(ChatBoardReplyVO chatboardReply);
		
		@Update("UPDATE spboard_reply SET re_content=#{re_content},re_ip=#{re_ip},re_mdate=SYSDATE WHERE re_num=#{re_num}")
		public void updateReply(ChatBoardReplyVO chatboardReply);
		
		@Delete("DELETE FROM spboard_reply WHERE re_num=#{re_num}")
		public void deleteReply(Integer re_num);
		
		//부모글 삭제시 댓글이 존재하면 부모글 삭제 전 댓글 삭제한다(fk제약조건때문에)
		//@Delete("DELETE FROM dchatboard_reply WHERE chatboard_num=#{chatboard_num}")
		public void deleteReplyByChatBoardNum(Integer chatboard_num);
	 */	
	
	}
	

