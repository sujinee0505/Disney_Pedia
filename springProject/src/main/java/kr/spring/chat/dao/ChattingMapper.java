package kr.spring.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import kr.spring.chat.vo.ChattingVO;

public interface ChattingMapper {
	// ------------------댓글(Reply)_DAO------------------

	// [ 댓글 메서드1. 댓글등록 : insertChat() ]
	// [ 댓글 메서드2. 댓글 갯수 : getReplyItemCount() ]
	// [ 댓글 메서드3. 댓글 목록 : getListReplyItem() ]
	// [ 댓글 메서드4. 댓글 상세 : getReplyItem() ]
	// [ 댓글 메서드5. 댓글 수정 : updateReplyItem() ] -- 필요없음
	// [ 댓글 메서드6. 댓글 삭제 : deleteReplyItem() ] -- 필요없음

	// --------------------------------------------------

	// [채팅메서드1. 채팅테이블에 채팅등록 INSERT : insertChat() ]
	/*
	 * @Insert("INSERT INTO dchatting c JOIN Dchatboard b ON c.chatboard_num=b.chatboard_num "
	 * + "(chat_num,to_num,from_num,content,chatboard_num,send_date) " +
	 * "VALUES (Dchatting_seq.nextval,#{to_num},#{from_num},#{content},b.chatboard_num,sysdate"
	 * ) public void insertChat(ChattingVO chattingVO);
	 */
	@Insert("INSERT INTO dchatting (chat_num,to_num,from_num,content,chatboard_num,send_date) "
			+ "VALUES (dchatting_seq.nextval,#{to_num},#{from_num},#{content},#{chatboard_num},sysdate)")
	public void insertChat(ChattingVO chattingVO);

	public List<ChattingVO> getChattingDetail(ChattingVO chattingVO);
	public List<ChattingVO> getChattingList(ChattingVO chattingVO);
	// [채팅메서드2. 채팅메시지 갯수 : getCountChat() ]
	// 1)
	// public int getCountChat(int item_num)throws Exception{
	// sql = "SELECT COUNT(*) FROM OChatting WHERE item_num=?";
	// 2)
	// public int getChattingDetailCount(int item_num, int from_num, int
	// to_num)throws Exception{
	// sql = "SELECT COUNT(*) FROM ochatting
	// WHERE item_num=? AND ((from_num=? AND to_num=?) OR (from_num=? AND
	// to_num=?))";

	// [ 채팅메서드3. 채팅 목록
	// public List<OChattingVO> getChattingDetail(int item_num, int from_num, int
	// to_num)throws Exception{

	// 등등 너무 많음 미리 그냥 하나씩 하면서 추가하는 걸로

	// xml
	// public List<ChatBoardReplyVO> selectListChat(Map<String,Object>map);

	// @Select("SELECT COUNT(*) FROM spboard_reply b JOIN spmember m "
	// + "ON b.mem_num=m.mem_num WHERE b.board_num=#{board_num}")
	// public int selectRowCountChat(Map<String,Object> map);

	// @Select("SELECT * FROM spboard_reply WHERE re_num=#{re_num} ")
	// //update.delete시 사용할 것(작성자와 로그인회원이 일치하는지 확인)
	// public ChatBoardReplyVO selectReply(Integer re_num);

}
