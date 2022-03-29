package kr.spring.chat.service;

import java.util.List;
import java.util.Map;

import kr.spring.chat.vo.ChatBoardReplyVO;
import kr.spring.chat.vo.ChatBoardVO;
import kr.spring.chat.vo.ChattingVO;

public interface ChattingService {
	//[채팅]
	
	//[채팅메서드1. 채팅테이블에 채팅등록 INSERT : insertChat() ]
	public void insertChat(ChattingVO chattingVO);
	
	//public List<ChatBoardReplyVO> selectListReply(Map<String,Object>map);
	//public int selectRowCountChat(Map<String,Object> map);
	//public ChatBoardReplyVO selectChat(Integer re_num);
	//public void updateReply(ChatBoardReplyVO boardReply);
	//public void deleteReply(Integer re_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제 전 댓글 삭제한다
//	public void deleteReplyByBoardNum(Integer board_num); X

}
