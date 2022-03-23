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
		return chatBoardMapper.selectList(map);
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBoard(ChatBoardVO chatboard) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(Integer chatboard_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFile(Integer chatboard_num) {
		// TODO Auto-generated method stub
		
	}

}
