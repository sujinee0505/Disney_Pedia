package kr.spring.chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.chat.dao.ChatBoardMapper;
import kr.spring.chat.vo.ChatBoardVO;

@Service
public class ChatBoardServiceImpl implements ChatBoardService{

	@Autowired
	private ChatBoardMapper chatBoardMapper;

	@Override
	public List<ChatBoardVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertBoard(ChatBoardVO board) {
		chatBoardMapper.insertBoard(board);
	}

	@Override
	public ChatBoardVO selectBoard(Integer board_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(Integer board_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(ChatBoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(Integer board_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(Integer board_num) {
		// TODO Auto-generated method stub
		
	}

}
