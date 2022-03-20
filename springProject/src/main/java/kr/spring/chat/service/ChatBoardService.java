package kr.spring.chat.service;

import java.util.List;
import java.util.Map;

import kr.spring.chat.vo.ChatBoardVO;

public interface ChatBoardService {
	public List<ChatBoardVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object>map);
	public void insertBoard(ChatBoardVO chatboard);//*
	public ChatBoardVO selectBoard(Integer chatboard_num);
	public void updateHit(Integer chatboard_num);
	public void updateBoard(ChatBoardVO chatboard);
	public void deleteBoard(Integer chatboard_num);
	public void deleteFile(Integer chatboard_num);
}
