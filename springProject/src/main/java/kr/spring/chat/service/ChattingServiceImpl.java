package kr.spring.chat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.chat.dao.ChattingMapper;
import kr.spring.chat.vo.ChattingVO;

@Service
public class ChattingServiceImpl implements ChattingService{
	
	@Autowired
	private ChattingMapper chattingMapper;

	@Override
	public void insertChat(ChattingVO chattingVO) {
		chattingMapper.insertChat(chattingVO);
	}
	

	
	
}
