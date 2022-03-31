package kr.spring.chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.chat.dao.ChatBoardMapper;
import kr.spring.chat.vo.ChatBoardReplyVO;
import kr.spring.chat.vo.ChatBoardVO;

@Service
public class ChatBoardServiceImpl implements ChatBoardService{

	@Autowired
	private ChatBoardMapper chatBoardMapper;

	@Override
	public List<ChatBoardVO> selectList(Map<String, Object> map) {
		return chatBoardMapper.selectList(map);
	}
	@Override 
	public List<ChatBoardVO> selectListHit(Map<String, Object> map) {
		return chatBoardMapper.selectListHit(map);
	}
	
	@Override
	public int selectRowCount(Map<String, Object> map) {
		return chatBoardMapper.selectRowCount(map);
	}

	@Override
	public void insertBoard(ChatBoardVO chatboard) {
		chatBoardMapper.insertBoard(chatboard);
	}

	@Override
	public ChatBoardVO selectBoard(Integer chatboard_num) {
		return chatBoardMapper.selectBoard(chatboard_num);
	}

	@Override
	public void updateHit(Integer chatboard_num) {
		chatBoardMapper.updateHit(chatboard_num);
	}

	@Override
	public void updateBoard(ChatBoardVO chatboard) {
		chatBoardMapper.updateBoard(chatboard);
	}

	@Override
	public void deleteBoard(Integer chatboard_num) {
		chatBoardMapper.deleteBoard(chatboard_num);
	}
 
	@Override
	public void deleteFile(Integer chatboard_num) {
		//chatBoardMapper.deleteFile(chatboard_num);
	}
	@Override
	public void update_mateState(Map<String, Object> map) {
		chatBoardMapper.update_mateState(map);
		
	}
	

	

	
	/*
	//[댓글]
	@Override
	public List<ChatBoardReplyVO> selectListReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int selectRowCountReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public ChatBoardReplyVO selectReply(Integer re_num) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void insertReply(ChatBoardReplyVO boardReply) {
		chatBoardMapper.insertReply(boardReply);
	}
	
	@Override
	public void updateReply(ChatBoardReplyVO boardReply) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteReply(Integer re_num) {
		// TODO Auto-generated method stub
		
	}
	*/
}
