package kr.spring.chat.service;

import java.util.List;
import java.util.Map;

import kr.spring.chat.vo.ChatBoardReplyVO;
import kr.spring.chat.vo.ChatBoardVO;

public interface ChatBoardService {
	public List<ChatBoardVO> selectList(Map<String,Object> map);
	public List<ChatBoardVO> selectListHit(Map<String,Object> map); 
	public int selectRowCount(Map<String,Object>map);
	public void insertBoard(ChatBoardVO chatboard);//*
	public ChatBoardVO selectBoard(Integer chatboard_num);
	public void updateHit(Integer chatboard_num);
	public void updateBoard(ChatBoardVO chatboard);
	public void deleteBoard(Integer chatboard_num);
	public void deleteFile(Integer chatboard_num);
	
	//[댓글]
	public List<ChatBoardReplyVO> selectListReply(Map<String,Object>map);
	public int selectRowCountReply(Map<String,Object> map);
	public ChatBoardReplyVO selectReply(Integer re_num);
	public void insertReply(ChatBoardReplyVO boardReply);
	public void updateReply(ChatBoardReplyVO boardReply);
	public void deleteReply(Integer re_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제 전 댓글 삭제한다
//	public void deleteReplyByBoardNum(Integer board_num); X

}
